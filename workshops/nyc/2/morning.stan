data {
  int<lower=1> N;
  int<lower=0> y[N];
}
parameters {
  real<lower=0> lambda;
  real<lower=0, upper=1> theta;
}
model {
  for (n in 1:N) {
    
    if (y[n] == 0)
      increment_log_prob(log(theta
                             + (1-theta)
                             * exp(poisson_log(y[n], lambda))));
    else
      increment_log_prob(log((1-theta)
                             * exp(poisson_log(y[n], lambda))));
  }
}
generated quantities {
  int y_rep[N];
  for (n in 1:N) {
    if (bernoulli_rng(theta) == 1)
      y_rep[n] <- 0;
    else 
      y_rep[n] <- poisson_rng(lambda);
  }
}
