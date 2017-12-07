data {
  int<lower=0> N;
  int<lower=0> y[N];              // count outcomes
  vector<lower=0>[N] E;           // exposure
}
transformed data {
  vector[N] log_E = log(E);
}
parameters {
  real alpha;                // intercept
}
model {
  y ~ poisson_log(log_E + alpha);
  alpha ~ normal(0.0, 2.5);
}
generated quantities {
  vector[N] mu = exp(log_E + alpha);
}
