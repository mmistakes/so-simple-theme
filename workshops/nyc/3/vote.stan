// Hierarchical Logistic Regression
// Multilevel, non-centered parameterization
data {
  int<lower=0> N; # Number of voters
  int y[N];       # Republican vote

  int<lower=0> N_state; # State
  int state[N];

  int<lower=0> N_eth;   # Ethnicity
  int eth[N];

  int<lower=0> N_inc;   # Income
  int inc[N];
  
  int<lower=0> N_age;   # Age
  int age[N];
  
  int<lower=0> N_sex;   # Sex
  int sex[N];
  
  int<lower=0> N_edu;   # Education
  int edu[N];
}
parameters {
  real alpha;
  vector[N_state] alpha_state;
  vector[N_eth] alpha_eth;
  vector[N_inc] alpha_inc;
  vector[N_age] alpha_age;
  vector[N_sex] alpha_sex;
  vector[N_edu] alpha_edu;
  
  real<lower=0> sigma_alpha[M];    # Local parameter standard deviation
  real<lower=0> sigma_sigma_alpha; # Global standard deviation
}
model {
  vector[N] voter_alpha_state;
  vector[N] voter_alpha_eth;
  vector[N] voter_alpha_inc;
  vector[N] voter_alpha_age;
  vector[N] voter_alpha_sex;
  vector[N] voter_alpha_edu;

  sigma_sigma_alpha ~ cauchy(0, 2.5);
  sigma_alpha ~ cauchy(0, 1);

  alpha_state ~ normal(0, 1);
  alpha_eth ~ normal(0, 1);
  alpha_inc ~ normal(0, 1);
  alpha_age ~ normal(0, 1);
  alpha_sex ~ normal(0, 1);
  alpha_edu ~ normal(0, 1);
  
  for (n in 1:N) {
    voter_alpha_state[n] <- alpha_state[state[n]];
    voter_alpha_eth[n] <- alpha_eth[eth[n]];
    voter_alpha_inc[n] <- alpha_inc[inc[n]];
    voter_alpha_age[n] <- alpha_age[age[n]];
    voter_alpha_sex[n] <- alpha_sex[sex[n]];
    voter_alpha_edu[n] <- alpha_edu[edu[n]];
  }

  y ~ bernoulli_logit(alpha
                      + voter_alpha_state * sigma_alpha[1] * sigma_sigma_alpha
                      + voter_alpha_eth * sigma_alpha[2] * sigma_sigma_alpha
                      + voter_alpha_inc * sigma_alpha[3] * sigma_sigma_alpha
                      + voter_alpha_age * sigma_alpha[4] * sigma_sigma_alpha
                      + voter_alpha_sex * sigma_alpha[5] * sigma_sigma_alpha
                      + voter_alpha_edu * sigma_alpha[6] * sigma_sigma_alpha);

}
