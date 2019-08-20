functions { // saved as bowling_rng.stan in working directory
  matrix bowling_rng(int S) {
    int n = 10;
    real p = uniform_rng(0, 1);
    matrix[S, 2] pins; // knocked down in each frame
    for (s in 1:S) {
      int roll_1 = binomial_rng(n, p);
      int roll_2 = binomial_rng(n - roll_1, p);
      pins[s,] = [roll_1, roll_2];
    }
    return pins;
  }
}
