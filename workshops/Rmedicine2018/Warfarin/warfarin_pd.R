## ---- pd-init ----
library(rstan)
library(bayesplot)
source("munge.R")

pd_model1_gen <- stan_generate_model("warfarin_pd_tlagMax_1.stan")
pd_model1 <- stan_model(pd_model1_gen)

pd_model2_gen <- stan_generate_model("warfarin_pd_tlagMax_2.stan")
pd_model2 <- stan_model(pd_model2_gen)

stan_data_pd$Eta_est <- readRDS("Eta_cov_est.rda")
stan_data_pd$ref <- 25

inits_pd <- function() {
    list(theta=rnorm(3, c(log(100), log(24), log(5)), 0.2),
         Eta=matrix(rnorm(3*J, 0, 0.5), J, 3),
         sigma_eta=abs(rnorm(3, 0, 0.25)),
         sigma_y=cumsum(abs(rnorm(1, 0, 5)))
         )
}

stan_inits <- replicate(4, inits_pd(), FALSE)

## ---- pd-raw-data-plot ----
qplot(time, dv, data=pd, group=id, geom=c("line", "point"), alpha=I(0.5)) +
    xlab("Time after dose [h]") + ylab(NULL) +
    ggtitle("Percent Change Prothrombin Complex Levels vs Normal", subtitle="Response to Warfarin treatment of 1.5mg/kg")


## test ODE differential
## ---- pd-ode-check ----
library(deSolve)
## ensure we cache the binaries of the compiled functions
options(rcpp.cache.dir=".")
expose_stan_functions(pd_model1_gen)

## model function passed to deSolve
model <- function(time, y, theta) {
    ## use dR/dt ODE functor defined in Stan model
    dR <- turnover_kin_inhib_1(time, y[1], theta, x_r, x_i)
    list(c(dR))
}

theta <- log(c(100, 20, 0.5))
x_r <- log(c(100, 0.7, 1.1, 0.13, 8))
x_i <- c(0)
initial <- c(R=100)
times <- seq(0, 200, by=1)

sim <- ode(y=initial, times=times, func=model, parms=theta)
plot(sim, main="Turn-over kin inhibition model, R(t)")

## ---- pd-stan-fit-1 ----
pd_fit_1 <- sampling(pd_model1
                    ,data=stan_data_pd
                    ,chains=4
                    ,cores=4
                    ,init=stan_inits
                    ,seed=24556
                    ,warmup=250
                    ,iter=500
                    ,refresh=5
                    ,control=list(adapt_delta=0.75, stepsize=0.1)
                    ,open_progress=FALSE)

## ---- pd-stan-fit-1-time ----
kable(addmargins(get_elapsed_time(pd_fit_1)/60, 2), digits=2)


## ---- pd-stan-fit-2 ----
pd_fit_2 <- sampling(pd_model2
                    ,data=stan_data_pd
                    ,chains=4
                    ,cores=4
                    ,init=stan_inits
                    ,seed=24556
                    ,warmup=250
                    ,iter=500
                    ,refresh=5
                    ,control=list(adapt_delta=0.75, stepsize=0.1)
                    ,open_progress=FALSE)

pd_post <- extract(pd_fit_2, pars=c("mu", "ypred", "ypred_cond"))

pop_pars <- c("theta", "sigma_eta", "sigma_y", "sigma_y_ref")
print(pd_fit_2, pars=pop_pars)

pop_pars_pd <- c("R0", "kin", "kout", "EC50")
print(pd_fit_2, pars=pop_pars_pd)

## ---- pd-stan-fit-2-time ----
kable(addmargins(get_elapsed_time(pd_fit_2)/60, 2), digits=2)

## ---- pd-post-model-2 ----
mcmc_intervals(as.matrix(pd_fit_2, pars=pop_pars))

## ---- pd-post-pars-2 ----
mcmc_intervals(as.matrix(pd_fit_2, pars=pop_pars_pd))

## ---- pd-post-4 ----
pd_sub <- pd$oid %in% 1:4
with(pd, ppc_ribbon_grouped(dv[pd_sub], pd_post$ypred_cond[,pd_sub], time[pd_sub], label[pd_sub], facet_args=list(scales="fixed")) +
         xlab("Time after dose [h]") +
         ggtitle("Percent Change Prothrombin Complex Levels vs Normal",
                 "Posterior predictive and data for 4 patients after 1.5mg/kg Warfarin oral dose") +
          legend_none())

