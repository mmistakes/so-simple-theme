data {
  int<lower=1> N;                    // number of observations
  vector[N] age;                     // age relative to average
  vector[N] income;                  // income relative to average
  int<lower = 0, upper = 1> vote[N]; // yes or no outcome
}
parameters {
  real alpha; // intercept for log-odds of voting
  real beta;  // slope of income in log-odds of voting
  // intercept and slope for income's effect on the slope of age
  vector[2] lambda;
}
model {
  vector[N] beta_age = lambda[1] + lambda[2] * income;
  vector[N] eta = alpha + beta * income + beta_age .* age;
  target += bernoulli_logit_lpmf(vote | eta);
  // priors on alpha, beta, lambda[1], and lambda[2]
}
