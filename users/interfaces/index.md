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

* [CmdStanPy](https://cmdstanpy.readthedocs.io/en/latest/getting_started.html)
  <span class="note">(Python, lightweight wrapper for CmdStan)</span>

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

RStanArm and brms provide R formula interfaces that automate
regression modeling.

* [RStanArm](/users/interfaces/rstanarm.html)
<span class="note">(R)</span>

* [brms](/users/interfaces/brms.html)
<span class="note">(R)</span>

The main differences between these packages are that RStanArm uses
precompiled models whereas brms compiles on the fly, and that they
support slightly different classes of models and automated posterior
analyses; both allow raw Stan output to be recovered and used
directly.

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

# Stan Language Syntax Aware Editors

RStudio now recognizes `.stan` files and provides syntax highlighting,
formatting, and checking.

* <p>
  <a href="https://resources.rstudio.com/rstudio-blog/rstudio-1-2-preview-stan">RStudio 1.2 Stan</a>
  <span class="note">(R)</span>
  </p>

Emacs

* <p>
  <a href="https://github.com/stan-dev/stan-mode">Emacs mode for Stan</a>
  </p>

There are several Vim plugins that offer syntax highlighting and support for
Stan.

* <p>
  <a href="https://github.com/eigenfoo/stan-vim">stan-vim: syntax highlighting, automatic indentation, code folding and more.</a>
  </p>
* <p>
  <a href="https://github.com/maverickg/stan.vim">stan.vim: Vim syntax highlighting for Stan</a>
  </p>

