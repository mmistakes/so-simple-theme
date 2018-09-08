/**
 * turn a slicing variable for a ragged array
 * S = {5, 6, 11}
 * into
 * Si = {0, 5, 5 + 6, 5+6+11} + 1
 * such that we can index the ragged array A as
 * A[Si[u] : Si[u+1]-1]
 * for the uth unit
 */
int[] make_slice_index(int[] S) {
  int Si[size(S)+1];
  int cv = 1;
  Si[1] = cv;
  for(i in 1:size(S)) {
    cv = cv + S[i];
    Si[i+1] = cv;
  }
  return(Si);
}

/**
 * calculate the absolute value of a - b in log-space with log(a)
 * and log(b) given. Does so by squaring and taking the root, i.e.
 *   la = log(a)
 *   lb = log(b)
 * sqrt( (a - b)^2 ) = sqrt( a^2 - 2 * a * b + b^2 )
 * <=> 0.5 * log_diff_exp(log_sum_exp(2*la, 2*lb), log(2) + la + lb)
 */
real log_diff_exp_abs(real la, real lb) {
  return(0.5 * log_diff_exp(log_sum_exp(2*la, 2*lb), log(2) + la + lb));
}

