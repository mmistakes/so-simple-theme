## some utility functions & libraries
library(ggplot2)
library(rstan)
library(bayesplot)
rstan_options(auto_write = TRUE)

theme_set(theme_bw())

relabel <- function(x) match(x, unique(x))

inv_logit <- function(l) 1/(1+exp(-l))

stan_generate_model <- function(file, ..., postfix="_generated") {
    generated_file <- gsub(".stan$", paste0(postfix, ".stan"), file)
    stan_model <- stanc_builder(file, ...)
    cat(stan_model$model_code, file=generated_file)
    cat("\n", file=generated_file, append=TRUE)
    generated_file
}

calc_npde <- function(y, ypred) {
    qnorm(colMeans(sweep(ypred, 2, y) > 0))
}
