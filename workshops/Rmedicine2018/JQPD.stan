functions {
  // http://metalogdistributions.com/images/Johnson_Quantile-Parameterized_Distributions.pdf
  real JQPDS_icdf(real p, data real alpha,
                  real l, real x_alpha,
                  real x_median, real x_1malpha) {
    if (x_alpha <= l) reject("x_alpha must be greater than l");
    if (x_median <= x_alpha) reject("x_median must be greater than x_alpha");
    if (x_1malpha <= x_median) 
      reject("x_1malpha must be greater than x_median");
    if (p < 0 || p > 1) reject("p must be between 0 and 1");
    {
      real c = inv_Phi(1 - alpha);
      real x_alphaml = x_alpha - l;
      real L = log(x_alphaml);
      real x_medianml = x_median - l;
      real B = log(x_medianml);
      real x_1malphaml = x_1malpha - l;
      real H = log(x_1malphaml);
      real HmL = H - L;
      real denom = fmin(B - L, H - B);
      real numer = sinh(acosh(0.5 * HmL / denom));
      real delta = numer / c;
      real lambda = denom / numer;
      real LHm2B = L + H - 2 * B;
      real n;
      real theta;
      real z;
      if (LHm2B < 0) {
        n = -1;
        theta = x_1malphaml;
        z = inv_Phi(p);
      } else if (LHm2B > 0) {
        n = 1;
        theta = x_alphaml;
        z = inv_Phi(p);
      } else { // LHm2B = 0 -> removable discontinuity
        real sigma = delta != 0 ? lambda * delta : (H - B) / c;
        theta = x_medianml;
        return l + theta * exp(sigma * inv_Phi(p));
      }
      return l + theta * exp(lambda * sinh(asinh(delta * z) + asinh(n * numer)));
    }
  }

  real JQPDS2_icdf(real p, data real alpha,
                   real l, real x_alpha,
                   real x_median, real x_1malpha) {
    if (x_alpha <= l) reject("x_alpha must be greater than l");
    if (x_median <= x_alpha) reject("x_median must be greater than x_alpha");
    if (x_1malpha <= x_median) 
      reject("x_1malpha must be greater than x_median");
    if (p < 0 || p > 1) reject("p must be between 0 and 1");
    {
      real c = inv_Phi(1 - alpha);
      real x_alphaml = x_alpha - l;
      real L = log(x_alphaml);
      real x_medianml = x_median - l;
      real B = log(x_medianml);
      real x_1malphaml = x_1malpha - l;
      real H = log(x_1malphaml);
      real HmL = H - L;
      real denom = fmin(B - L, H - B);
      real numer = sinh(acosh(0.5 * HmL / denom));
      real delta = numer / c;
      real lambda = denom / numer;
      real LHm2B = L + H - 2 * B;
      real n;
      real theta;
      if (LHm2B < 0) {
        n = -1;
        theta = x_1malphaml;
      } else if (LHm2B > 0) {
        n = 1;
        theta = x_alphaml;
      } else { // LHm2B = 0 -> removable discontinuity
        return l + x_medianml * exp(lambda * sinh(delta * inv_Phi(p)));
      }
      return l + theta * exp(lambda * sinh(delta * inv_Phi(p) + n * c));
    }
  }
  
  real JQPDB_icdf(real p, data real alpha,
                  real l, real x_alpha,
                  real x_median, real x_1malpha, real u) {
    if (u == positive_infinity())
      return JQPDS2_icdf(p, alpha, l, x_alpha, x_median, x_1malpha);
    if (x_alpha <= l) reject("x_alpha must be greater than l");
    if (x_median <= x_alpha) reject("x_median must be greater than x_alpha");
    if (x_1malpha <= x_median) 
      reject("x_1malpha must be greater than x_median");
    if (u <= x_1malpha) reject("u must be greater than x_1malpha");
    if (p < 0 || p > 1) reject("p must be between 0 and 1");
    {
      real c = inv_Phi(1 - alpha);
      real uml = u - l;
      real L = inv_Phi( (x_alpha   - l) / uml );
      real B = inv_Phi( (x_median  - l) / uml );
      real H = inv_Phi( (x_1malpha - l) / uml );
      real HmL = H - L;
      real delta = acosh(0.5 * HmL / fmin(B - L, H - B)) / c;
      real lambda = HmL / sinh(2 * delta * c);
      real LHm2B = L + H - 2 * B;
      real n;
      real zeta;
      if (LHm2B < 0) {
        n = -1;
        zeta = H;
      } else if (LHm2B > 0) {
        n = 1;
        zeta = L;
      } else { // LHm2B = 0 -> removable discontinuity
        return l + uml * Phi(B + 0.5 * HmL / c * inv_Phi(p));
      }
      return l + uml * Phi(zeta + lambda * sinh(delta * (inv_Phi(p) + n * c)));
    }
  }

  // http://metalogdistributions.com/images/KeelinPowley_QuantileParameterizedDistributions_2011.pdf
  real qnormal_icdf(real p, real a1, real a2, real a3, real a4) {
    real mu = a1 + a4 * p;
    real sigma = a2 + a3 * p;
    if (p < 0 || p > 1) reject("p must be between 0 and 1");
    {
      real z = inv_Phi(p);
      real denom = sigma + exp(-0.5 * square(z)) / sqrt(2 * pi()) * (a3 * z + a4);
      if (denom < 0) reject("parameters do not imply a valid distribution");
      return mu + sigma * z;
    }
  }
}
