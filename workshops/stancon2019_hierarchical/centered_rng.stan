functions { // saved as centered_rng.stan
  matrix centered_rng(int S, vector se) {
    int N = rows(se);
    matrix[S, N] PPD;
    for (s in 1:S) {
      real mu = normal_rng(0, 1);
      real tau = exponential_rng(1);
      for (n in 1:N) {
          
        real delta = normal_rng(mu, tau);
        real y = normal_rng(delta, se[n]);
        PPD[s, n] = y;
      }
    }
    return PPD;
  }
}
