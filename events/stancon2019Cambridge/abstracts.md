---
layout: page
title: StanCon 2019
excerpt: ""
modified:
image:
  feature: feature/wide_ensemble.png
  credit:
  creditlink:
---

[Return to main StanCon page](https://mc-stan.org/events/stancon2019Cambridge/)

* Pharmacuticals
	+ <i><b>Computing prediction and tolerance intervals for a mixture of normal distributions.</b></i>
Jean-francois Michiels, Timothy Mutsvari,  Oussama Errazi. <b>Pharmalex</b>. [Abstract](#1)

	+ <i><b>Parallel numerical ODE solution in Torsten for population models</b></i>. Yi Zhang,  William R. Gillespie. <b>Metrum LLC</b> [Abstract](#2)
	+ <i><b>Multi-channel Gaussian Processes as flexible alternatives to linear models: perspectives and challenges to scaling up Bayesian inference to genomic-scale data</b></i>. Caetano Souto-Maior, Susan T. Harbison. <b>Laboratory of Systems Genetics, National Heart Lung and Blood Institute, NIH.</b> [Abstract](#6)
	+ <i><b>Estimating the prevalence of HIV infection in England using Bayesian evidence synthesis</b></i>. Anne Presanis, Christopher Jackson [presenting author], Daniela De Angelis (MRC Biostatistics Unit, University of Cambridge);  Peter Kirwan, Alison Brown, Ada Miltz, Ross Harris, Cuong Chau, Stephanie Migchelsen, Hamish Mohammed, Katy Davison, Sara Croxford, Sarika Desai, Kathy Lowndes, Valerie Delpech, Noel Gill (Public Health England). <b></b> [Abstract](#8)




* Modeling

	+ <i><b>Gaussian process modeling and covariate selection for longitudinal data</b></i>. Juho Timonen, Aki Vehtari, Harri Lähdesmäki. <b>Aalto University</b> [Abstract](#3)
	+ <i><b>Estimating the effect of age and league on scoring rate in professional soccer</b></i>. Benjamin Torvaney. <b>Wefarm</b>  [Abstract](#7)



* Inference
    + <i><b>A Proposed Sampler for Stan</b></i>. Simon Maskell (University of Liverpool), Alessandro Varsi (University of Liverpool), Peter Green (University of Liverpool), Paul Horridge (University of Liverpool), Alejandro Diaz (University of Liverpool), Lee Devlin (University of Liverpool), Rob Moore (University of Liverpool), Katerina Chatzopoulou (University of Liverpool), Jinglai Li (University of Liverpool), Maria Sudell (University of Liverpool), Luke Mason (STFC), Robin Pinning (STFC), Jack Taylor (STFC), Vassil Alexandrov (STFC), Ed Pyzer-Knapp (IBM) . <b></b> [Abstract](#4)

    + <i><b>One weird trick: Non-parametric Bayesian updating by kernels</b></i>. Robert Grant. <b>BayesCamp</b> [Abstract](#5)

* Core Stan
	+ <i><b>The State of GPU Computation Support for Stan</b></i>. Rok Češnovar (University of Ljubljana - UL), Steve Bronder (Capital One), Davor Sluga (UL), Jure Demšar (UL), Tadej Ciglarič (UL), Sean Talts (Columbia University), Erik Štrumbelj (UL). <b></b> [Abstract](#10)



# Abstracts 


Accepted submissions were given the option being a poster or 15 minute presentation. The schedule is still being finalized. Subject to change.

<!--
<i><b></b></i>. . <b></b> [Abstract](#)


<i><b id=""></b></i>. . <b></b> 

Abstract:

<hr>
-->
<!--==============================================-->



<i><b id="10">The State of GPU Computation Support for Stan</b></i>. Rok Češnovar (University of Ljubljana - UL), Steve Bronder (Capital One), Davor Sluga (UL), Jure Demšar (UL), Tadej Ciglarič (UL), Sean Talts (Columbia University), Erik Štrumbelj (UL). <b></b> 

Abstract: Our presentations details the current state of and future work on the OpenCL-based framework that allows the Stan automatic differentiation library to utilize GPUs. Our research was initially motivated by large Gaussian Process models where the computation is dominated by the Cholesky decomposition but has since developed into an extensible framework. 

The following GPU-optimized routines for matrix algebra primitives are already available to Stan users (including reverse mode): matrix multiplication, solving triangular systems, Cholesky decomposition and some special cases. Several support functions are available in the Math library but not exposed to Stan users: matrix initialization, input validity checking, copy, pack/unpack, multiplication by scalar, and transpose. We have made progress on implementing commonly used likelihoods - 4 Generalized Linear Model likelihoods can already be used: normal (identity), Bernoulli (logit), Poisson (log) and Negative Binomial (log). And data caching is now available and substantially reduces the overhead of transferring data to the GPU.

We will show how problem size, model and choice of hardware impact the speedups that we can achieve with GPU computation in Stan. Finally, we will discuss directions for future work, routines to implement next, autotuning tunable GPU parameters and advanced data caching.

<hr>



<i><b>Using the Stan Math Library to reduce memory consumption for tape-based Algorithmic Differentiation (AD)</b></i>. Philip Maybank. <b>Numerical Algorithms Group (NAG)</b> [Abstract](#9)


<i><b id="9">Using the Stan Math Library to reduce memory consumption for tape-based Algorithmic Differentiation (AD)</b></i>. Philip Maybank. <b>Numerical Algorithms Group (NAG)</b>

Abstract: Tape-based AD Libraries, such as dco/c++, keep a record of calculations that are executed by a program in order to evaluate derivatives.  They are applicable to a wider range of numerical codes than tape-free AD libraries, which are typically written to compute derivatives for a specific library of functions.
The Stan Math Library is a tape-free AD library.  By comparison with tape-based approaches, memory requirements are low.  Each function in the Stan Math library has a corresponding adjoint function, which is used to evaluate derivatives.  The memory requirements of the dco/c++ tool can be made arbitrarily low through manipulation of the tape recording.  For example, users can insert gaps into the tape which are then filled by a user-supplied derivative.
The basic idea of the work in this presentation is that the Stan Math Library can be used to supply derivatives to dco/c++.  This can dramatically reduce the memory requirements of dco/c++ for a minimal amount of effort on the part of the user.  This is important for production code in industry where a tape-based approach is needed to cover the full code base.
For simplicity we illustrate this idea on a toy problem: inferring the parameters of a damped harmonic oscillator driven by white noise using the simplified manifold MALA (smMALA) algorithm.

References: 
dco/c++

*	https://www.stce.rwth-aachen.de/research/software/dco/cpp
*	https://www.nag.co.uk/content/algorithmic-differentiation-software

Stan Math Library: 

*	https://github.com/stan-dev/math
*	https://arxiv.org/abs/1509.07164

<hr>

<i><b id="8">Estimating the prevalence of HIV infection in England using Bayesian evidence synthesis</b></i>. Anne Presanis, Christopher Jackson [presenting author], Daniela De Angelis (MRC Biostatistics Unit, University of Cambridge);  Peter Kirwan, Alison Brown, Ada Miltz, Ross Harris, Cuong Chau, Stephanie Migchelsen, Hamish Mohammed, Katy Davison, Sara Croxford, Sarika Desai, Kathy Lowndes, Valerie Delpech, Noel Gill (Public Health England). <b></b> 

Abstract: We present a substantive application of Stan that has informed national health policy.

Annual estimation of the number of people living with HIV in England, including those who are unaware of their infection, has, for several years, been based on a Bayesian model that combines evidence from multiple sources of data.  For several demographic and risk groups, the model estimates the number of people in each group, the prevalence of HIV, and the proportion of HIV infections that are diagnosed.

In the 2018 version of this model, implemented in Stan, the strata are defined by age, gender, sexual behaviour, injecting drug use, ethnicity and region. Changes between years are also modelled.  Routinely-collected data sources include a register of diagnosed HIV infections, a register of attendances at genitourinary medicine (GUM) clinics, and the national census.  These are combined with data from several surveys of health and sexual behaviour among different groups, HIV testing data from unlinked anonymous surveys of drug users, and data from HIV testing of donated blood.

This is an example of a ""multiparameter evidence synthesis"", where the quantities of interest cannot be estimated directly, but can be inferred indirectly through a network of model assumptions.  Potential biases due to selection, under-reporting and missing data are represented explicitly through structural assumptions and informative priors.  A four-level hierarchical model is used to borrow strength between stratum-specific parameters.   Stan's model description language makes the assumptions explicit, and its inference engine provides posterior estimates efficiently.

The estimates from 2018 demonstrate that the UN-AIDS target of 90% of infections diagnosed by 2020 has been met in England, and the estimates continue to inform policies around HIV testing, treatment and prevention.

<hr>

<i><b id="7">Estimating the effect of age and league on scoring rate in professional soccer</b></i>. Benjamin Torvaney. <b>Wefarm</b>

Abstract: Understanding the effect of different factors on player output is critical to accurately evaluating player performance. In particular, it is useful to be able to project performance into the future, whether to assess a potential new signing, or to aid in squad management. To do this, we must account for footballing context. Intuitively, we know that scoring goals in the Norwegian Eliteserien is less impressive than scoring in the Premier League; however, this is rarely quantified.

If we propose a model in which a player's expected goalscoring rate is the product of their ability, the difficulty of the competition, and a relative age effect, we can estimate the effect of each parameter from historical goalscoring tallies (accompanied by minutes played). We can extend the model to allow competition factors to vary over time, to reflect the changing dynamics of professional soccer.

Such a model yields promising results: high profile soccer stars have the highest model estimates; a clear age curve for goalscoring is produced; competition strengths vary over time in accordance with popular perception.

<hr>



<i><b id="6">Multi-channel Gaussian Processes as flexible alternatives to linear models: perspectives and challenges to scaling up Bayesian inference to genomic-scale data</b></i>. Caetano Souto-Maior, Susan T. Harbison. <b>Laboratory of Systems Genetics, National Heart Lung and Blood Institute, NIH.</b> 

Abstract:

<hr>


<i><b id="5">One weird trick: Non-parametric Bayesian updating by kernels</b></i>. Robert Grant. <b> BayesCamp</b> 

Abstract: One of the big attractions for people adopting Bayesian methods is the promise of ""updating"" their parameter estimates and predictions as more data arrive. Yesterday's posterior becomes today's prior. In practice, this is not always simple, requiring at the very least a complete set of sufficient statistics, random samples from an unchanging population, and no changes of mind about the probability distribution for the priors. Sometimes, one would like to update without imposing an a priori distribution on yesterday's posterior and without estimating lots of statistics. I discuss a kernel approach, which is easily incorporated in Stan by an additional target+= statement, looping over yesterday's posterior draws, and uniform proposal densities. I compare this with parametric updates, and explore the potential to reduce computation by using kernels weighted by counts of posterior draws inside hypercubes of parameter space.


<hr>




<i><b id="4">A Proposed Sampler for Stan</b></i>. Simon Maskell (University of Liverpool), Alessandro Varsi (University of Liverpool), Peter Green (University of Liverpool), Paul Horridge (University of Liverpool), Alejandro Diaz (University of Liverpool), Lee Devlin (University of Liverpool), Rob Moore (University of Liverpool), Katerina Chatzopoulou (University of Liverpool), Jinglai Li (University of Liverpool), Maria Sudell (University of Liverpool), Luke Mason (STFC), Robin Pinning (STFC), Jack Taylor (STFC), Vassil Alexandrov (STFC), Ed Pyzer-Knapp (IBM). <b></b> 

Abstract: Stan uses the No U-Turn Sampler (NUTS), a specific instance of Markov Chain Monte Carlo (MCMC). MCMC can be slow, e.g., when dimensionality is high and it would be better if NUTS was faster. We have recently been working to improve the run-time of a solution to problems that Stan can tackle (and those that it cannot, e.g. those that would require reversible jump MCMC). Our approach has been to replace NUTS with a variant of a Sequential Monte Carlo (SMC) sampler that uses the clever ideas embodied in NUTS without coupling them to MCMC specifically. SMC samplers manipulate a population of samples, making it possible to distribute computation across each of many processors. Our work has shown that SMC samplers can be configured to exploit this parallelism (and the advances that have led to the development of, for example, the use of NUTS as a proposal distribution). This can achieve faster run-time than MCMC in terms of the number of effective samples per second (by running the SMC sampler on clusters of hundreds of cores, as are routinely used in the context of Deep Learning, for example). Furthermore, we have shown that SMC samplers can be configured to outperform MCMC by making better use of the available processing resources. This is possible because MCMC’s convergence proofs require that the single sampling chain never goes wrong while the proofs for SMC samplers only require that the samples don’t all malfunction simultaneously. Put another way, SMC samplers have an additional degree of freedom in their design and this degree of freedom can be exploited to offer improved performance relative to MCMC. This talk will explain how SMC samplers can outperform MCMC per second and per flop. We will also describe our progress to date on integrating SMC samplers into Stan: our intent is to make it possible to use all Stan files. Thus far we’re able to achieve a runtime that is over an order of magnitude faster than MCMC.

<hr>


<i><b id="3">Gaussian process modeling and covariate selection for longitudinal data</b></i>. Juho Timonen, Aki Vehtari, Harri Lähdesmäki. <b>Alto University</b> 

Abstract: Longitudinal data arises when the same observational units are measured repeatedly, and is common in clinical studies. Such data is often modeled using generalized linear mixed effect models with off-the-shelf software packages. These are, however, restricted to a parametric form and cannot model non-stationary disease effects. We demonstrate our new R-package for interpretable Bayesian non-parametric modeling of longitudinal data using additive Gaussian processes. Like the R-packages and brms, our goal is to provide an interface to Stan with a simple and intuitive syntax. However, our Stan program is specifically designed for Gaussian process modeling of longitudinal data, allowing the user to specify a model that mixes group and individual-specific age effects or effects of other continuous or categorical covariates. We show how our package uses Stan to model non-stationary disease effects and uncertainty of the observed disease onsets, identify heterogeneous effects present in only a subset of study subjects, and handles general non-Gaussian likelihoods. Furthermore, we define a way of resolving the relevance of any continuous or categorical covariate by sampling only one full model with all covariates included. Our focus is on biomedical applications, where is often vital to determine which covariates affect the response variable, in order to reduce future measurement costs or have a better interpretation about the progression of a disease.

<hr>



<i><b id="1">Computing prediction and tolerance intervals for a mixture of normal distributions.</b></i>
Jean-francois Michiels, Timothy Mutsvari,  Oussama Errazi. <b>Pharmalex</b> 

Abstract: For the submission of a Biosimilar product, Biosimilarity assessment is the first step to achieve in the “Totality of Evidence” strategy as required by Authorities (e.g. FDA). The main objective of biosimilarity is to give evidence that the test biological product is as similar as possible to the reference product. The definition of ‘similar’ remains a critical component that needs to be addressed and justified. For biologicals, it is the process and its capability that should be evaluated, i.e. the risk of producing batches outside defendable limits. Thus, the first step is to set the acceptance limits. 
β-expectation and (β,γ), also known as Beta-Gamma, tolerance intervals are useful metrics to demonstrate that a test product (i.e. the biosimilar) is similar to a reference product. Biosimilarity is concluded if the β-expectation of the biosimilar product is within the (β,γ) of the reference. β-expectation interval is constructed to contain a β proportion of the population on average. A (β,γ) tolerance interval on the other hand is built to contain at least a β proportion of the population with a confidence level γ. 
In general, the pharmaceutical company producing the biosimilar has no access to the data of the reference product. Buying boxes of the reference product from several drugstores and analysing them is nevertheless one possible strategy to acquire knowledge on the process variability. Due to that sampling strategy, the distribution of the reference product can be quite exotic and it is likely that the distribution of the reference product is a mixture of normal distributions.
Fitting a mixture of 2 normal distributions on data is performed using Stan. The output are the posterior distributions of the mean and standard deviation of the 2 normal distributions and the posterior distribution of the relative proportion of the 2 distributions. We present different algorithms to derive β-expectation and (β,γ) tolerance intervals for a mixture of 2 normal distributions. Using simulations, the operating characteristics of the intervals are shown (e.g. the capability to conclude similarity when it is actually similar).

<hr>
<i><b id="2">Parallel numerical ODE solution in Torsten for population models</b></i>. Yi Zhang,  William R. Gillespie. <b>Metrum LLC</b>

Abstract: Torsten is a collection of functions to facilitate analysis of pharmacometric data using Stan. To seek an alternative to the ""map_rect"" function for within-chain parallel computation in Stan, we have implemented numerical ODE solution functions for population models with functional signatures that specify schedules of events such as doses and observations in a manner consistent with NONMEM compatible.

  The population solution function feature is designed toward multi-level parallelization using Message Passing Interface(MPI). For that we first implemented Torsten's own ODE integrators based on CVODES library. Table 1 shows MPI performance results of such an integrator on a group of 1000 Lorenz systems.

<table>
<tr><td>n_processor</td><td>Walltime(ms)</td><td>Speedup</td><td>efficiency</td></tr>
<tr><td>1</td><td>10986</td><td>1.00</td><td> 1.00</td></tr>
<tr><td>2     </td><td>     5505  </td><td>   2.00    </td><td>    1.00 </td></tr>
<tr><td>             4 </td><td>         3091 </td><td>    3.55  </td><td>      0.89</td></tr> 
<tr><td>             8    </td><td>      1459   </td><td>  7.53   </td><td>     0.94 </td></tr>
<tr><td>            16   </td><td>      1355 </td><td>    8.11  </td><td>      0.51 </td></tr>
<tr><td>            32       </td><td>    739  </td><td>  14.87    </td><td>   0.46 </td></tr>
<tr><td>            64      </td><td>     424 </td><td>   25.91     </td><td>  0.40 </td></tr>
<tr><td>           128        </td><td>  382  </td><td>  28.76   </td><td>    0.22 </td></tr>
<tr><td>           256     </td><td>     284  </td><td>  38.68    </td><td>   0.15 </td></tr>
<tr><td>          512      </td><td>    293   </td><td> 37.49   </td><td>    0.07 </td></tr>
</table>
  Table 1: MPI performance of the Lorenz model solved by Torsten's BDF
  integrator. (n_population = 1000)

  Then we developed MPI-based population solvers that are specifically designed for PKPD applications, for which ODE system size $n$ is typically in the scale of $10^0\sim 10^2$. We employ the latest standard(MPI-3) functionalities for latency hiding, and test the implementation on two MPI implementations (OpenMPI and MPICH). Tables 2-5 show performance results of one such function on a simple two-compartment PK model($n=3$) and a more complex PKPD model($n=8$), run on a METWORX workflow.

<table>
<tr><td>n_processor</td><td>Walltime(ms)</td><td>Speedup</td><td>efficiency</td></tr>
<tr><td>      1       </td><td>              2966  </td><td>    1.00    </td><td>     1.00 </td></tr>
<tr><td>      2        </td><td>              1544   </td><td>   1.92    </td><td>     0.96 </td></tr>
<tr><td>      4         </td><td>               866  </td><td>    3.42   </td><td>      0.85 </td></tr>
<tr><td>      8        </td><td>                887  </td><td>    3.34   </td><td>      0.42 </td></tr>
</table>
Table 2: Parallel performance of solving a two-compartment population
  model using pmx_solve_group_bdf and OpenMPI.


<table>
<tr><td>n_processor</td><td>Walltime(ms)</td><td>Speedup</td><td>efficiency</td></tr>
<tr><td>      1     </td><td>                45791  </td><td>    1.00  </td><td>       1.00 </td></tr>
<tr><td>      2      </td><td>               23532  </td><td>    1.95    </td><td>     0.97 </td></tr>
<tr><td>      4      </td><td>               13421  </td><td>    3.41    </td><td>     0.85 </td></tr>
<tr><td>      8       </td><td>              10394  </td><td>    4.41    </td><td>     0.55 </td></tr>
</table>
Table 3: Parallel performance of solving a Neutropenia population
  model using pmx_solve_group_bdf and OpenMPI.


<table>
<tr><td>n_processor</td><td>Walltime(ms)</td><td>Speedup</td><td>efficiency</td></tr>
<tr><td>      1      </td><td>                 2470  </td><td>    1.00    </td><td>     1.00 </td></tr>
<tr><td>      2     </td><td>                  1419   </td><td>   1.74     </td><td>    0.87 </td></tr>
<tr><td>      4      </td><td>                 1170   </td><td>   2.11    </td><td>     0.53 </td></tr>
<tr><td>      8      </td><td>                   860   </td><td>   2.87    </td><td>     0.36 </td></tr>
</table>
Table 4: Parallel performance of solving a two-compartment population
  model using pmx_solve_group_bdf and MPICH.

<table>
<tr><td>n_processor</td><td>Walltime(ms)</td><td>Speedup</td><td>efficiency</td></tr>
<tr><td>      1       </td><td>                45087  </td><td>    1.00    </td><td>     1.00 </td></tr>
<tr><td>      2        </td><td>               22976   </td><td>   1.96    </td><td>     0.98 </td></tr>
<tr><td>      4        </td><td>               14158   </td><td>   3.18    </td><td>     0.80 </td></tr>
<tr><td>      8        </td><td>               10523   </td><td>   4.28    </td><td>     0.54 </td></tr>
</table>
Table 5: Parallel performance of solving a Neutropenia population
  model using pmx_solve_group_bdf and MPICH.

  In addtional to population-level parallelization, we are also implementing individual-level parallelization based on parallel time integration with multigrid.  This will enables us to reduce the solution time of a single ODE system, and create a multi-level parallelization for ODE-based population models. The results of a preliminary implementation are shown in Table 6.

<table>
<tr><td>n_processor</td><td>Walltime(ms)</td><td>Speedup</td><td>efficiency</td></tr>
<tr><td>      1        </td><td>                 2.8   </td><td>   1.00   </td><td>      1.00 </td></tr>
<tr><td>      2          </td><td>               1.7   </td><td>   1.65    </td><td>     0.82 </td></tr>
<tr><td>      4          </td><td>               1.2   </td><td>   2.33    </td><td>     0.58 </td></tr>
</table>  
Table 6: Parallel performance of solving 10^4 steps of a single
  Neutropenia ODE system using parallel-in-time technique.

<hr>
<i><b></b></i>. . <b></b>




<hr>
<i><b></b></i>. . <b></b>

<hr>
<i><b></b></i>. . <b></b>

<hr>
<i><b></b></i>. . <b></b>