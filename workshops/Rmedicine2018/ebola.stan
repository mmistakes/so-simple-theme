data {
  int<lower = 1> exposed;
  int<lower = 0, upper = exposed> survived;
  real<lower = 1> alpha;
  real<lower = 1> beta;
}
transformed data { // this block is only executed once
  int died = exposed - survived;
  real constant_1 = lchoose(exposed, survived); // log of binomial coefficient
  real constant_2 = -lbeta(alpha, beta);        // negative log of beta function
}
parameters { real<lower = 0, upper = 1> pi; }   // survival probability
model {
  real log_pi = log(pi);
  real log_1mpi = log1m(pi);
  target += constant_1 + survived * log_pi + died * log_1mpi; // binomial_lpmf(suvived | exposed, pi)
  target += constant_2 + (alpha - 1) * log_pi + (beta - 1) * log_1mpi; // beta_lpdf(pi | alpha, beta)
}
generated quantities { real odds = pi / (1 - pi); }