## ---- pd-post-all ----
with(pd, ppc_ribbon_grouped(dv, pd_post$ypred_cond, time, label, facet_args=list(scales="fixed")))

## ---- pd-post-pop ----
pd_post_pred <- cbind(pd, with(pd, ppc_ribbon_data(dv, pd_post$ypred, time)))
ggplot(pd_post_pred, aes(time, dv, group=oid)) +
    geom_ribbon(aes(ymin=lo, ymax=hi), fill="grey80") +
    geom_line() + ylab(NULL) + xlab("Time after dose [h]") +
    ggtitle("Percent Change Prothrombin Complex Levels vs Normal",
            "Posterior predictive for population and raw patient datae after 1.5mg/kg Warfarin oral dose") +
    theme_default()


## ---- pd-diagnostic ----
pd_diag <- transform(pd,
                     ipre=colMeans(pd_post$mu),
                     ires=calc_npde(dv, pd_post$ypred_cond),
                     pres=calc_npde(dv, pd_post$ypred))

qplot(dv, ipre, data=pd_diag) + geom_abline()

qplot(time, ires, data=pd_diag) + geom_smooth(se=FALSE) +
    geom_hline(yintercept=c(-1.96,0,1.96))

qplot(time, pres, data=pd_diag) + geom_smooth(se=FALSE) +
    geom_hline(yintercept=c(-1.96,0,1.96))

qplot(time, dv, data=pd_diag, group=id, geom="point") + facet_wrap(~id) +
    geom_line(aes(y=ipre))


pdf("pd_subjects.pdf", 10, 10)
qplot(time, dv, data=pd_diag, group=id, geom="point") + facet_wrap(~label) +
    geom_line(aes(y=ipre))
dev.off()

## ---- pd-parallel ----
pd_model2par_gen <- stan_generate_model("warfarin_pd_tlagMax_2par.stan")
system("cat warfarin_pd_tlagMax_2par_generated.stan | sed 's#\\/\\/PARALLEL:##g' > parallel/warfarin_pd_tlagMax_2par_generated_218.stan")
setwd("parallel")
stan_rdump(names(stan_data_pd), "stan_data.R", envir=list2env(stan_data_pd))
stan_rdump(names(inits_pd()), "init-1.R", envir=list2env(inits_pd()))
stan_rdump(names(inits_pd()), "init-2.R", envir=list2env(inits_pd()))
setwd("..")

library(lubridate)
read_runtime <- function(backend, run_prefix) {
    runtime <- system(paste0("grep real parallel/logs/", run_prefix), intern=TRUE)
    runtime_cores <- as.numeric(sapply(strsplit(runtime,"[-:]"), "[[", 2))
    runtime_time <- sapply(strsplit(runtime,"\t"), "[[", 2)
    runtime <- data.frame(walltime=period_to_seconds(as.period(ms(runtime_time))), cores=runtime_cores, backend=backend)
    runtime
}

runtime <- rbind(read_runtime("threads", "chain_threads_err*"),
                 read_runtime("MPI", "chain_mpi_err*")) %>%
    arrange(backend, cores) %>%
        group_by(backend) %>%
            mutate(speedup=round(walltime[1]/walltime, 1))

## ---- pd-parallel-speedup ----
qplot(cores, speedup, data=runtime, colour=backend, shape=backend, geom=c("point", "line"), xlab="CPU Cores", ylab=NULL) +
    ggtitle("Speedup vs 1 core",
            "Points mark actual speedup, labels are walltime in minutes, dashed line is maximal speedup") +
    geom_abline(linetype=2) + scale_y_continuous(breaks=1:10) +
    scale_x_continuous(breaks=runtime$cores) +
    geom_text(aes(label=round(walltime/60, 2) ), hjust=0, nudge_y=-0.05, nudge_x=0.2, colour=I(1)) +
    coord_cartesian(xlim=c(1, 21))

## ---- pd-parallel-wallclock ----
qplot(cores, walltime/60, data=runtime, colour=backend, shape=backend, geom=c("point", "line"), xlab="CPU Cores", ylab=NULL) +
    ggtitle("Wallclock time in minutes vs cores",
            "Points mark wallclock time, labels are speedup vs 1 core") +
    scale_y_log10(breaks=c(seq(0.1,1,by=0.1), seq(1,10,by=1))) + scale_x_log10(breaks=runtime$cores) +
    geom_text(aes(label=paste0(speedup, "x") ), hjust=0, nudge_y=-0.01, nudge_x=-0.05, colour=I(1)) +
    coord_cartesian(xlim=c(1, 21))
