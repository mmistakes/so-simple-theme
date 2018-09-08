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
