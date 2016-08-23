library(rstan)
rstan_options(auto_writer = TRUE)
options(mc.cores = parallel::detectCores())


J <- 8
y <- c(28, 8, -3, 7, -1, 1, 18, 12)
sigma <- c(15, 10, 16, 11, 9, 11, 10, 18)


fit <- stan("eight_schools.stan")
