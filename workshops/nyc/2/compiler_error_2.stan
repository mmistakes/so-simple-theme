data {
  int N;
  int M;
  int y[N];
  matrix[N, M] x;
}
parameters{
  vector[M] beta;
  real sigma;
}
model {
  y ~ normal(X * beta, sigma);
}
