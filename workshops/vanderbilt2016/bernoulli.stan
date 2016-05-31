data {
  int N;
  int<lower = 0, upper = 1> y[N];
}
parameters {
  real<lower = 0, upper = 1> p;
}
model {
  y ~ bernoulli(p);
}
