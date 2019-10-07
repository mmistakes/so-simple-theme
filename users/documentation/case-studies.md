---
layout: page
title: Case Studies
excerpt: ""
modified:
image:
  feature: feature/wide_ensemble.png
  credit:
  creditlink:
---

{:.center-txt}
open-source methods and models

The case studies on this page are intended to reflect best practices
in Bayesian methodology and Stan programming.

# Contributing Case Studies

To contribute a case study, please contact us through the
[Stan Forums](http://discourse.mc-stan.org/).  We require

* a documented, reproducible example with narrative documentation
<span class="note">(e.g., knitr or Jupyter with software/compiler
versions noted and seeds fixed)</span> and

* an open-source code license <span class="note">(preferably BSD or GPL
for code, Creative Commons for text)</span>; authors retain all copyright.

# *Stan Case Studies*, &nbsp; Volume 6 &nbsp; (2019)

<hr style="margin:0.25em 0 0.25em 0;"/>
<hr style="margin:0 0 2em 0;"/>

## Tagging Basketball Events with HMM in Stan

<small>This case study shows how we can apply Bayesian inference to Hidden Markov Models (HMMs) using Stan to extract useful information from basketball player tracking data. Specifically we show how to tag drive events and how to determine defensive assignment. Before diving into basketball data we show how to fit an HMM in Stan using a simple example. This should help build some intuition for those who are unfamiliar with HMMs and will also show how to specify an HMM using Stan.</small>

[View](case-studies/bball-hmm.html) <span class="note">(HTML)</span>

Author
: Imad Ali

Keywords
: hidden markov models, sports

Source Repository
: [imadmali/bball-hmm](https://github.com/imadmali/bball-hmm)
<span class="note">(GitHub)</span>

R Package Dependencies
: <tt style="font-size: 90%">rstan, bayesplot, dplyr</tt>

License
:  BSD (3 clause), CC-BY-NC

## Model building and expansion for golf putting

<small>In this case study, we use Stan to build a series of models to estimate the probability of a successful putt using data from professional golfers.  We fit and check the fit of a series of models, demonstrating the benefits of modeling based on substantive (rather than purely statistical) principles.  We successfully fit to a small dataset and then have to expand the model to fit a new, larger dataset.  We use weakly informative priors and a model-misfit error term to enable the fit.</small>

[View](case-studies/golf.html) <span class="note">(HTML)</span>

Author
: Andrew Gelman

Keywords
: nonlinear regression, sports

Source Repository
: [example-models/knitr/golf](https://github.com/stan-dev/example-models/tree/master/knitr/golf)
<span class="note">(GitHub)</span>

R Package Dependencies
: <tt style="font-size: 90%">rstan</tt>

License
:  BSD (3 clause), CC-BY

## A Dyadic Item Response Theory Model: Stan Case Study

<small>In this case study, we use Stan to fit the Dyadic Item Response Theory (dIRT) model proposed by (Gin et al. 2019) to measure interactions between pairs of individuals when the responses to items represent the actions/behaviors/perceptions of an individual (called the 'actor') made within the context of a dyad formed with another individual (called the 'partner'). The dIRT model is fit using Stan (version 2.18.1) in R via the rstan package.</small>

[View](case-studies/dyadic_irt_model.html) <span class="note">(HTML)</span>

Author
: Nicholas Sim, Brian Gin, Anders Skrondal and Sophia Rabe-Hesketh

Keywords
: item response theory, social relations model, dyadic data

Source Repository
: [example-models/education/dyadic_irt_model](https://github.com/education-stan/example-models/tree/master/education/dyadic_irt_model)
<span class="note">(GitHub)</span>

R Package Dependencies
: <tt style="font-size: 90%">rstan, tidyverse</tt>

License
:  BSD (3 clause), CC-BY

# *Stan Case Studies*, &nbsp; Volume 5 &nbsp; (2018)

<hr style="margin:0.25em 0 0.25em 0;"/>
<hr style="margin:0 0 2em 0;"/>

## Multilevel Linear Models using Rstanarm

<small>In this tutorial, we illustrate how to fit a multilevel linear model within a full Bayesian framework using rstanarm. This tutorial is aimed primarily at educational researchers who have used lme4 in R to fit models to their data and who may be interested in learning how to fit Bayesian multilevel models. However, for readers who have not used lme4 before, we briefly review the use of the package for fitting multilevel models.</small>

[View](case-studies/tutorial_rstanarm.html) <span class="note">(HTML)</span>

Author
: JoonHo Lee, Nicholas Sim, Feng Ji, and Sophia Rabe-Hesketh

Keywords
: education, rstanarm, multilevel models, linear mixed models, hierarchical linear models

Source Repository
: [example-models/education/tutorial_rstanarm](https://github.com/stan-dev/example-models/tree/master/education/tutorial_rstanarm)
<span class="note">(GitHub)</span>

R Package Dependencies
: <tt style="font-size: 90%">rstanarm, mlmRev, ggplot2, lme4</tt>

License
:  BSD (3 clause), CC-BY

## Predator-Prey Population Dynamics: the Lotka-Volterra model in Stan

Lotka (1925) and Volterra (1926) formulated parameteric differential
equations that characterize the oscillating populations of predators
and prey. A statistical model to account for measurement error and
unexplained variation uses the deterministic solutions to the
Lotka-Volterra equations as expected population sizes. Stan is used to
encode the statistical model and perform full Bayesian inference to
solve the inverse problem of inferring parameters from noisy data. The
model is fit to Canadian lynx and snowshoe hare populations between
1900 and 1920, based on the number of pelts collected annually by the
Hudson’s Bay Company. Posterior predictive checks for replicated data
show the model fits this data well. Full Bayesian inference may be
used to estimate future (or past) populations.

[View](case-studies/lotka-volterra-predator-prey.html) <span class="note">(HTML)</span>

Author
: Bob Carpenter

Keywords
: population dynamics, Lotka-Volterra equations, differential
equations, posterior predictive checks

Source Repository
: [stan-dev/example-models/knitr/lotka-volterra]()
<span class="note">(GitHub)</span>

R Package Dependencies
: <tt style="font-size: 90%">rstan</tt>, <tt style="font-size:
90%">ggplot2</tt>, <tt style="font-size: 90%">gridExtra</tt>, <tt
style="font-size: 90%">knitr</tt>, <tt style="font-size: 90%">reshape</tt>
<tt style="font-size: 90%">tufte</tt>

License
: Code: BSD (3 clause), Text: CC BY-NC 4.0



## Nearest neighbor Gaussian process (NNGP) models in Stan

<small>
Nearest neighbor Gaussian process (NNGP) based models is a
family of highly scalable Gaussian processes based models. In brief,
NNGP extends the Vecchia’s approximation (Vecchia 1988) to a process
using conditional independence given information from neighboring
locations. This case study shows how to express and fit these models
in Stan.
</small>

[View](case-studies/nngp.html) <span class="note">(HTML)</span>

Author
: Lu Zhang

Keywords
: Gaussian process, nearest neighbor Gaussian process, spatial models,
latent process, regression

Source Repository
: [LuZhangstat/NNGP_STAN](https://github.com/LuZhangstat/NNGP_STAN)
<span class="note">(GitHub)</span>

R Package Dependencies
: <tt style="font-size: 90%">rstan</tt>

License
: Code: BSD (3 clause), Text: CC BY-NC 4.0


# *Stan Case Studies*, &nbsp; Volume 4 &nbsp; (2017)

<hr style="margin:0.25em 0 0.25em 0;"/>
<hr style="margin:0 0 2em 0;"/>


## Extreme value analysis and user defined probability functions in Stan

<small>
This notebook demonstrates how to implement user defined
probability functions in Stan language. As an example I use the
generalized Pareto distribution (GPD) to model geomagnetic storm data
from the World Data Center for Geomagnetism.
</small>

[View](case-studies/gpareto_functions.html) <span class="note">(HTML)</span>

Author
: Aki Vehtari

Keywords
: extreme value analysis, generalized Pareto distribution, user defined probability functions

Source Repository
: [avehtari/BDA_R_demos/demos_rstan/gpareto_functions](https://github.com/avehtari/BDA_R_demos/tree/master/demos_rstan/gpareto_functions)
<span class="note">(GitHub)</span>

R Package Dependencies
: <tt style="font-size: 90%">rstan</tt>,
  <tt style="font-size: 90%">bayesplot</tt>,
  <tt style="font-size: 90%">loo</tt>,
  <tt style="font-size: 90%">ggplot2</tt>,
  <tt style="font-size: 90%">tidyr</tt>,
  <tt style="font-size: 90%">dplyr</tt>,
  <tt style="font-size: 90%">extraDistr</tt>,
  <tt style="font-size: 90%">gridExtra</tt>

License
: Code: BSD (3 clause), Text: CC BY-NC 4.0


## Modelling Loss Curves in Insurance with RStan

<small>
Loss curves are a standard actuarial technique for helping
insurance companies assess the amount of reserve capital they need to
keep on hand to cover claims from a line of business. Claims made and
reported for a given accounting period are tracked seperately over
time. This enables the use of historical patterns of claim development
to predict expected total claims for newer policies.
</small>

<small>
We model the growth of the losses in each accounting period as an
increasing function of time, and use the model to estimate the
parameters which determine the shape and form of this growth. We also
use the sampler to estimate the values of the “ultimate loss ratio”,
i.e. the ratio of the total claims on an accounting period to the
total premium received to write those policies. We treat each
accounting period as a cohort.
</small>

[View](case-studies/losscurves_casestudy.html) <span class="note">(HTML)</span>

Author
: Mick Cooney

Keywords
: actuarial science, loss curves, insurance, ultimate loss ratio,
hierarchical model

Source Repository
: [kaybenleroll/stancasestudy_losscurves](https://github.com/kaybenleroll/stancasestudy_losscurves)
<span class="note">(GitHub)</span>

R Package Dependencies
: <tt style="font-size: 90%">rstan</tt>,
  <tt style="font-size: 90%">bayesplot</tt>,
  <tt style="font-size: 90%">tidyverse</tt>,
  <tt style="font-size: 90%">scales</tt>,
  <tt style="font-size: 90%">cowplot</tt>

License
: Code: BSD (3 clause), Text: CC BY-NC 4.0


## Splines in Stan

<small>
In this document, we discuss the implementation of splines in Stan. We
start by providing a brief introduction to splines and then explain
how they can be implemented in Stan. We also discuss a novel prior
that alleviates some of the practical challenges of spline models.
</small>

[View](case-studies/splines_in_stan.html) <span class="note">(HTML)</span>

Author
: Milad Kharratzadeh

Keywords
: B-splines, piecewise regression, knots, priors

Source Repository
: [milkha/Splines_in_Stan](https://github.com/milkha/Splines_in_Stan)
<span class="note">(GitHub)</span>

R Package Dependencies
: <tt style="font-size: 90%">rstan</tt>,
  <tt style="font-size: 90%">splines</tt>

License
: Code: BSD (3 clause), Text: CC BY-NC 4.0

[View](case-studies/splines_in_stan.html) <span class="note">(HTML)</span>

Author
: Milad Kharratzadeh

Keywords
: B-splines, piecewise regression, knots, priors

Source Repository
: [milkha/Splines_in_Stan](https://github.com/milkha/Splines_in_Stan)
<span class="note">(GitHub)</span>

R Package Dependencies
: <tt style="font-size: 90%">splines</tt>,
  <tt style="font-size: 90%">rstan</tt>,

License
: Code: BSD (3 clause), Text: CC BY-NC 4.0


## Spatial Models in Stan: Intrinsic Auto-Regressive Models for Areal Data

<small>
This case study shows how to efficiently encode and compute an
Intrinsic Conditional Auto-Regressive (ICAR) model in Stan.
When data has a neighborhood structure, ICAR models provide spatial smoothing
by averaging measurements of directly adjoining regions.
The Besag, York, and Mollié (BYM) model is a Poisson GLM which
includes both an ICAR component and an ordinary
random-effects component for non-spatial heterogeneity.
We compare two variants of the BYM model and fit two datasets
taken from epidemiological studies over 56 and 700 regions, respectively.
</small>

[View](case-studies/icar_stan.html) <span class="note">(HTML)</span>

Author
: Mitzi Morris

Keywords
: spatial modeling, CAR, ICAR, INLA, OpenBUGS, hierarchical models

Source Repository
: [stan-dev/example-models](https://github.com/stan-dev/example-models/tree/master/knitr/car-iar-poisson)
<span class="note">(GitHub)</span>

R Package Dependencies
: <tt style="font-size: 90%">rstan</tt>,
  <tt style="font-size: 90%">rstanarm</tt>,
  <tt style="font-size: 90%">ggplot2</tt>,
  <tt style="font-size: 90%">broom</tt>,
  <tt style="font-size: 90%">reshape2</tt>,
  <tt style="font-size: 90%">dplyr</tt>,
  <tt style="font-size: 90%">maptools</tt>,
  <tt style="font-size: 90%">spdep</tt>,
  <tt style="font-size: 90%">R-INLA</tt>,
  <tt style="font-size: 90%">R2OpenBugs</tt>

License
: Code: BSD (3 clause), Text: CC BY-NC 4.0


## The QR Decomposition for Regression Models

<small>
This case study reviews the QR decomposition, a technique for  decorrelating
covariates and, consequently, the resulting posterior distribution in
regression models.
</small>

[View](case-studies/qr_regression.html) <span class="note">(HTML)</span>

Author
: Michael Betancourt

Keywords
: Markov chain Monte Carlo, regression, RStan

Source Repository
: [betanalpha/knitr_case_studies/qr_regression](https://github.com/betanalpha/knitr_case_studies/tree/master/qr_regression)
<span class="note">(GitHub)</span>

R Package Dependencies
: <tt style="font-size: 90%">rstan</tt>, <tt style="font-size: 90%">knitr</tt>.

License
: Code: BSD (3 clause), Text: CC BY-NC 4.0

## Robust RStan Workflow

<small>
This case study demonstrates the recommended RStan workflow for
ensuring robust inferences with the default dynamic Hamiltonian
Monte Carlo algorithm.
</small>

[View](case-studies/rstan_workflow.html) <span class="note">(HTML)</span>

Author
: Michael Betancourt

Keywords
: Markov chain Monte Carlo, Hamiltonian Monte Carlo, divergences, RStan

Source Repository
: [betanalpha/knitr_case_studies/rstan_workflow](https://github.com/betanalpha/knitr_case_studies/tree/master/rstan_workflow)
<span class="note">(GitHub)</span>

R Package Dependencies
: <tt style="font-size: 90%">rstan</tt>, <tt style="font-size: 90%">knitr</tt>.

License
: Code: BSD (3 clause), Text: CC BY-NC 4.0

## Robust PyStan Workflow

<small>
This case study demonstrates the recommended PyStan workflow for
ensuring robust inferences with the default dynamic Hamiltonian
Monte Carlo algorithm.
</small>

[View](case-studies/pystan_workflow.html) <span class="note">(HTML)</span>

Author
: Michael Betancourt

Keywords
: Markov chain Monte Carlo, Hamiltonian Monte Carlo, divergences, PyStan

Source Repository
: [betanalpha/jupyter_case_studies/pystan_workflow](https://github.com/betanalpha/jupyter_case_studies/tree/master/pystan_workflow)
<span class="note">(GitHub)</span>

Python Package Dependencies
: <tt style="font-size: 90%">rstan</tt>, <tt style="font-size: 90%">pystan, pickle, numpy, md5</tt>.

License
: Code: BSD (3 clause), Text: CC BY-NC 4.0


## Typical Sets and the Curse of Dimensionality

<small> This case study illustrates the so-called “curse of
dimensionality” using simple examples based on simulation to show that
all points are far away in high dimensions and that the mode is an
atypical draw from a multivariate normal.  The information-theoretic
concept of typical set is illustrated with both discrete and
continuous cases, which show that probability mass is a product of
volume and density (or count and mass in the discrete case).  It also
illustrates Monte Carlo methods and relates distance to the log
density of the normal distribution and the chi-squared distribution.
</small>

[View R version](case-studies/curse-dims.html)
<span class="note">(HTML)</span>

Authors
: Bob Carpenter

Keywords
: probability mass, typical sets, concentration of measure, Monte Carlo methods

Source Repository (R)
: [stan-dev/example-models/knitr/curse-dims](https://github.com/stan-dev/example-models/tree/master/knitr/curse-dims)
<span class="note">(GitHub)</span>

R Package Dependencies
: <tt style="font-size: 90%">ggplot2</tt>

License
: Code: BSD (3 clause), Text: CC BY-NC 4.0


[View Python version](case-studies/curse-dims-python.html)
<span class="note">(HTML)</span>

Author (Python translation)
: Aravind S (Python translation)

Source Repository (Python)
: [Aravinds-ds/Stan-Code/python notebooks/curse_dims](https://github.com/Arvinds-ds/Stan-Code/tree/master/python%20notebooks/curse_dims)
<span class="note">(GitHub)</span>

Python Package Dependencies
: <tt style="font-size: 90">numpy</tt>,
<tt style="font-size: 90">scipy</tt>,
<tt style="font-size: 90">pandas</tt>,
<tt style="font-size: 90">matplotlib</tt>,
<tt style="font-size: 90">collections</tt>,
<tt style="font-size: 90">sys</tt>

License
: Code: BSD (3 clause), Text: CC BY-NC 4.0






## Diagnosing Biased Inference with Divergences

<small>
This case study discusses the subtleties of accurate Markov chain Monte Carlo
estimation and how divergences can be used to identify biased estimation in
practice.
</small>

[View](case-studies/divergences_and_bias.html) <span class="note">(HTML)</span>

Author
: Michael Betancourt

Keywords
: Markov chain Monte Carlo, Hamiltonian Monte Carlo, divergences, RStan

Source Repository
: [betanalpha/knitr_case_studies/divergences_and_bias](https://github.com/betanalpha/knitr_case_studies/tree/master/divergences_and_bias)
<span class="note">(GitHub)</span>

R Package Dependencies
: <tt style="font-size: 90%">rstan</tt>, <tt style="font-size: 90%">knitr</tt>.

License
: Code: BSD (3 clause), Text: CC BY-NC 4.0


## Identifying Bayesian Mixture Models

<small>
This case study discusses the common pathologies of Bayesian mixture models as
well as some strategies for identifying and overcoming them.
</small>

[View](case-studies/identifying_mixture_models.html) <span class="note">(HTML)</span>

Author
: Michael Betancourt

Keywords
: Markov chain Monte Carlo, Hamiltonian Monte Carlo, mixture models,
multimodal models, RStan

Source Repository
: [betanalpha/knitr_case_studies/identifying_mixture_models](https://github.com/betanalpha/knitr_case_studies/tree/master/identifying_mixture_models)
<span class="note">(GitHub)</span>

R Package Dependencies
: <tt style="font-size: 90%">rstan</tt>, <tt style="font-size: 90%">knitr</tt>.

License
: Code: BSD (3 clause), Text: CC BY-NC 4.0


## How the Shape of a Weakly Informative Prior Affects Inferences

<small>
This case study reviews the basics of weakly-informative priors and how the
choice of a specific shape of such a prior affects the resulting posterior
distribution.
</small>

[View](case-studies/weakly_informative_shapes.html) <span class="note">(HTML)</span>

Author
: Michael Betancourt

Keywords
: Markov chain Monte Carlo, Hamiltonian Monte Carlo, priors,
weakly-informative priors, RStan

Source Repository
: [betanalpha/knitr_case_studies/weakly_informative_shapes](https://github.com/betanalpha/knitr_case_studies/tree/master/weakly_informative_shapes)
<span class="note">(GitHub)</span>

R Package Dependencies
: <tt style="font-size: 90%">rstan</tt>, <tt style="font-size: 90%">knitr</tt>.

License
: Code: BSD (3 clause), Text: CC BY-NC 4.0
# *Stan Case Studies*, &nbsp; Volume 3 &nbsp; (2016)

<hr style="margin:0.25em 0 0.25em 0;"/>
<hr style="margin:0 0 2em 0;"/>

## Exact Sparse CAR Models in Stan

<small>
This document details sparse exact conditional autoregressive (CAR) models in Stan as an extension of previous work on approximate sparse CAR models in Stan. Sparse representations seem to give order of magnitude efficiency gains, scaling better for large spatial data sets.
</small>

[View](case-studies/mbjoseph-CARStan.html) <span class="note">(HTML)</span>

Author
: Max Joseph

Keywords
: conditional autoregressive (CAR), independent autoregressive (IAR), sparsity, spatial random effects, maps

Source Repository
: [mbjoseph/CARstan](https://github.com/mbjoseph/CARstan) <span class="note">(GitHub)</span>

R Package Dependencies
: <tt style="font-size: 90%">rstan</tt>, <tt style="font-size: 90%">dplyr</tt>, <tt style="font-size: 90%">ggmcmc</tt>, <tt style="font-size: 90%">knitr</tt>, <tt style="font-size: 90%">maptools</tt>, <tt style="font-size: 90%">rgeos</tt>, <tt style="font-size: 90%">spdep</tt>.

License
: BSD (3 clause), CC-BY


## A Primer on Bayesian Multilevel Modeling using PyStan

<small>
This case study replicates the analysis of home radon levels using
hierarchical models of [Lin, Gelman, Price, and Kurtz
(1999)](http://www.stat.columbia.edu/~radon/credits.html).  It
illustrates how to generalize linear regressions to hierarchical models with
group-level predictors and how to compare predictive inferences and
evaluate model fits. Along the way it shows how to get data into Stan
using pandas, how to sample using PyStan, and how to visualize the results
using Seaborn.
</small>

[View](case-studies/radon.html) <span class="note">(HTML)</span>

Author
: Chris Fonnesbeck

Keywords
: hierarchical/multilevel modeling, linear regression, model comparison, predictive inference, radon

Source Repository
: [fonnesbeck/stan_workshop_2016](https://github.com/fonnesbeck/stan_workshop_2016)
<span class="note">(GitHub)</span>

Python Package Dependencies
: <tt style="font-size: 90%">pystan, numpy, pandas, matplotlib, seaborn</tt>

License
: Apache 2.0 (code), CC-BY 3 (text)


## The Impact of Reparameterization on Point Estimates

<small> When changing variables, a Jacobian adjustment needs to be
provided to account for the rate of change of the transform. Applying
the adjustment ensures that inferences that are based on expectations
over the posterior are invariant under reparameterizations. In
contrast, the posterior mode changes as a result of the
reparameterization. In this note, we use Stan to code a repeated
binary trial model parameterized by chance of success, along with its
reparameterization in terms of log odds in order to demonstrate the
effect of the Jacobian adjustment on the Bayesian posterior and the
posterior mode. We contrast the posterior mode to the maximum
likelihood estimate, which, like the Bayesian estimates, is invariant
under reparameterization. Along the way, we derive the logistic
distribution by transforming a uniformly distributed variable.
</small>

[View](case-studies/mle-params.html) <span class="note">(HTML)</span>

Author
: Bob Carpenter

Keywords
: MLE, Bayesian posterior, reparameterization, Jacobian, binomial

Source Repository
: [example-models/knitr/mle-params](https://github.com/stan-dev/example-models/tree/master/knitr/mle-params)
<span class="note">(GitHub)</span>

R Package Dependencies
: <tt style="font-size: 90%">rstan</tt>

License
: BSD (3 clause), CC-BY


## Hierarchical Two-Parameter Logistic Item Response Model

<small>This case study documents a Stan model for the two-parameter logistic model (2PL) with hierarchical priors. A brief simulation indicates that the Stan model successfully recovers the generating parameters. An example using a grade 12 science assessment is provided.</small>

[View](case-studies/hierarchical_2pl.html) <span class="note">(HTML)</span>

Author
: Daniel C. Furr

Keywords
: education, item response theory, two-parameter logistic model, hierarchical priors

Source Repository
: [example-models/education/hierarchical_2pl](https://github.com/stan-dev/example-models/tree/master/education/hierarchical_2pl)
<span class="note">(GitHub)</span>

R Package Dependencies
: <tt style="font-size: 90%">rstan, ggplot2, mirt</tt>

License
:  BSD (3 clause), CC-BY


## Rating Scale and Generalized Rating Scale Models with Latent Regression

<small>This case study documents a Stan model for the rating scale model (RSM) and the generalized rating scale model (GRSM) with latent regression. The latent regression portion of the models may be restricted to an intercept only, yielding a standard RSM or GRSM. A brief simulation indicates that the Stan models successfully recover the generating parameters. An example using a survey of public perceptions of science and technology is provided.</small>

[View](case-studies/rsm_and_grsm.html) <span class="note">(HTML)</span>

Authors
: Daniel C. Furr

Keywords
: education, item response theory, rating scale model, generalized rating scale model

Source Repository
: [example-models/education/rsm_and_grsm](https://github.com/stan-dev/example-models/tree/master/education/rsm_and_grsm)
<span class="note">(GitHub)</span>

R Package Dependencies
: <tt style="font-size: 90%">rstan, edstan, ggplot2, ltm</tt>

License
:  BSD (3 clause), CC-BY


## Partial Credit and Generalized Partial Credit Models with Latent Regression

<small>This case study documents a Stan model for the partial credit model (PCM) and the generalized partial credit model (GPCM) with latent regression. The latent regression portion of the models may be restricted to an intercept only, yielding a standard PCM or GPCM. A brief simulation indicates that the Stan models successfully recover the generating parameters. An example using the TIMSS 2011 mathematics assessment is provided</small>

[View](case-studies/pcm_and_gpcm.html) <span class="note">(HTML)</span>

Authors
: Daniel C. Furr

Keywords
: education, item response theory, partial credit model, generalized partial credit model

Source Repository
: [example-models/education/pcm_and_gpcm](https://github.com/stan-dev/example-models/tree/master/education/pcm_and_gpcm)
<span class="note">(GitHub)</span>

R Package Dependencies
: <tt style="font-size: 90%">rstan, edstan, ggplot2, TAM</tt>

License
:  BSD (3 clause), CC-BY


## Rasch and Two-Parameter Logistic Item Response Models with Latent Regression

<small>This case study documents Stan models for the Rasch and two-parameter logistic models with latent regression. The latent regression portion of the models may be restricted to an intercept only, yielding standard versions of the models. Simulations indicate that the two models successfully recover generating parameters. An example using a grade 12 science assessment is provided.</small>

[View](case-studies/rasch_and_2pl.html) <span class="note">(HTML)</span>

Authors
: Daniel C. Furr

Keywords
: education, item response theory, rasch model, two-parameter logistic model

Source Repository
: [example-models/education/rasch_and_2pl.html](https://github.com/stan-dev/example-models/tree/master/education/rasch_and_2pl.html)
<span class="note">(GitHub)</span>

R Package Dependencies
: <tt style="font-size: 90%">rstan, edstan, ggplot2, TAM</tt>

License
:  BSD (3 clause), CC-BY



## Two-Parameter Logistic Item Response Model

<small>This tutorial introduces the R package edstan for estimating
two-parameter logistic item response models using Stan without knowing
the Stan language. Subsequently, the tutorial explains how the model
can be expressed in the Stan language and fit using the rstan
package. Specification of prior distributions and assessment of
convergence are discussed. Using the Stan language directly has the
advantage that it becomes quite easy to extend the model, and this is
demonstrated by adding a latent regression and differential item
functioning to the model. Posterior predictive model checking is also
demonstrated.</small>

[View](case-studies/tutorial_twopl.html) <span class="note">(HTML)</span>

Author
: Daniel C. Furr, Seung Yeon Lee, Joon-Ho Lee, and Sophia Rabe-Hesketh

Keywords
: education, item response theory, two-parameter logistic model

Source Repository
: [example-models/education/tutorial_twopl](https://github.com/stan-dev/example-models/tree/master/education/tutorial_twopl)
<span class="note">(GitHub)</span>

R Package Dependencies
: <tt style="font-size: 90%">rstan, reshape2, ggplot2,
 gridExtra, devtools, edstan</tt>

License
:  BSD (3 clause), CC-BY

## Cognitive Diagnosis Model: DINA model with independent attributes

<small>This case study documents a Stan model for the DINA model with independent attributes. A Simulation indicates that the Stan model successfully recovers the generating parameters and predicts respondents' attribute mastery. A Stan model with no structure of the attributes is also discussed and applied to the simulated data. An example using a subset of the fraction subtraction data is provided. </small>

[View](case-studies/dina_independent.html) <span class="note">(HTML)</span>

Author
: Seung Yeon Lee

Keywords
: education, cognitive diagnosis model, diagnostic classification model, attribute mastery, DINA

Source Repository
: [example-models/education/dina_independent](https://github.com/stan-dev/example-models/tree/master/education/dina_independent)
<span class="note">(GitHub)</span>

R Package Dependencies
: <tt style="font-size: 90%">rstan, ggplot2, CDM</tt>

License
:  BSD (3 clause), CC-BY



## Pooling with Hierarchical Models for Repeated Binary Trials

<small>This note illustrates the effects on posterior inference of
pooling data (aka sharing strength) across items for repeated binary
trial data.  It provides Stan models and R code to fit and check
predictive models for three situations: (a) complete pooling, which
assumes each item is the same, (b) no pooling, which assumes the items
are unrelated, and (c) partial pooling, where the similarity among the
items is estimated.  We consider two hierarchical models to estimate
the partial pooling, one with a beta prior on chance of success and
another with a normal prior on the log odds of success.  The note
explains with working examples how to (i) fit models in RStan and plot
the results in R using ggplot2, (ii) estimate event probabilities,
(iii) evaluate posterior predictive densities to evaluate model
predictions on held-out data, (iv) rank items by chance of success,
(v) perform multiple comparisons in several settings, (vi) replicate
new data for posterior p-values, and (vii) perform graphical posterior
predictive checks. </small>

[View](case-studies/pool-binary-trials.html) <span class="note">(HTML)</span>

Author
: Bob Carpenter

Keywords
: binary trials, pooling, hierarchical models, baseball, epidemiology, prediction, posterior predictive checks

Source Repository
: [example-models/knitr/pool-binary-trials](https://github.com/stan-dev/example-models/tree/master/knitr/pool-binary-trials)
<span class="note">(GitHub)</span>

R Package Dependencies
: <tt style="font-size: 90%">rstan, ggplot2, rmarkdown</tt>

License
:  BSD (3 clause), CC-BY


#### RStanARM version

<small>There is also a version of this case study in which all models are fit using the
RStanARM interface. Many of the visualizations are also created using RStanARM's plotting
functions.
</small>

[View RStanARM version](case-studies/pool-binary-trials-rstanarm.html) <span class="note">(HTML)</span>

Author
: Bob Carpenter, Jonah Gabry, Ben Goodrich


# *Stan Case Studies*, &nbsp; Volume 2 &nbsp; (2015)

<hr style="margin:0.25em 0 0.25em 0;"/>
<hr style="margin:0 0 2em 0;"/>


## Multiple Species-Site Occupancy Model

<small>This case study replicates the analysis and output graphs of
Dorazio et al. (2006) noisy-measurement occupancy model for multiple
species abundance of butterflies.  Going beyond the paper, the
supercommunity assumptions are tested to show they are invariant to
sizing, and posterior predictive checks are provided.</small>

[View](case-studies/dorazio-royle-occupancy.html) <span class="note">(HTML)</span>

Author
: Bob Carpenter

Keywords
: ecology, occupancy, species abundance, supercommunity,
posterior predictive check

Source Repository
: [example-models/knitr/dorazio-royle-occupancy](https://github.com/stan-dev/example-models/tree/master/knitr/dorazio-royle-occupancy)
<span class="note">(GitHub)</span>

License
:  BSD (3 clause), CC-BY

R Package Dependencies
: <tt style="font-size: 90%">rstan, ggplot2, rmarkdown</tt>


# *Stan Case Studies*, &nbsp; Volume 1 &nbsp; (2014)

<hr style="margin:0.25em 0 0.25em 0;"/>
<hr style="margin:0 0 2em 0;"/>


## Soil Carbon Modeling with RStan

<small>This case study provides ordinary differential equation-based
compartment models of soil carbon flux, with experimental data fitted
with unknown initial compartment balance and noisy CO<sub>2</sub>
measurements.  Results form Sierra and Müller’s (2014) soilR package
are replicated.</small>

[View](case-studies/soil-knit.html) <span class="note">(HTML)</span>

Author
: Bob Carpenter

Keywords
: biogeochemistry, compartment ODE, soil carbon
respiration, incubation experiment

Source Repository
: [soil-metamodel/stan/soil-knit](https://github.com/soil-metamodel/stan/tree/master/soil-incubation)
<span class="note">(GitHub)</span>

License
:  BSD (3 clause), CC-BY

R Package Dependencies
: <tt style="font-size: 90%">rstan, ggplot2, rmarkdown</tt>
