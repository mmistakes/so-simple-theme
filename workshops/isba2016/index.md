---
layout: page
title: "Workshops: ISBA 2016, Introduction to Stan"
excerpt:
search_omit: true
image:
  feature: feature/wide_ensemble.png
---

The Stan project is in development since 2011 and aims to enable
efficient Bayesian inference. This tutorial will focus on the
foundations of Stan, introduce the Stan modeling language, explain how
to do Bayesian inference with Stan and finally address best
practices. These will be introduced using examples of increasing
complexity ranging from logistic regression to hierarchical non-linear
ODE models which will demonstrate the scalability and flexibility of
Stan.

Stan's key feature is the Hamiltonian MCMC sampler which is different
than the various established flavors of Bayesian inference Using Gibbs
Sampling (BUGS), such as WinBUGS, OpenBUGS, and JAGS. To fully exploit
the advantages of Hamiltonian MCMC, participants will be briefly
introduced to the foundations of Hamiltonian MCMC.

After these more theoretical aspects, the Stan modeling language will
be introduced. The Stan modeling language is inspired by the BUGS
family such that BUGS users can quickly adopt Stan. Most importantly,
participants will be taught best practices to write efficient Stan
models. This will include how to debug Stan models easily and what to
consider in order to expedite Stan models. These best practices will
be presented using examples of increasing complexity. The tutorial will
include an interactive session with hands-on exercises.

**Participants are encouraged to bring their fully charged laptop and
install before the course the latest Stan.** We highly recommend the
use of *RStan* which will be used for the demonstrations. The example
data set for the exercises can be downloaded below. A more advanced
example, which we will discuss, will be shared here before the course.


- Ulcerative Colitis [1]: [colitis_data.R](/workshops/isba2016/colitis_data.R)

[1] Neuenschwander B, Capkun-Niggli G, Branson M, Spiegelhalter DJ.
    Summarizing historical information on controls in clinical trials.
    _Clin Trials_. 2010; 7(1):5-18

