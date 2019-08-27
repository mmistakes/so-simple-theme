functions { // saved as AR1_rng.stan in working directory
  matrix AR1_rng(int S, int N) {
    matrix[S, N] PPD;
    for (s in 1:S) {
      real alpha = normal_rng(0, 5);
      real beta = uniform_rng(0, 1);
      real sigma = exponential_rng(1);
      real y_0 = normal_rng(alpha, sigma / sqrt(1 - square(beta)));
      PPD[s, 1] = normal_rng(alpha + beta * y_0, sigma);
      for (n in 2:N) {
        real y_n = normal_rng(alpha + beta * PPD[s, n - 1], sigma);
        PPD[s, n] = y_n;
      }
    }
    return PPD;
  }
}
