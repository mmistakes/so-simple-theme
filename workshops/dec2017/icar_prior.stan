data {
  int<lower=0> N;
  int<lower=0> N_edges;
  int<lower=1, upper=N> node1[N_edges];  // node1[i] adjacent to node2[i]
  int<lower=1, upper=N> node2[N_edges];  // and node1[i] < node2[i]
}
parameters {
  vector[N - 1] phi_raw;
}
transformed parameters {
  vector[N] phi;
  phi[1:(N - 1)] = phi_raw;
  phi[N] = -sum(phi_raw);
}
model {
  target += -0.5 * dot_self(phi[node1] - phi[node2]);
}
