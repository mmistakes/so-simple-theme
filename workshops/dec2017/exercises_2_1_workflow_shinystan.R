#Generate fake data (in R):
N <- 100 # Number of observations 
alpha = 2;  ## intercept
beta = 0.5; ## covariate
sigma = 1;
x = rnorm(N, 0, 1);
y = rnorm(N, mean=(alpha + x * beta), sd = sigma);


# visual check
plot(x,y);
abline(lsfit(x,y), col="blue");

# fit Stan model, launch shinystan

library(rstan)
library(shinystan)

lm_fit <- stan(file = "lm.stan", data = list(N, x, y), iter=500);
launch_shinystan(lm_fit)
