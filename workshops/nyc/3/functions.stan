functions {
  vector two_times(vector x) {
    return 2.0 * x;
  }

  vector linear_model(real a, vector b, matrix X) {
    return a + X * b;
  }
}
data {
  int N;
  int K;
  matrix[N, K] X;
  vector[N] y;
}
parameters {
  real a;
  vector[K] b;
  real<lower=0> sigma;
}
model {
  y ~ normal(linear_model(a, b, X), sigma);
}
  
