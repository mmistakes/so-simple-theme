data {
  int<lower=1> I;               // # questions
  int<lower=1> J;               // # persons
  int<lower=1> S;               // # schools
  int<lower=1> N;               // # observations
  int<lower=1, upper=I> ii[N];  // question for n
  int<lower=1, upper=J> jj[N];  // person for n
  int<lower=1, upper=S> ss[N];  // school for n
  int<lower=0, upper=1> y[N];   // correctness for n
}
parameters {
  vector[I] beta;
  vector[J] zeta;
  vector[S] xi;
  real<lower=0> sigma[2];
}
model {
  target += normal_lpdf(zeta | 0, sigma[1]);
  target += normal_lpdf(xi | 0, sigma[2]);
  target += bernoulli_logit_lpmf(y | xi[ss] + zeta[jj] - beta[ii]);
}
