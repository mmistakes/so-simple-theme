## ---- pk-init ----
library(rstan)
library(bayesplot)
source("munge.R")

inits_pk <-function(){
  list(theta=rnorm(4, c(-1, -1, 0, 3), 0.25),
       sigma_y=abs(rnorm(1, 0, 1)),
       sigma_eta=abs(rnorm(4, 0, 2)),
       Eta=matrix(rnorm(4*J, 0, 0.25), 4, J)
       )
}


pk_model_gen <- stan_generate_model("warfarin_pk_tlagMax.stan")
pk_model <- stan_model(pk_model_gen)

pk_fit <- sampling(pk_model
                   ,data=c(stan_data_pk, list(ref=5, tlag_max=1.0))
                   ,chains=4
                   ,cores=4
                   ,init=inits_pk
                   ,open_progress=FALSE)


pop_pars <- c("theta", "sigma_eta", "sigma_y", "sigma_y_ref")
print(pk_fit, pars=pop_pars)

pop_pars_pk <- c("tlag", "ka", "CL", "V", "sigma_eta", "sigma_y", "sigma_y_ref")
print(pk_fit, pars=pop_pars_pk)

pk_post <- extract(pk_fit, pars=c("mu", "ypred", "ypred_cond", "Eta_cov"))

## ---- pk-post-4 ----
pk_sub <- pk$oid %in% 1:4
with(pk, ppc_ribbon_grouped(dv[pk_sub], pk_post$ypred_cond[,pk_sub], time[pk_sub], label[pk_sub], facet_args=list(scales="fixed"), alpha=0.6) +
         xlab("Time after dose [h]") +
         ggtitle("Warfarin concentration in blood after oral 1.5mg/kg dose",
                 "Posterior predictive and data for 4 patients") +
         legend_none())

## ---- pk-post-all ----
with(pk, ppc_ribbon_grouped(dv, pk_post$ypred_cond, time, label, facet_args=list(scales="fixed"))  + legend_none())

## ---- pk-post-pop ----
pk_post_pred <- cbind(pk, with(pk, ppc_ribbon_data(dv, pk_post$ypred, time)))
ggplot(pk_post_pred, aes(time, dv, group=oid)) +
    geom_ribbon(aes(ymin=lo, ymax=hi), fill="grey80") + geom_line() +
    ylab(NULL) + xlab("Time after dose [h]") +
    ggtitle("Warfarin concentration in blood after oral 1.5mg/kg dose",
            "Posterior predictive for population and raw patient data") +
    theme_default()

## ---- pk-diagnostic ----
pk_diag <- transform(pk, ipre=colMeans(pk_post$mu),
                     pres=calc_npde(dv, pk_post$ypred),
                     ires=calc_npde(dv, pk_post$ypred_cond))

qplot(dv, ipre, data=pk_diag) + geom_abline()

ggplot(pk_diag, aes(time, dv)) + geom_point() + geom_line(aes(y=ipre, group=id))

ggplot(pk_diag, aes(time, dv)) + geom_point() + geom_line(aes(y=ipre, group=id)) + facet_wrap(~id)

ggplot(subset(pk_diag, oid %in% 1:4), aes(time, dv)) +
    geom_point() + geom_line(aes(y=ipre, group=id)) + facet_wrap(~id)

qplot(time, ires, data=pk_diag) + geom_smooth(se=FALSE) +
    geom_hline(yintercept=c(-1.96,0,1.96))

qplot(time, pres, data=pk_diag) + geom_smooth(se=FALSE) +
    geom_hline(yintercept=c(-1.96,0,1.96))


pdf("pk_subjects.pdf", 10, 10)
qplot(time, dv, data=pk_diag, group=id, log="y", geom="point") + facet_wrap(~label) +
    geom_line(aes(y=ipre))
qplot(time, dv, data=pk_diag, group=id, geom="point") + facet_wrap(~label) +
    geom_line(aes(y=ipre))
dev.off()

## save median of individual parameters for PD fit
Eta_cov_est <- apply(pk_post$Eta_cov, c(2,3), median)
saveRDS(Eta_cov_est, "Eta_cov_est.rda")

