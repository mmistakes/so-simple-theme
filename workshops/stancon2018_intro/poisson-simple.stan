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
  int y_rep[N];       // Draws from posterior predictive dist
  for (n in 1:N) {
    y_rep[n] = poisson_rng(lambda);
  }
}
