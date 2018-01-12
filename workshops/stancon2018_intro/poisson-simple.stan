/* Stan program 
 * for simple Poisson model
 */
data {
  int<lower=1> N;      // Number of observations
  int<lower=0> y[N];   // Count data (integer array)
}
parameters {
  real<lower=0> lambda;  // Poisson rate/mean parameter (must be positive)
}
model {
  lambda ~ exponential(0.2);
  y ~ poisson(lambda);
}
generated quantities {
  int y_rep[N];    // Draws from posterior preditive dist
  real log_lik[N]; // Pointwise log-likelihood contributions
  
  for (n in 1:N) {
    // Draw from posterior predictive distribution
    y_rep[n] = poisson_rng(lambda);
    
    // Compute and store the log-likelihood contribution of each observation
    // (this will be used for the last section of the R markdown document
    // which deals with predictive performance)
    log_lik[n] = poisson_lpmf(y[n] | lambda);
  }
}
