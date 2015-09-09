// funnel.stan
parameters {  
  real y_raw;
  vector[9] x_raw;
}
transformed parameters {
  real y;
  vector[9] x;

  y <- 3.0 * y_raw;  
  x <- exp(y/2) * x_raw;
}
model {
  y_raw ~ normal(0, 1); // implies y ~ normal(0, 3) 
  x_raw ~ normal(0, 1); // implies x ~ normal(0, exp(y/2))  
}
