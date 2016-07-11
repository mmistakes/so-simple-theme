data {
  int<lower=1> I;               // # questions
  int<lower=1> J;               // # persons
  int<lower=1> N;               // # observations
  int<lower=1, upper=I> ii[N];  // question for n
  int<lower=1, upper=J> jj[N];  // person for n
  int<lower=0, upper=1> y[N];   // correctness for n
}
parameters {
  vector[I] beta;
  vector[J] theta;
  real<lower=0> sigma;
}
model {
  target += normal_lpdf(beta | 0, 5);
  target += normal_lpdf(theta | 0, sigma);
  target += exponential_lpdf(sigma | .1);
  target += bernoulli_logit_lpmf(y | theta[jj] - beta[ii]);
}
