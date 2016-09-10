library(rstan)
library(shinystan)

setwd('current_working_dir')

# Input the data from a file
input_data <- read_rdump('hierarchical_logistic_regression.data')
names(input_data)

# Fit the model and the store the results in a "stan fit" object
fit <- stan(file='logistic_regression.stan', data=input_data,
            iter=2000, chains=2, seed=4938483)

# We can look at the fit interactively
launch_shinystan(fit)

# We can also extract parameters explicitly to make our own plots
params = extract(fit)

hist(params$p_ppc, main="", xlab="p_ppc")
abline(v=sum(input_data$y) / input_data$n_individuals, col=2, lty=1)

# Sometimes we need to run with custom sampler parameters,
fit <- stan(file='logistic_regression.stan', data=input_data,
            iter=2000, chains=2, seed=4938483,
            control=list(adapt_delta=0.85))