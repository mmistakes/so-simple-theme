transformed data {
  real x[5];
  real y[5];

  for (n in 1:5)
    x[n] <- n;
  
  for (n in 1:4)
    y[n] <- 2 + 3 * x[n];
}
parameters {
  real a;
  real b;
  real<lower=0> err;
}
model {
  y ~ normal(x, err);
}
