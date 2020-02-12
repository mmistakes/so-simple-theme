library("rstan")

alpha <- 2
beta <- 3
sigma <- 5
N <- 100
x <- runif(N, 0, 10)
y <- rnorm(N, alpha + beta*x, sigma)
stan_data <- list(N=N, x=x, y=y)

model <- stan_model("linear_regression_1.stan")
fit <- sampling(model, data=stan_data)
print(fit)

cat(
    "alpha =", alpha, "\n",
    "beta =", beta, "\n",
    "sigma =", sigma, "\n"
)