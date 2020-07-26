---
layout: page
title: Stan@NIPS2015
excerpt: ""
modified:
image:
  feature: feature/wide_ensemble.png
  credit:
  creditlink:
---

Stan will be well-represented at NIPS2015.  Come see a talk
or let us know about any cool projects involving Stan and you
might even score a free sticker!

Stan 2.9.0 is out! [(Release Notes)](https://github.com/stan-dev/stan/releases/tag/v2.9.0)
See the installation [instructions below](#installation).

Conference
======

Mon Dec 7th 07:00 - 11:59 PM:
**Dustin Tran** will present a poster (#37) on new
variational inference methods in **Room 210C**.

Tue Dec 8th 03:30 - 04:00 PM:
**Alp Kucukelbir** will speak about _Automatic Variational
Inference in Stan_ in **Room 210A**.

Tue Dec 8th 07:00 - 11:59 PM:
**Alp** will also present a corresponding poster (#34) in
**Room 210C**.


Workshops
======

[Workshop on Adaptive Data Analysis](http://wadapt.org) |
Friday 11 December

04:30 - 5:00 PM:
**Andrew Gelman** will speak about reproducibility.

[Advances in Approximate Bayesian Inference](http://approximateinference.org) |
Friday 11 December

09:15 - 10:00 AM:
**Alp** and **Michael Betancourt** will be on the _Tricks of the Trade_ panel.

04:55 - 06:00 PM:
**Andrew** will be on the _Foundations and Future of Approximate Inference_ panel.

[Scalable Monte Carlo](http://babaks.github.io/ScalableMonteCarlo/) |
Saturday 12 December

09:00 - 09:40 AM:
**Andrew** will speak about his _Adventures on the Efficient Frontier_.

2:40 - 3:30 PM:
**Michael** will be on the panel.

[Black Box Learning and Inference](http://www.blackboxworkshop.org) |
Saturday 12 December

10:50 - 11:35 AM:
**Michael** will speak about Stan during the language spotlight session.

11:35 AM - 12:20 PM:
**Michael** will be on the languages panel.

2:52 - 3:15 PM:
**Alp** will speak about automatic differentiation variational inference.

3:15 - 3:37 PM:
**Dustin** will speak about recent advances in variational inference.


Installation
============

#### CmdStan

CmdStan 2.9.0 is released and ready to
[download](http://mc-stan.org/interfaces/cmdstan.html).

ADVI data subsampling lives in an unsupported/untested branch.
See instructions [here](https://github.com/stan-dev/stan/blob/adsvi/how_to_ADSVI.md).

#### RStan

The `develop` branch of RStan is up to date with Stan 2.9.0.

To install RStan 2.8.2, first follow the instructions
[here](https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started).

Then use the following commands to start using the `develop` branch:

    if(!require(devtools)) install.packages("devtools")
    if(!require(devtools)) install.packages("git2r")
    
    path_rstan <- tempfile(pattern = "git2r-")
    dir.create(path_rstan) # requires recent version of R; may work without this line
    git2r::clone("http://github.com/stan-dev/rstan", path_rstan, branch = "develop")
    git2r::clone("http://github.com/stan-dev/stan", 
                 file.path(path_rstan, "StanHeaders", "inst", "include", "upstream"), 
                 branch = "master")
    git2r::clone("http://github.com/stan-dev/math", 
                 file.path(path_rstan, "StanHeaders", "inst", "include", "mathlib"), 
                 branch = "master")
    devtools::install(file.path(path_rstan, "StanHeaders"))
    devtools::install(file.path(path_rstan, "rstan", "rstan"))
    
    library(rstan)
    args(vb)
    
    devtools::install_github("stan-dev/rstanarm", local = FALSE)
    library(rstanarm)
    args(stan_glmer)


#### PyStan

_Stay tuned!_


#### Stan.jl, MatlabStan, and StataStan

See the [interfaces](interfaces) page for more details!











