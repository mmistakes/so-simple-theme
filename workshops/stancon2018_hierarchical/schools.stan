functions {
  vector cluster_DGP_rng(int J, int[] N, vector class_size, 
                         real r_tau, real r_sigma,
                         real mu_beta, real sigma_beta) {
    real tau = exponential_rng(r_tau);
    real sigma = exponential_rng(r_sigma);
    real beta = normal_rng(mu_beta, sigma_beta);
    vector[sum(N)] y;
    int pos = 1;
    for (j in 1:J) {
      real alpha_j = normal_rng(0, tau);
      for (i in 1:N[j]) {
        real mu = alpha_j + beta * class_size[pos];
        real epsilon = normal_rng(0, sigma);
        y[pos] = mu + epsilon;
        pos += 1;
      }
    }
    return y;
  }
}
