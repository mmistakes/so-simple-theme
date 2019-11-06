data {
  int<lower=0> N;              // items
  int<lower=0> K[N];           // initial trials
  int<lower=0> y[N];           // initial successes
}
parameters {
  real<lower=0, upper=1> phi;         // population chance of success
  real<lower=1> kappa;                // population concentration
  vector<lower=0, upper=1>[N] theta;  // chance of success 
}
model {
  kappa ~ pareto(1, 1.5);                        // hyperprior
  theta ~ beta(phi * kappa, (1 - phi) * kappa);  // prior
  y ~ binomial(K, theta);                        // likelihood
}
