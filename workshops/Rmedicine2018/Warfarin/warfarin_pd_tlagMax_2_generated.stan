functions {

/**
 * turn a slicing variable for a ragged array
 * S = {5, 6, 11}
 * into
 * Si = {0, 5, 5 + 6, 5+6+11} + 1
 * such that we can index the ragged array A as
 * A[Si[u] : Si[u+1]-1]
 * for the uth unit
 */
int[] make_slice_index(int[] S) {
  int Si[size(S)+1];
  int cv = 1;
  Si[1] = cv;
  for(i in 1:size(S)) {
    cv = cv + S[i];
    Si[i+1] = cv;
  }
  return(Si);
}

/**
 * calculate the absolute value of a - b in log-space with log(a)
 * and log(b) given. Does so by squaring and taking the root, i.e.
 *   la = log(a)
 *   lb = log(b)
 * sqrt( (a - b)^2 ) = sqrt( a^2 - 2 * a * b + b^2 )
 * <=> 0.5 * log_diff_exp(log_sum_exp(2*la, 2*lb), log(2) + la + lb)
 */
real log_diff_exp_abs(real la, real lb) {
  return(0.5 * log_diff_exp(log_sum_exp(2*la, 2*lb), log(2) + la + lb));
}



real gamma2_overdisp_lpdf(vector y, vector mu, real sigma, real kappa) {
  int N = rows(y);
  vector[N] muSq = square(mu);
  vector[N] sigmaSq = square(sigma) + muSq / kappa;
  return gamma_lpdf(y| muSq ./ sigmaSq, mu ./ sigmaSq);
}

real gamma2_overdisp_array_lpdf(real[] y, vector mu, real sigma, real kappa) {
  int N = size(y);
  vector[N] muSq = square(mu);
  vector[N] sigmaSq = square(sigma) + muSq / kappa;
  return gamma_lpdf(y| muSq ./ sigmaSq, mu ./ sigmaSq);
}

real gamma2_overdisp_cdf(real y, real mu, real sigma, real kappa) {
  real muSq = square(mu);
  real sigmaSq = square(sigma) + muSq / kappa;
  return gamma_cdf(y, muSq ./ sigmaSq, mu ./ sigmaSq);
}

real gamma2_overdisp_rng(real mu, real sigma, real kappa) {
  real muSq = square(mu);
  real sigmaSq = square(sigma) + muSq / kappa;
  return gamma_rng(muSq ./ sigmaSq, mu ./ sigmaSq);
}

  vector pk_1cmt_oral(vector tad, real ldose, real lka, real lCL, real lV) {
    real lk = lCL - lV;
    real k = exp(lk);
    real ka = exp(lka);
    real lkdelta = log_diff_exp_abs(lka, lk);
    real lscale = ldose - lV + lka - lkdelta;
    int N = num_elements(tad);
    vector[N] pk;

    for(i in 1:N) {
      pk[i] = lscale + log_diff_exp_abs(-k * tad[i], -ka * tad[i]);
    }

    return(pk);
  }

  // this version expects that the lag time is never greater than the
  // first tad time.
  vector pk_1cmt_oral_tlagMax(vector tad, real ldose, real llag, real lka, real lCL, real lV) {
    int k = 0;
    int N = num_elements(tad);
    real lag = exp(llag);
    vector[N] pk;

    if(lag > tad[1])
      reject("Tlag must not exceed first observation");
 
    return pk_1cmt_oral(tad - lag, ldose, lka, lCL, lV);
  }

// this version skips according to llag the first elements of tad
// (better use this if llag and tad is data only)
  vector pk_1cmt_oral_tlag(vector tad, real ldose, real llag, real lka, real lCL, real lV) {
    int k = 0;
    int N = num_elements(tad);
    real lag = exp(llag);
    vector[N] pk;
 
    // find out which elements have to be skipped due to lag
    while(tad[k+1] < lag && k+1 != N) {
      k = k + 1;
      pk[k] = -25;
    }

    pk[k+1:N] = pk_1cmt_oral(tail(tad, N-k) - lag, ldose, lka, lCL, lV);
    return(pk);
  }

// work around the problem that we do not want things to land on the AD stack
  real pk_1cmt_oral_t(real tad, real ldose, real lka, real lCL, real lV) {
    real lk = lCL - lV;
    real k = exp(lk);
    real ka = exp(lka);
    real lkdelta = log_diff_exp_abs(lka, lk);
    real lscale = ldose - lV + lka - lkdelta;
    return lscale + log_diff_exp_abs(-k * tad, -ka * tad);
  }
  real pk_1cmt_oral_tlag_t(real t, real ldose, real llag, real lka, real lCL, real lV) {
    real lag = exp(llag);
    if (t < lag)
      return -25;
    return pk_1cmt_oral_t(t-lag , ldose, lka, lCL, lV);
  }

  real[] turnover_kin_inhib_2(real t, real[] R, real[] theta, real[] x_r, int[] x_i) {
    //real ldose = x_r[1];
    //real llag = x_r[2];
    //real lka = x_r[3];
    //real lCl = x_r[4];
    //real lV = x_r[5];
    real lconc = pk_1cmt_oral_tlag_t(t, x_r[1], x_r[2], x_r[3], x_r[4], x_r[5]);
    real lkout = -theta[2];
    real lkin = theta[1] + lkout;
    real lEC50 = theta[3];
    real lS = log_inv_logit(lconc - lEC50);
    
    // dRdt = kin * (1 - C/(C + EC50)) - R * kout
    return { exp(lkin + log1m_exp(lS)) - R[1] * exp(lkout) };
  }
}
data {
  int<lower=1> J;
  vector<lower=0>[J] dose;
  int<lower=1> N[J];
  vector<lower=0>[sum(N)] dv;
  real<lower=0> time[sum(N)];
  matrix[4,J] Eta_est;
  real<lower=0> ref;
}
transformed data {
  int Ndv = sum(N);
  int x_i[J,0];
  int sidx[J+1] = make_slice_index(N);
  real x_r[J,5];
  real t0 = -1E-4;
  real refSq = square(ref);

  for(j in 1:J) {
    x_r[j,1] = log(dose[j]);
    x_r[j,2:5] = to_array_1d(Eta_est[:,j]);
  }
}
parameters {
  // log for 1-R0=kin/kout, 2-1/kout, 3-EC50
  vector[3] theta;

  matrix[J,3] Eta;
  vector<lower=0>[3]  sigma_eta;

  real<lower=0> sigma_y;
  real<lower=0> kappa;
}
transformed parameters {
  matrix[J,3] Eta_cov;
  vector[Ndv] mu;

  Eta_cov[:,1] = theta[1] + sigma_eta[1] * Eta[:,1];
  Eta_cov[:,2] = theta[2] + sigma_eta[2] * Eta[:,2];
  Eta_cov[:,3] = theta[3] + sigma_eta[3] * Eta[:,3];

  // loop over each subject and evaluate PD model
  for(j in 1:J) {
    int start = sidx[j];
    int end   = sidx[j+1]-1;
    real theta_j[3] = to_array_1d(Eta_cov[j]);
    real initial[1] = { exp(Eta_cov[j,1]) };
    real mu_temp[N[j],1] = integrate_ode_rk45(turnover_kin_inhib_2,
                                              initial, t0,
					      time[start:end],
					      theta_j,
					      x_r[j], x_i[j],
					      1E-5, 1E-3, 500
					      );
    mu[start:end] = to_vector(mu_temp[:,1]);
  }
}
model {
  theta[1] ~ normal(log(80),   log(10)/1.96);
  theta[2] ~ normal(log(30),   log(10)/1.96);
  theta[3] ~ normal(log( 2.5), log(10)/1.96);
  
  sigma_eta ~ normal(0, 0.5);
  kappa ~ gamma(0.2, 0.2);

  to_vector(Eta) ~ normal(0,1);

  sigma_y ~ normal(0, 10);

  dv ~ gamma2_overdisp(mu, sigma_y, kappa * refSq);
}
generated quantities {
  real R0 = exp(theta[1]);
  real kin = exp(theta[1] - theta[2]);
  real kout = exp(-theta[2]);
  real EC50 = exp(theta[3]);
  vector[Ndv] ypred;
  vector[Ndv] ypred_cond;
  vector[Ndv] log_lik;
  vector[J] log_lik_patient;
  real sigma_y_ref = sqrt(square(sigma_y) + 1.0/kappa);

  for(o in 1:Ndv) {
    log_lik[o] = gamma2_overdisp_lpdf( dv[o:o] | mu[o:o], sigma_y, kappa * refSq);
    ypred_cond[o] = gamma2_overdisp_rng(mu[o], sigma_y, kappa * refSq);
  }

  for(j in 1:J) {
    int start = sidx[j];
    int end   = sidx[j+1]-1;
    real eta_cov_j[3] = to_array_1d(multi_normal_cholesky_rng(theta, diag_matrix(sigma_eta)));
    real initial[1] = { exp(eta_cov_j[1]) };
    real mu_temp[N[j],1] = integrate_ode_rk45(turnover_kin_inhib_2,
                                              initial, t0,
					      time[start:end],
					      eta_cov_j,
					      x_r[j], x_i[j],
					      1E-5, 1E-3, 500
					      );
    vector[N[j]] mu_pred = to_vector(mu_temp[:,1]);

    log_lik_patient[j] = gamma2_overdisp_lpdf(dv[start:end]| mu_pred, sigma_y, kappa * refSq);
    for(k in 1:N[j]){
      ypred[start + k - 1] = gamma2_overdisp_rng(mu_pred[k], sigma_y, kappa * refSq);
    }
  }
}
