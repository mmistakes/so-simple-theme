data {
  int N;
  vector[N] x;
  vector[N] y;
}
parameters {
  real a;
  real b;
  real<lower = 0> sigma;
}
model {
  // bonus: priors
  y ~ normal(a + b * x, sigma);
}
