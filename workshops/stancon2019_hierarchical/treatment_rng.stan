functions { // saved as treatment_rng.stan in working directory
  matrix[] treatment_rng(int S, vector z) {
    int N = rows(z);     // number of observations
    matrix[N, 2] PPD[S]; // like a list of S matrices that are each Nx2
    for (s in 1:S) {
      real alpha = exponential_rng(1);
      real beta = normal_rng(0.5, 0.2);
      real sigma = fabs(normal_rng(2, 1));
      for (n in 1:N) {
        real u = normal_rng(0, 1);
        real t = bernoulli_logit_rng(alpha + z[n] + u);
        real epsilon = normal_rng(0, sigma);
        real y = beta * t + u + epsilon;
        PPD[s][n,] = [t, y];
      }
    }
    return PPD;
  }
}
