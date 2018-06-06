---
layout: page
title: StanCon 2018 Helsinki, 29-31 Aug 2018
excerpt: ""
modified:
image:
  feature: feature/wide_ensemble.png
  credit:
  creditlink:
---

One day of tutorials and two days of talks, open discussions, and statistical modeling in beautiful Helsinki, Finland.
{: style="font-size: 150%; text-align: center;"}

August 29-31, 2018 	&emsp; &bull; &emsp; Aalto University, Helsinki, Finland
{: style="font-size: 150%; text-align: center;"}

<center style="padding: 0.75em 0 0 0">
<img width="600" src="./Helsinki.jpg" /><br>
(c) Visit Helsinki / Jussi Hellsten.
</center>

------
- [**Location**](#location)
- [**Important Dates**](#important-dates)
- [**Call for contributed talks and posters**](#call-for-contributed-talks)
- [**Registration**](#registration-information)
- [**Accommodation**](#accommodation)
- [**Speakers and Schedule**](#speakers-and-schedule)
- [**Tutorials**](#tutorials)
- [**Sponsors**](#sponsors)
- [**StanCon 2018 Helsinki Organizing Committee**](#committee)


------

# [Location](#location)

### [Aalto University, Töölö Campus, Runeberginkatu 14-16, Helsinki, Finland](http://biz.aalto.fi/en/campus/toolo/)

StanCon 2018 Helsinki will take place at Aalto University Töölö Campus in the proximity of Helsinki city centre.

[Finland and Helsinki Travel Information](/events/stancon2018Helsinki/stancon-travel.html)

# [Important Dates](#important-dates)

Here are the important dates for StanCon 2018 Helsinki.

| Date | What |
|------|--------|
| ~~Apr 16, 2018~~ | ~~Contributed talks submissions~~ |
| ~~May 22, 2018~~ | ~~Contributed talks acceptance notifications (see update: [link](http://discourse.mc-stan.org/t/stancon-helsinki-submission-responses/4310))~~ |
| ~~May 31, 2018~~ | ~~Early registration ends <br> (Registration prices increase by 50%)~~ |
| July 31, 2018| Registration ends <br> (No additional registrations for StanCon after this point) |
| July 31, 2018| Poster submission deadline |
| Aug 29, 2018 | Stan tutorials, Aalto Otaniemi campus |
| Aug 30-31, 2018 | Stan Conference, Aalto Töölö campus |


# [Call for contributed talks](#call-for-contributed-talks)

## Contributed talks

StanCon’s version of conference proceedings is a collection of contributed talks based on interactive, self-contained notebooks (e.g., knitr, R Markdown, Jupyter, etc.). For example, you might demonstrate a novel modeling technique, or (possibly simplified version of) a novel application, etc. There is no minimum or maximum length and anyone using Stan is welcome to submit a contributed talk.

More details are available on the [StanCon submissions web page](/events/stancon2018Helsinki/stancon-submissions.html) and examples of accepted submissions from  are available in our [stancon_talks](https://github.com/stan-dev/stancon_talks) repository on GitHub.

## Contributed posters

We will accept poster submissions on a rolling basis until July 31st. One page exclusive of references is the desired format but anything that gives us enough information to make a decision is fine. We will accept/reject within 48 hours. Send to  stancon2018helsinki@mc-stan.org.


# [Registration Information](#registration-information)


### Registration

| Student | Academic | Industry |
|:------:|:------:|:------:|
| EUR 150 | EUR 300 | EUR 450 |

<br>

### Tutorials

| Student | Academic | Industry |
|:------:|:------:|:------:|
| EUR 30 | EUR 150 | EUR 225 |

<br>

[Details on registration and payments](/events/stancon2018Helsinki/stancon-registration.html)

If you have questions regarding registration, payments, travel, please email
[stancon.helsinki2018@tavicon.fi](mailto:stancon.helsinki2018@tavicon.fi).

# Scholarships

Thanks to our genereous sponsors (see below) we are able to offer a limited number of scholarships covering registration, and even more limited number of scholarships covering also (partially) accommodation and travel costs.  The scholarships are aimed at students who would not otherwise be able to attend.  To apply for a scholarship fill [the scholarship application form](https://docs.google.com/forms/d/e/1FAIpQLScZ8vCNxqvPrlTJZrQrot1xVc9QnVwiTLOUjOj0yv3cF57juA/viewform?usp=sf_link).

# [Accommodation](#accommodation)

Please make your hotel reservation directly to the hotels. We have arranged some deals with hotels and provide [a list of some recommended hotels near the venue](/events/stancon2018Helsinki/stancon-accommodation.html).

# [Speakers and Schedule](#speakers-and-schedule)

## Invited speakers!

* [Richard McElreath](http://xcelab.net/rm/), Max Planck Institute for Evolutionary Anthropology
<br> **Bad Data, Big Models, and Statistical Methods for Studying Evolution**
* [Maggie Lieu](https://maggielieu.com), European Space Astronomy Centre
<br> **Hierarchical modelling of galaxy clusters for Cosmology**
* [Sarah Heaps](http://www.ncl.ac.uk/maths-physics/staff/profile/sarahheaps.html), Newcastle University
<br> **Identifying the effect of public holidays on daily demand for gas**
* [Daniel Simpson](https://scholar.google.co.uk/citations?user=oQIKmWUAAAAJ&hl=en), University of Toronto
<br> **Esther Williams in the Harold Holt Memorial Swimming Pool: Some thoughts on complexity**

## Schedule

TBD! <!-- The committee is actively working on the schedule. -->

## [Get together](#gettogether)

Get together event will be on Wednesday evening (included in the
registration fee).

## [Dinner](#dinner)

Conference dinner will be on Thursday evening (included in the
registration fee).

# [Tutorials](#tutorials)

Pre-conference tutorials led by Stan developers are organized for 29th August 2018 at Aalto Otaniemi campus, 13mins from Helsinki city center. There will be at least two parallel sessions. For planning purposes we will ask your preferences, but that choice is not binding. The tutorial sessions are:

* **Basics of Bayesian inference and Stan** (morning half day), [Jonah Gabry](https://jgabry.github.io/)
<br>In this tutorial we will first review some of the foundational concepts in Bayesian statistics that are essential background for anyone interested in using Bayesian methods in practice. Then we will introduce the Stan language and the recommended workflow for applied Bayesian data analysis by working through an example analysis together. Since we only have 1/2 day for this tutorial it will be beneficial for participants to have at least some previous experience with statistical modeling, but prior experience fitting Bayesian models is not a requirement. 
<br>
This session will be helpful preparation for anyone interested in attending the afternoon session on hierarchical modeling. 
We will be interfacing with Stan from R, but users of Python and other languages/platforms can still benefit from the tutorial as all of the code we write in the Stan language (and all of the modeling techniques and concepts covered) can be used with any of the Stan interfaces.

* **Hierarchical models** (afternoon half day), [Ben Goodrich](https://github.com/bgoodri)
<br> Hierarchical models are and should be the default way to conduct a Bayesian analysis. By hierarchical Bayesian models, we mean any generative process where the distribution for some unknown depends on one or more other unknowns. This includes instrumental variables, interaction terms, hierarchical shrinkage priors and many others. However, the most common instance of a hierarchical model is one where the generative process allows some of the parameters to vary by group, which can be conveniently specified using the syntax of the **lme4** R package. In this tutorial we will start with estimating and interpreting estimates of hierarchical models using the `stan_glmer` function in the **rstanarm** R package, proceed to the `brm` function in the **brms** R package, and finish with some examples where participants modify or write code in the Stan language to specify a hierarchical model.
<br> Prerequisites: Some experience with R (not necessarily the aforementioned packages) and some experience with MCMC (not necessarily Stan).

* **Stan C++ development: adding a new function to Stan** (morning half day), [Bob Carpenter](http://bob-carpenter.github.io/) and [Sean Talts](https://github.com/seantalts)
<br> This tutorial will prepare you to submit your first pull
request for Stan's C++ libraries.  We will cover all of the
steps required to add a new function with analytic gradients
to the Stan language, including creating the issue, branching
in GitHub, code organization and style, unit testing, continuous
integration, code review, API and user-facing documentation, and
merging.  In addition to the process, we will survey the math library,
including scalar and matrix data types, automatic differentiation,
and template traits and metaprograms.

* **Model assessment and selection** (afternoon 1.5 hours), [Aki Vehtari](https://users.aalto.fi/~ave/)
<br>In this tutorial I will review estimation of predictive performance of models in M-open seetting where we assume that none of the models is the true model. When we don't trust our models, we can re-use data as a model-free proxy for the future data distribution. To adjust for data re-use we use leave-one-out cross-validation for exchangeable observations, K-fold cross-validation for group exchangeable observations, and m-step ahead validation for time series. I present how these performance estimates and related predictive distributions can be used for model comparison, averaging and checking. I discuss fast importance sampling approximation including useful diagnostics. Finally I discuss relations to alternative methods for model selection and weighting.
<br> 
Tutorial demonstrations are based on R with rstan, rstanarm, brms and loo packages.

* **Productization of Stan** (afternoon 1.5 hours), [Eric Novik](https://www.generable.com/about/)
<br>
We all love Stan for its expressivity and flexibility, and for making state-of-the-art
NUTS sampler available to a broad community of statisticians, econometricians, 
pharmacometricians, data scientists, and many other quantitative analysts.

What we don't love is munging and mapping data into Stan, slowly iterating over
many models, and deploying models into production for use by non-specialists.  
Integrating a robust Bayesian workflow from research into production is not trivial
but it is extremely rewarding as it puts the product of our work in the hands 
of people who need it most.

Many organizations have started doing this with Stan and there are some patterns
of use as well as anti-patterns that are emerging as a result. In this session, we will
present several approaches to productizing Stan and discuss their strengths 
and weaknesses.

* **Ordinary differential equation (ODE) models in Stan** (afternoon 1.5 hours), [Daniel Lee](https://www.generable.com/about/)
<br> This tutorial will cover the usage of the ordinary differential equation (ODE) solvers from within the Stan language. It will be a hands-on session where we'll learn to specify ODEs as functions, the use of the ODE integrators, and practical tips on packing and unpacking the arguments to the function.


# [Code of Conduct](#code-of-conduct)

In order to facilitate a welcoming environment for all attendees, StanCon 2018
will enforce a [code of conduct](/events/stancon2018Helsinki/stancon-code_of_conduct.html).


# [Sponsors](#sponsors)

Generous contributions from our sponsors ensure that our registration costs are kept as low as possible and allow for us to subsidize attendance for students who would otherwise be unable to attend.

<center style="padding: 0.75em 0 0 0">
<a href="http://corporate.elisa.com/"><img width="200" src="logos/logo-elisa_2x.png" /></a>
<span style="display:inline-block; width: 0.75em;"></span>
<a href="https://www.generable.com/"><img width="200" src="logos/generable_word_logo.png" /></a>
<span style="display:inline-block; width: 0.75em;"></span>
<a href="https://www.reaktor.com/"><img width="200" src="logos/Reaktor.png" /></a>
</center>

<center style="padding: 0.75em 0 0 0">
<a href="https://www.tweag.io/"><img width="200" src="logos/Tweag_logo_white.svg" /></a>
<span style="display:inline-block; width: 0.75em;"></span>
<a href="https://www.jumpingrivers.com/"><img width="200" src="logos/JumpingRivers.png" /></a>
<span style="display:inline-block; width: 0.75em;"></span>
<a href="https://www.smartly.io/"><img width="200" src="logos/smartly_vertical.png" /></a>
</center>

<center style="padding: 0.75em 0 0 0">
<a href="http://fcai.fi/"><img width="200" src="logos/fcai.png" /></a>
<span style="display:inline-block; width: 0.75em;"></span>
<a href="http://www.aalto.fi/en/"><img width="200" src="logos/Aalto_FI_13_RGB_7.png" /></a>
<span style="display:inline-block; width: 0.75em;"></span>
<a href="http://www.hiit.fi/"><img width="200" src="logos/hiit.jpg" /></a>
</center>

<center style="padding: 0.75em 0 0 0">
<a href="https://www.amazon.com/"><img width="200" src="logos/Amazon-logo-RGB.png" /></a>
<span style="display:inline-block; width: 0.75em;"></span>
<a href="https://www.bayer.com/"><img width="200" src="logos/bayer.png" /></a>
</center>

If you're interested in sponsoring StanCon 2018 Helsinki, please reach out to [stancon2018helsinki@mc-stan.org](mailto:stancon2018helsinki@mc-stan.org).

# <a name="committee"></a> [StanCon 2018 Helsinki Organizing Committee](#committee)

If you have questions regarding registration, payments, travel, please email
[stancon.helsinki2018@tavicon.fi](mailto:stancon.helsinki2018@tavicon.fi).

For other questions regarding StanCon Helsinki, please email us at [stancon2018helsinki@mc-stan.org](mailto:stancon2018helsinki@mc-stan.org).

StanCon is organized by a volunteer committee:

* Aki Vehtari (Aalto University)
* Breck Baldwin (Columbia University)
* Jonah Gabry (Columbia University)
* Lauren Kennedy (Columbia University)
* Daniel Lee (Generable)

Local organization committee in Helsinki:

* Eero Siivola (Aalto University)
* Juho Piironen (Aalto University)
* Topi Paananen (Aalto University)
* Tuomas Sivula (Aalto University)
* Michael Riis Andersen (Aalto University)
* Akash Dhaka (Aalto University)
* Shrikanth Gadicherla (Aalto University)
