data {
  int<lower=1> N; // number of observations
  int<lower=1> K; // number of predictors
  matrix[N, K] X; // design matrix
  vector[N]    y; // outcomes
  real<lower=0> prior_scale; // hyperparameter
}
transformed data {
  vector[N] log_y;
  log_y = log(y);
}
parameters {
  vector[K] beta;
  real<lower=0> sigma_unscaled; // Jacobian handled automatically here
}
transformed parameters {
  real<lower=0> sigma;
  sigma = sigma_unscaled * prior_scale;
}
model {
  vector[N] eta;
  eta = X * beta;
  target += normal_lpdf(log_y | eta, sigma);      // likelihood of log(y)
  target += normal_lpdf(beta | 0, 5);             // prior for each beta_k
  target += exponential_lpdf(sigma_unscaled | 1); // prior for sigma_unscaled
}
generated quantities {
  vector[N] y_rep; // posterior beliefs about each y[n]
  for (n in 1:N) y_rep[n] = normal_rng(X[n,] * beta, sigma);
}
