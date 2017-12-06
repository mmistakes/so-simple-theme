data {
  int N; //number of observations
  vector[N] x; // single co-variate
  vector[N] y;  // vector of N observations
}
parameters {
  real<lower=0> sigma ;
  real alpha;
  real beta;
}
model {
  y ~ normal(alpha + x * beta, sigma) ; // vectorized likelihood
  alpha ~ normal(0, 5);
  beta ~ normal(0, 5);
  sigma ~ cauchy(0, 2.5) ;
}
generated quantities {
  // Here we do the simulations from the posterior predictive distribution
  vector[N] y_rep ; // vector of same length as the data y
  for (n in 1:N) 
    y_rep[n] = normal_rng(alpha + x[n] * beta, sigma) ;
}

