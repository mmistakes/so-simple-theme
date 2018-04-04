---
layout: page
title: Interfaces
excerpt: ""
modified:
image:
  feature: feature/wide_ensemble.png
  credit:
  creditlink:
redirect_from: "/interfaces/"
---

{:.center-txt}
ways to run Stan

# Stan Interfaces

The Stan modeling language and statistical algorithms are exposed
through interfaces into many popular computing environments.

* [RStan](rstan.html) <span class="note">(R)</span>

* [PyStan](pystan.html)
  <span class="note">(Python)</span>

* [CmdStan](cmdstan.html)
  <span class="note">(shell, command-line terminal)</span>

* [MatlabStan](matlab-stan.html)
  <span class="note">(MATLAB)</span>

* [Stan.jl](julia-stan.html)
  <span class="note">(Julia)</span>

* [StataStan](stata-stan.html)
  <span class="note">(Stata)</span>

* [MathematicaStan](mathematica-stan.html)
  <span class="note">(Mathematica)</span>

* [ScalaStan](https://github.com/cibotech/ScalaStan)
  <span class="note">(Scala)</span>

Programs written in the Stan modeling language are portable
across interfaces.

# Higher-Level Interfaces

RStanArm provides an R formula interface for Bayesian regression
modeling.

* <p>  
  <a href="/users/interfaces/rstanarm.html">RStanArm</a>
  <span class="note">(R)</span>
  </p>

# Lower-Level Interfaces

The Stan Math Library provides differentiable special functions,
probability densities, and linear algebra in C++.

* <p>
  <a href="/users/interfaces/math.html">Stan Math Library</a>
  <span class="note">(C++)</span>
  </p>

The Stan Core Library includes the language source-to-source compiler,
I/O, inference algorithms, and posterior analysis algorithms, all in C++.

* <p><a href="/users/interfaces/stan.html">Stan</a>
  <span class="note">(C++)</span>
  </p>

# Useful Tools

ShinyStan provides interactive visual summaries and advanced posterior
analysis of MCMC output.

* <p>
  <a href="/users/interfaces/shinystan.html">ShinyStan</a>
  <span class="note">(R)</span>
  </p>

The bayesplot package is a ggplot2-based plotting library for graphing
parameter estimates, MCMC diagnostics, and posterior predictive checks.

* <p>
  <a href="/users/interfaces/bayesplot.html">bayesplot</a>
  <span class="note">(R)</span>
  </p>

The rstantools package provides various tools for developers of R packages
interfacing with Stan.

* <p>
  <a href="/users/interfaces/rstantools.html">rstantools</a>
  <span class="note">(R)</span>
  </p>

The loo package provides efficient leave-one-out cross-validation and WAIC calculations.

* <p>
  <a href="/users/interfaces/loo.html">loo</a>
  <span class="note">(R)</span>
  </p>
