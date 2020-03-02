import os
from cmdstanpy import cmdstan_path, CmdStanModel
import numpy as np
import fileinput
import sys
# Run from command line: Python regression_1.py

alpha = 2
beta = 3
sigma = 5
N = 100
x = np.random.uniform(size = N)
y = np.random.normal(size = N, loc=alpha + beta * x, scale = sigma)

stan_data = {'N': N, 'x': x, 'y': y}

stan_program = CmdStanModel(stan_file='regression_1.stan')
stan_program.compile()
fit = stan_program.sample(data=stan_data,
                           csv_basename='./regression_1')


print(fit)
