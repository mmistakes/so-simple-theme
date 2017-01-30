// Logistic Regression

data {
  int<lower=1> n_individuals;
  vector[n_individuals] x;
  int y[n_individuals];
}

parameters {
  real beta;
  real alpha;
}

model {
  beta ~ normal(0, 5);
  alpha ~ normal(0, 5);

  y ~ bernoulli_logit(beta * x + alpha);
}

generated quantities {
  real p_ppc;
  p_ppc = 0;

  for (n in 1:n_individuals) {
    int y_ppc;
    y_ppc = bernoulli_rng(inv_logit(beta * x[n] + alpha));
    if (y_ppc == 1) p_ppc = p_ppc + 1;
  }

  p_ppc = p_ppc / n_individuals;
}
