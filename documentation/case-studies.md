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

To contribute a case study, please contact us through the [users
group](/community/).  We require

* a documented, reproducible example with narrative documentation
<span class="note">(e.g., knitr or Jupyter with software/compiler versions noted and seeds fixed)</span> and

* an open-source code license <span class="note">(preferably BSD or GPL
for code, Creative Commons for text)</span>; authors retain all copyright.

# *Stan Case Studies*, &nbsp; Volume 4 &nbsp; (2017)

<hr style="margin:0.25em 0 0.25em 0;"/>
<hr style="margin:0 0 2em 0;"/>

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
: conditional autorgressive (CAR), independent autoregressive (IAR), sparsity, spatial random effects, maps

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
: hierararchical/multilevel modeling, linear regression, model comparison, predictive inference, radon

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
