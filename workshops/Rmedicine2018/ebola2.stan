// this next line brings in the JQPDB_icdf function, among others that are not used
#include /JQPD.stan
data {
  int<lower = 1> exposed;
  int<lower = 0, upper = exposed> survived;
  
  real<lower = 0, upper = 0.5> alpha;   // low is the alpha quantile
  real<lower = 0, upper = 1> low;
  real<lower = low, upper = 1> median;
  real<lower = median, upper = 1> high; // the 1 - alpha quantile
}
parameters { real<lower = 0, upper = 1> p; }  // primitive with implicit uniform prior
transformed parameters {
  real pi = JQPDB_icdf(p, alpha, 0.0, low, median, high, 1.0); // survival probability
}
model {
  target += binomial_lpmf(survived | exposed, pi);
}
