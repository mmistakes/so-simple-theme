data {
  int<lower=0> J;
  real y[J];
  real<lower=0> sigma[J];
}
parameters {
  real mu; 
  real<lower=0> tau;
  real theta[J];
}
model {
  for (j in 1:J)
    y[j] ~ normal(theta[j], sigma[j]);
  for (j in 1:J)
    theta[j] ~ normal(mu, tau);
}
