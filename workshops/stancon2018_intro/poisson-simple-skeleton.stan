/* Skeleton of Stan program 
 * for simple Poisson model
 */
functions {
  
}
data {
  int<lower=1> N; // Number of observations
  int<lower=0> y[N]; // Array of count data
}
parameters {
  // Poisson rate/mean parameter (must be positive real number)
  real<lower=0> lambda;
}
model {
  // Prior and likelihood
  y ~ poisson(lambda);
  lambda ~ exponential(0.2);
}
generated quantities {
  // Simulate from posterior predictive distribution
  int<lower=0> y_rep[N]; // Array of count data
  for (n in 1:N) {
    y_rep[n] = poisson_rng(lambda);
  }
}
