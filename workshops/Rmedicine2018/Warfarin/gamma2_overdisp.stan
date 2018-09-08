
real gamma2_overdisp_lpdf(vector y, vector mu, real sigma, real kappa) {
  int N = rows(y);
  vector[N] muSq = square(mu);
  vector[N] sigmaSq = square(sigma) + muSq / kappa;
  return gamma_lpdf(y| muSq ./ sigmaSq, mu ./ sigmaSq);
}

real gamma2_overdisp_array_lpdf(real[] y, vector mu, real sigma, real kappa) {
  int N = size(y);
  vector[N] muSq = square(mu);
  vector[N] sigmaSq = square(sigma) + muSq / kappa;
  return gamma_lpdf(y| muSq ./ sigmaSq, mu ./ sigmaSq);
}

real gamma2_overdisp_cdf(real y, real mu, real sigma, real kappa) {
  real muSq = square(mu);
  real sigmaSq = square(sigma) + muSq / kappa;
  return gamma_cdf(y, muSq ./ sigmaSq, mu ./ sigmaSq);
}

real gamma2_overdisp_rng(real mu, real sigma, real kappa) {
  real muSq = square(mu);
  real sigmaSq = square(sigma) + muSq / kappa;
  return gamma_rng(muSq ./ sigmaSq, mu ./ sigmaSq);
}
