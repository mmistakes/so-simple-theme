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
<span class="note">(preferably coded using knitr or Jupyter)</span> and

* an open-source license <span class="note">(preferably BSD 3
clause)</span>; authors retain all rights, including copyright.


# *Stan Case Studies*, &nbsp; Volume 3 &nbsp; (2016)

<hr style="margin:0.25em 0 0.25em 0;"/>
<hr style="margin:0 0 2em 0;"/>


## Hierarchical Two-Parameter Logistic Item Response Model

<small>This case study documents a Stan model for the two-parameter logistic model (2PL) with hierarchical priors. A brief simulation indicates that the Stan model successfully recovers the generating parameters. An example using a grade 12 science assessment is provided.</small>

Authors
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

View
: [HTML](case-studies/hierarchical_2pl.html)


## Generalized Rating Scale Model with Latent Regression

<small>This case study documents a Stan model for the generalized rating scale model (GRSM) with latent regression. The latent regression portion of the model may be restricted to an intercept only, yielding a standard GRSM. A brief simulation indicates that the Stan model successfully recovers the generating parameters. An example using a survey of public perceptions of science and technology is provided.</small>

Authors
: Daniel C. Furr

Keywords
: education, item response theory, generalized rating scale model

Source Repository
: [example-models/education/grsm_latent_reg](https://github.com/stan-dev/example-models/tree/master/education/grsm_latent_reg)
<span class="note">(GitHub)</span>

R Package Dependencies
: <tt style="font-size: 90%">rstan, ggplot2, ltm</tt>

License
:  BSD (3 clause), CC-BY

View
: [HTML](case-studies/grsm_latent_reg.html)


## Generalized Partial Credit Model with Latent Regression

<small>This case study documents a Stan model for the generalized partial credit model (GPCM) with latent regression. The latent regression portion of the model may be restricted to an intercept only, yielding a standard GPCM. A brief simulation indicates that the Stan model successfully recovers the generating parameters. An example using the TIMSS 2011 mathematics assessment is provided</small>

Authors
: Daniel C. Furr

Keywords
: education, item response theory, generalized partial credit model

Source Repository
: [example-models/education/gpcm_latent_reg](https://github.com/stan-dev/example-models/tree/master/education/gpcm_latent_reg)
<span class="note">(GitHub)</span>

R Package Dependencies
: <tt style="font-size: 90%">rstan, ggplot2, TAM</tt>

License
:  BSD (3 clause), CC-BY

View
: [HTML](case-studies/gpcm_latent_reg.html)


## Rating Scale Model with Latent Regression

<small>This case study documents a Stan model for the rating scale model (RSM) with latent regression. The latent regression portion of the model may be restricted to an intercept only, yielding a standard RSM. A brief simulation indicates that the Stan model successfully recovers the generating parameters. An example using a survey of public perceptions of science and technology is provided.</small>

Authors
: Daniel C. Furr

Keywords
: education, item response theory, rating scale model

Source Repository
: [example-models/education/rsm_latent_reg](https://github.com/stan-dev/example-models/tree/master/education/rsm_latent_reg)
<span class="note">(GitHub)</span>

R Package Dependencies
: <tt style="font-size: 90%">rstan, ggplot2, ltm</tt>

License
:  BSD (3 clause), CC-BY

View
: [HTML](case-studies/rsm_latent_reg.html)


## Partial Credit Model with Latent Regression

<small>This case study documents a Stan model for the partial credit model (PCM) with latent regression. The latent regression portion of the model may be restricted to an intercept only, yielding a standard PCM. A brief simulation indicates that the Stan model successfully recovers the generating parameters. An example using the TIMSS 2011 mathematics assessment is provided.</small>

Authors
: Daniel C. Furr

Keywords
: education, item response theory, partial credit model

Source Repository
: [example-models/education/pcm_latent_reg](https://github.com/stan-dev/example-models/tree/master/education/pcm_latent_reg)
<span class="note">(GitHub)</span>

R Package Dependencies
: <tt style="font-size: 90%">rstan, ggplot2, TAM</tt>

License
:  BSD (3 clause), CC-BY

View
: [HTML](case-studies/pcm_latent_reg.html)


## Rasch Model with Latent Regression

<small>This case study documents a Stan model for the Rasch model with latent regression. The latent regression portion of the model may be restricted to an intercept only, yielding a standard Rasch model. A brief simulation indicates that the Stan model successfully recovers the generating parameters. An example using a grade 12 science assessment is provided.</small>

Authors
: Daniel C. Furr

Keywords
: education, item response theory, rasch model

Source Repository
: [example-models/education/rasch_latent_reg](https://github.com/stan-dev/example-models/tree/master/education/rasch_latent_reg)
<span class="note">(GitHub)</span>

R Package Dependencies
: <tt style="font-size: 90%">rstan, ggplot2, TAM</tt>

License
:  BSD (3 clause), CC-BY

View
: [HTML](case-studies/rasch_latent_reg.html)


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

View
: [HTML](case-studies/tutorial_twopl.html)


## Two-Parameter Logistic Model with Latent Regression

<small>This case study documents a Stan model for the two-parameter logistic model (2PL) with latent regression. The latent regression portion of the model may be restricted to an intercept only, yielding a standard 2PL. A brief simulation indicates that the Stan model successfully recovers the generating parameters. An example using a grade 12 science assessment is provided.</small>

Authors
: Daniel C. Furr

Keywords
: education, item response theory, two-parameter logistic model

Source Repository
: [example-models/education/2pl_latent_reg](https://github.com/stan-dev/example-models/tree/master/education/2pl_latent_reg)
<span class="note">(GitHub)</span>

R Package Dependencies
: <tt style="font-size: 90%">rstan, ggplot2, TAM</tt>

License
:  BSD (3 clause), CC-BY

View
: [HTML](case-studies/2pl_latent_reg.html)


## Pooling with Hierarchical Models for Repeated Binary Trials

<small>This note illustrates the effects on posterior inference of pooling
data (aka sharing strength) across items for repeated binary trial
data.  It provides Stan models and R code to fit and check predictive
models for three situations: (a) complete pooling, which assumes each
item is the same, (b) no pooling, which assumes the items are
unrelated, and (c) partial pooling, where the similarity among the
items is estimated.  We consider two hierarchical models to estimate
the partial pooling, one with a beta prior on chance of success and
another with a normal prior on the log odds of success.  The note
explains with working examples how to (i) fit models in RStan and plot
the results in R using ggplot2, (ii) estimate event probabilities,
(iii) evaluate posterior predictive densities to evaluate model
predictions on held-out data, (iv) rank items by chance of success,
(v) perform multiple comparisons in several settings, (vi) replicate
new data for posterior p-values, and (vii) perform graphical posterior
predictive checks.</small>

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

View
: [HTML](case-studies/pool-binary-trials.html)


# *Stan Case Studies*, &nbsp; Volume 2 &nbsp; (2015)

<hr style="margin:0.25em 0 0.25em 0;"/>
<hr style="margin:0 0 2em 0;"/>


## Multiple Species-Site Occupancy Model

<small>This case study replicates the analysis and output graphs of
Dorazio et al. (2006) noisy-measurement occupancy model for multiple
species abundance of butterflies.  Going beyond the paper, the
supercommunity assumptions are tested to show they are invariant to
sizing, and posterior predictive checks are provided.</small>

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

View
: [HTML](case-studies/dorazio-royle-occupancy.html)


# *Stan Case Studies*, &nbsp; Volume 1 &nbsp; (2014)

<hr style="margin:0.25em 0 0.25em 0;"/>
<hr style="margin:0 0 2em 0;"/>


## Soil Carbon Modeling with RStan

<small>This case study provides ordinary differential equation-based
compartment models of soil carbon flux, with experimental data fitted
with unknown initial compartment balance and noisy CO<sub>2</sub>
measurements.  Results form Sierra and Müller’s (2014) soilR package
are replicated.</small>

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

View
: [HTML](case-studies/soil-knit.html)
<span class="note">(GitHub)</span>
