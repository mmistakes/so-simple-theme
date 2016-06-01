# thanks to:
# http://stackoverflow.com/questions/26106086/2d-normal-pdf-with-ggplot-and-r
# http://stackoverflow.com/questions/13487625/overlaying-two-graphs-using-ggplot2-in-r

library(ggplot2);
# library(grid);      # units
# library(reshape2);  # melt
library(rstan);
library(scales);    # mute color

bivariate_normal_code <-
"
data {
  real<lower=-1,upper=1> rho;
}
transformed data {
  vector[2] mu;
  cov_matrix[2] Sigma;
  mu[1] <- 0;  mu[2] <- 0;
  Sigma[1,1] <- 1;      Sigma[1,2] <- rho;
  Sigma[2,1] <- rho;    Sigma[2,2] <- 1;
}
parameters {
  vector[2] y;
}
model {
  y ~ multi_normal(mu, Sigma);
}
";


fit <- stan(model_code = bivariate_normal_code, data = list(rho=0.95));

log_binorm <- function(y) {
  return( log_prob(fit, upars=y) );
}

grad_log_binorm <- function(y) {
  return( grad_log_prob(fit, upars=y) );
}

N <- 201;
H <- 5;
L <- -H;
pts <- seq(L, H, length.out=N);
density <- rep(NA, N * N);
y1 <- rep(NA, N * N);
y2 <- rep(NA, N * N);
pos <- 1;
for (m in 1:N) {
  for (n in 1:N) {
    density[pos] <- sqrt(-log_binorm(c(pts[m], pts[n])));
    y1[pos] <- pts[m];
    y2[pos] <- pts[n];
    pos <- pos + 1;
  }
}

lp_df <- data.frame(density,y1,y2);

# use geom_raster to mimic image

q1 <- c();
q2 <- c();
p1 <- c();
p2 <- c();
H <- c();
epsilon = 0.005;
q <- c(-1.5, -2);
p <- c(-2, -1);
#epsilon = 0.01;
#q <- c(-2.5, -2.75);
#p <- c( 0.25, -0.25);
n_leapfrog <- 800;
for (l in 1:n_leapfrog) {
  grad <- -grad_log_binorm(q);
  p <- p - (epsilon / 2) * grad;
  q <- q + epsilon * p;
  p <- p - (epsilon / 2) * grad;

  q1[l] <- q[1];
  q2[l] <- q[2];
  p1[l] <- p[1];
  p2[l] <- p[2];
  H[l] <- -log_binorm(q) + sum(p^2)
}
T <- 1:n_leapfrog
qp_df <- data.frame(density=c(rep(0,n_leapfrog*2)), # dummy
                   y1=c(q1,p1), y2=c(q2,p2), time=c(T,T),
                   H = c(H,H),
                   params=c(rep("position",n_leapfrog),
                            rep("momentum",n_leapfrog)));


# don't really need both unless you also want to plot momentum,
# but I never got around to that because it puts it on the
# density background, which is misleading (but faceting makes it
# easy to see)

q_df <- data.frame(density=rep(0,n_leapfrog),
                   y1=q1, y2=q2, time=T, H=H, params=rep("position",n_leapfrog));
p_df <- data.frame(density=rep(0,n_leapfrog),
                   y1=p1, y2=p2, time=T, H=H, params=rep("momentum",n_leapfrog));
qp_df <- rbind(q_df, p_df);


# just code to play around with plotting the entire Hamiltonian
gg <- ggplot(lp_df, aes(x=y1, y=y2, fill=density));
gg <- gg + geom_raster();
gg <- gg + coord_equal();
# natural scale (no sqrt(-x))
#gg <- gg + scale_fill_gradient2(low = "lightyellow",  mid="yellow", high="red",  
#                                midpoint=-10, space="Lab", limits=c(-40,0), na.value="lightyellow");
gg <- gg + scale_fill_gradient2(low = "red",  mid="yellow", high="gray90",  
                                space="Lab", midpoint=4, limits=c(0,8), na.value="gray90",
                                guide=guide_colourbar(reverse=TRUE, label=FALSE));
gg <- gg + scale_x_continuous(expand = c(0, 0), breaks=c(-4,-2,0,2,4));
gg <- gg + scale_y_continuous(expand = c(0, 0), breaks=c(-4,-2,0,2,4));
gg <- gg + geom_vline(xintercept=0, colour="gray50", alpha=0.2);
gg <- gg + geom_hline(yintercept=0, colour="gray50", alpha=0.2);
gg <- gg + labs(x="y1", y="y2")
gg <- gg + ggtitle("HAMILTONIAN SIMULATION
bivariate normal (rho = 0.95, sigma=1)
init position: (-1.5, -2)   init momentum: (-2, -1)  stepsize: 0.05
");
gg <- gg + theme(legend.position="none");
# use just q_df for just the position
gg <- gg + geom_point(data=q_df, aes(x=y1, y=y2, colour=time), size=1);
gg <- gg + scale_colour_gradient(low="gray50",high="black", guide=FALSE);
gg <- gg + facet_grid(. ~ params, margins=10);
gg;


# plot Hamiltonian
gg_H <- ggplot(head(q_df, n=n_leapfrog), aes(x=T, y=H));
gg_H <- gg_H + geom_point();
gg_H

draw_curve <- function(cutoff) {
  gg <- ggplot(lp_df, aes(x=y1, y=y2, fill=density));
  gg <- gg + geom_raster();
  gg <- gg + coord_equal();
  gg <- gg + scale_fill_gradient2(low = "red",  mid="yellow", high="gray90",  
                                  space="Lab", midpoint=4, limits=c(0,8), na.value="gray90",
                                  guide=guide_colourbar(reverse=TRUE, label=FALSE));
  gg <- gg + scale_x_continuous(expand = c(0, 0), breaks=c(-4,-2,0,2,4));
  gg <- gg + scale_y_continuous(expand = c(0, 0), breaks=c(-4,-2,0,2,4));
  gg <- gg + geom_vline(xintercept=0, colour="gray50", alpha=0.2);
  gg <- gg + geom_hline(yintercept=0, colour="gray50", alpha=0.2);
  gg <- gg + labs(x="y1", y="y2")
  gg <- gg + ggtitle("HAMILTONIAN SIMULATION
bivariate normal (rho = 0.95, sigma=1)
init position: (-1.5, -2)   init momentum: (-2, -1)  stepsize: 0.005
");
  gg <- gg + theme(legend.position="none");
  gg <- gg + geom_point(data=head(q_df, n=cutoff), aes(x=y1, y=y2, colour=time), size=1);
  gg <- gg + scale_colour_gradient(low="gray50",high="black", guide=FALSE);
  gg <- gg + facet_grid(. ~ params, margins=10);
  plot(gg);
}


trace_animate <- function() {
  lapply(seq(1,n_leapfrog,20), function(i) {
    draw_curve(i)
  })
}


library(animation);
saveGIF(trace_animate(), interval = .2, movie.name="ham-sim-stepsize-too-small.gif")
