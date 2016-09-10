// Hierarchical Logistic Regression
// One level, non-centered parameterization

data {
  int<lower=1> n_individuals;
  vector[n_individuals] x;
  int y[n_individuals];

  int<lower=1> n_income;
  int<lower=1, upper=n_income> income[n_individuals];
}

parameters {
  real mu_alpha;
  real<lower=0> sigma_alpha;
  vector[n_income] alpha_income_tilde;

  real mu_beta;
  real<lower=0> sigma_beta;
  vector[n_income] beta_income_tilde;
}

transformed parameters {
  vector[n_income] alpha_income;
  vector[n_income] beta_income;

  for (n in 1:n_income) {
    alpha_income[n] = mu_alpha + sigma_alpha * alpha_income_tilde[n];
    beta_income[n] = mu_beta + sigma_beta * beta_income_tilde[n];
  }
}

model {
  vector[n_individuals] indv_alpha;
  vector[n_individuals] indv_beta;

  mu_alpha ~ normal(0, 2.5);
  sigma_alpha ~ cauchy(0, 2.5);
  alpha_income_tilde ~ normal(0, 1);

  mu_beta ~ normal(0, 2.5);
  sigma_beta ~ cauchy(0, 2.5);
  beta_income_tilde ~ normal(0, 1);

  for (n in 1:n_individuals) {
    indv_alpha[n] = alpha_income[income[n]];
    indv_beta[n] = beta_income[income[n]];
  }

  y ~ bernoulli_logit(indv_beta .* x + indv_alpha);
}

generated quantities {
  vector[n_income] p_income_ppc;
  p_income_ppc = rep_vector(0, n_income);

  {
    vector[n_income] income_counts;
    income_counts = rep_vector(0, n_income);

    for (n in 1:n_individuals) {
      real alpha;
      real beta;

      alpha = mu_alpha + alpha_income[income[n]];
      beta = mu_beta + beta_income[income[n]];

      if (bernoulli_rng(inv_logit(  beta * x[n] + alpha)))
        p_income_ppc[income[n]] = p_income_ppc[income[n]] + 1;
      income_counts[income[n]] = income_counts[income[n]] + 1;
    }

    p_income_ppc = p_income_ppc ./ income_counts;
  }
}
