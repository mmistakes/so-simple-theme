surgical_mortality_df <- read.csv("surgical-mortality.csv", sep=",", comment.char="#");
y <- surgical_mortality_df$y;
K <- surgical_mortality_df$K;
N <- length(y);

fit_surgical_pool <- stan("pool.stan", data = c("N", "K", "y"));

fit_surgical_no_pool <- stan("no-pool.stan", data = c("N", "K", "y"));

fit_surgical_hier <- stan("hier.stan", data = c("N", "K", "y"));
 
# fit_surgical_hier_logit <- stan("hier-logit.stan",
#                             data = c("N", "K", "y", "K_new", "y_new"));
# 
# pars_to_print <- c("p_max", "p_mean", "p_sd",
#                    "theta[1]", "theta[4]", "theta[8]", "theta[12]",
#                    "some_ability_gt_350");
# pars_to_print2 <- c(pars_to_print,
#                     "is_best[1]", "is_best[4]", "is_best[8]", "is_best[12]");
#                    
# print(fit_surgical_pool, c(pars_to_print, "phi"));
# print(fit_surgical_no_pool, pars_to_print2);
# print(fit_surgical_hier, c(pars_to_print2, "phi", "kappa"));
# print(fit_surgical_hier_logit, c(pars_to_print2, "mu", "sigma"));
