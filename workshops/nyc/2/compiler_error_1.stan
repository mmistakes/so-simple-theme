data {
  int N
  int y[N]
}
model {
  y ~ bernoulli(theta);
}
