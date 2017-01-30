---
layout: page
title: Interfaces
excerpt: ""
modified:
image:
  feature: feature/wide_ensemble.png
  credit:
  creditlink:
---

{:.center-txt}
ways to run Stan

# Stan Language Interfaces

To perform inference and posterior analysis for Stan language
programs, choose an interface:

* [RStan](/interfaces/rstan.html) <span class="note">(R)</span>

* [PyStan](/interfaces/pystan.html)
  <span class="note">(Python)</span>

* [CmdStan](/interfaces/cmdstan.html)
  <span class="note">(shell, command-line terminal)</span>

* [MatlabStan](/interfaces/matlab-stan.html)
  <span class="note">(MATLAB)</span>

* [Stan.jl](/interfaces/julia-stan.html)
  <span class="note">(Julia)</span>

* [StataStan](/interfaces/stata-stan.html)
  <span class="note">(Stata)</span>

* [MathematicaStan](/interfaces/mathematica-stan.html)
  <span class="note">(Mathematica)</span>

Stan programs are portable across interfaces.

# Higher-Level Interfaces

RStanArm provides an R formula interface for Bayesian regression
modeling.

* <p>  
  <a href="/interfaces/rstanarm.html">RStanArm</a>
  <span class="note">(R)</span>
  </p>

# Lower-Level Interfaces

The Stan Math Library provides differentiable special functions,
probability functions, and linear algebra.

* <p> 
  <a href="/interfaces/math.html">Stan Math Library</a>
  <span class="note">(C++)</span>
  </p>

The Stan C++ package includes the language source-to-source compiler,
I/O, inference algorithms, and posterior analysis algorithms.

* <p><a href="/interfaces/stan.html">Stan</a>
  <span class="note">(C++)</span>
  </p>


# Useful Tools

ShinyStan provides interactive visual summaries and advanced posterior
analysis of MCMC output. 

* <p>
  <a href="/interfaces/shinystan.html">ShinyStan</a>
  <span class="note">(R)</span>
  </p>

The loo package provides efficient leave-one-out cross-validation and WAIC calculations.

* <p>
  <a href="/interfaces/loo.html">loo</a>
  <span class="note">(R)</span>
  </p>

