count_divergences <- function(fit) {
  unlist(lapply(get_sampler_params(fit),
                function(x) return(sum(x[1001:2000, 5]))))
}

hist_treedepth <- function(fit) {
  hist(unlist(lapply(get_sampler_params(fit),
                     function(x) return(x[1001:2000, 3]))))
}

hist_leapfrog_steps <- function(fit) {
  hist(unlist(lapply(get_sampler_params(fit),
                     function(x) return(x[1001:2000, 4]))))
}
