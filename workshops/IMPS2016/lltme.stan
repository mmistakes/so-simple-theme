data {
  int<lower=1> I;               // # questions
  int<lower=1> J;               // # persons
  int<lower=1> N;               // # observations
  int<lower=1, upper=I> ii[N];  // question for n
  int<lower=1, upper=J> jj[N];  // person for n
  int<lower=0, upper=1> y[N];   // correctness for n
  int<lower=1> K;               // # item predictors
  matrix[I,K] X;                // Item predictor matrix
}
parameters {
  vector[J] theta;
  vector[K] beta;
  vector[I] epsilon;
  real<lower=0> sigma;
  real<lower=0> tau;
}
transformed parameters {
  vector[I] delta;
  delta = X*beta + epsilon;
}
model {
  target += normal_lpdf(theta | 0, sigma);
  target += normal_lpdf(epsilon | 0, tau);
  target += bernoulli_logit_lpmf(y | theta[jj] - delta[ii]);
}
generated quantities {
  real rsq;
  rsq = variance(X*beta) / (variance(X*beta) + tau^2);
}
