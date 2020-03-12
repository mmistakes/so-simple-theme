library("rstan")
library("cmdstanr")
set_cmdstan_path("~/cmdstan-2.22.1/") # set to your local install of cmdstan
setwd("~/git/stan-dev.github.io/test/regression_1") #set to where the folder containing this file

#Run from command line: Rscript regression_1.R

#generate data
alpha <- 2
beta <- 3
sigma <- 5
N <- 100
x <- runif(N, 0, 10)
y <- rnorm(N, alpha + beta*x, sigma)
stan_data <- list(N=N, x=x, y=y)

dump(c('N','x','y'),file="stan_data.Rdump")

model = cmdstan_model('regression_1.stan')

fit <- model$sample(data = stan_data,num_chains=4)
csv_summary <- paste(capture.output(print(rstan::read_stan_csv(fit$output_files()))),
                     collapse="\n")
writeLines(csv_summary)


