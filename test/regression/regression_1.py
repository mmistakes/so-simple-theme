import pystan
import numpy as np

alpha = 2
beta = 3
sigma = 5
N = 100
x = np.random.uniform(size = N)
y = np.random.normal(size = N, loc=alpha + beta * x, scale = sigma)

stan_data = {'N': N, 'x': x, 'y': y}

model = pystan.StanModel(file='linear_regression_1.stan')
fit = model.sampling(data=stan_data)
print(fit)
