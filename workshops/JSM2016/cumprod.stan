functions {
  vector cumprod(vector x) {
    vector[rows(x)] products;
    products[1] = x[1]; // Stan's indices start with 1 not 0
    for (i in 2:rows(x)) 
      products[i] = products[i - 1] * x[i];
    return products;
  }
}
model {}
