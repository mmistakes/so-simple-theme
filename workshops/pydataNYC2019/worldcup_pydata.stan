data {
  int<lower=0> I;     // number of teams
  vector[I] spi;      // per-team ranking
  int<lower=0> N;     // number of matches
  int team_1[N];      // per-match data
  int team_2[N];
  vector[N] score_1;
  vector[N] score_2;
}
transformed data {
  vector[N] y = score_1 - score_2;  // match outcome
  vector[I] spi_std;                // standardize SPI
  real spi_mean = mean(spi);
  real spi_sd = sd(spi);
  for (i in 1:I) {
    spi_std[i] = (spi[i] - spi_mean)/spi_sd;
  }
}
parameters {
  vector[I] alpha;         // per-team - "random effects"
  real beta;               // shared - "group effects"
  real<lower=0> sigma_a;   // scale of per-team variation
  real<lower=0> sigma_y;   // noise term in our estimate
}
transformed parameters {
  vector[I] ability = alpha * sigma_a + beta * spi_std;
}
model {
  y ~ normal(ability[team_1] - ability[team_2], sigma_y);

  alpha ~ normal(0, 1); // priors on all parameters
  beta ~ normal(0, 2.5);
  sigma_a ~ normal(0, 2.5);
  sigma_y ~ normal(0, 2.5);
}
generated quantities {
  // posterior predictive check
  // generate replicated data using estimated parameters
  vector[N] y_rep;
  for (n in 1:N) {
    y_rep[n] = normal_rng(ability[team_1[n]] - ability[team_2[n]], sigma_y);
  }
}
