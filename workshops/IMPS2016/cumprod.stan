functions {
  real cumprod(vector x) {
    real product;
    product = 1;
    for (i in 1:rows(x)) # Stan's indices start with 1 not 0
      product = product * x[i];
    return product;
  }
}
model {}
