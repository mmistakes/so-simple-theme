data {
  int<lower=0> N;
  int<lower=0> N_edges;
  int<lower=1, upper=N> node1[N_edges];  // node1[i] adjacent to node2[i]
  int<lower=1, upper=N> node2[N_edges];  // and node1[i] < node2[i]

  int<lower=0> y[N];              // count outcomes
  vector<lower=0>[N] E;           // exposure
}
transformed data {
  vector[N] log_E = log(E);
}
parameters {
  real alpha;             // intercept
  real<lower=0> sigma;    // overall standard deviation
  vector[N - 1] phi_raw;  // raw spatial effects
}
transformed parameters {
  vector[N] phi;
  phi[1:(N - 1)] = phi_raw;
  phi[N] = -sum(phi_raw);
}
model {
  y ~ poisson_log(log_E + alpha + phi * sigma);

  // This is the prior for phi! (up to proportionality)
  target += -0.5 * dot_self(phi[node1] - phi[node2]);
  alpha ~ normal(0.0, 2.5);
  sigma ~ normal(0.0, 5.0);
}
generated quantities {
  vector[N] mu = exp(log_E + alpha + phi * sigma);
}
