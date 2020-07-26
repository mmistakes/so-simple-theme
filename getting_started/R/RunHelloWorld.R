library(cmdstanr)

set_cmdstan_path("~/cmdstan-2.22.1/")

model = cmdstan_model(paste(root,"stan",sep="."))

fit <- model$sample(data = data1)