data {
  int<lower=0> N;          // items
  int<lower=0> K[N];       // initial trials
  int<lower=0> y[N];       // initial successes
}
parameters {
  vector<lower=0, upper=1>[N] theta; // chance of success
}
model {
  y ~ binomial(K, theta);  // likelihood
}
