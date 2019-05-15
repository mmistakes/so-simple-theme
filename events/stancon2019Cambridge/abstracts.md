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

# Abstracts 

# [Presentations/Posters](#accepted)

Accepted submissions were given the option being a poster or 15 minute presentation. The schedule is still being finalized. Subject to change.

[**Modeling**](#modeling)

[**Stan Development**](#development)

### [Modeling](#modeling)

<i><b>Computing prediction and tolerance intervals for a mixture of normal distributions.</b></i>
Jean-francois Michiels, Timothy Mutsvari,  Oussama Errazi. <b>Pharmalex</b>

Abstract: For the submission of a Biosimilar product, Biosimilarity assessment is the first step to achieve in the “Totality of Evidence” strategy as required by Authorities (e.g. FDA). The main objective of biosimilarity is to give evidence that the test biological product is as similar as possible to the reference product. The definition of ‘similar’ remains a critical component that needs to be addressed and justified. For biologicals, it is the process and its capability that should be evaluated, i.e. the risk of producing batches outside defendable limits. Thus, the first step is to set the acceptance limits. 
β-expectation and (β,γ), also known as Beta-Gamma, tolerance intervals are useful metrics to demonstrate that a test product (i.e. the biosimilar) is similar to a reference product. Biosimilarity is concluded if the β-expectation of the biosimilar product is within the (β,γ) of the reference. β-expectation interval is constructed to contain a β proportion of the population on average. A (β,γ) tolerance interval on the other hand is built to contain at least a β proportion of the population with a confidence level γ. 
In general, the pharmaceutical company producing the biosimilar has no access to the data of the reference product. Buying boxes of the reference product from several drugstores and analysing them is nevertheless one possible strategy to acquire knowledge on the process variability. Due to that sampling strategy, the distribution of the reference product can be quite exotic and it is likely that the distribution of the reference product is a mixture of normal distributions.
Fitting a mixture of 2 normal distributions on data is performed using Stan. The output are the posterior distributions of the mean and standard deviation of the 2 normal distributions and the posterior distribution of the relative proportion of the 2 distributions. We present different algorithms to derive β-expectation and (β,γ) tolerance intervals for a mixture of 2 normal distributions. Using simulations, the operating characteristics of the intervals are shown (e.g. the capability to conclude similarity when it is actually similar).

<i><b>Parallel numerical ODE solution in Torsten for population models</b></i>. Yi Zhang,  William R. Gillespie. <b>Metrum LLC</b>

Abstract: Torsten is a collection of functions to facilitate analysis of pharmacometric data using Stan. To seek an alternative to the ""map_rect"" function for within-chain parallel computation in Stan, we have implemented numerical ODE solution functions for population models with functional signatures that specify schedules of events such as doses and observations in a manner consistent with NONMEM compatible.

  The population solution function feature is designed toward multi-level parallelization using Message Passing Interface(MPI). For that we first implemented Torsten's own ODE integrators based on CVODES library. Table 1 shows MPI performance results of such an integrator on a group of 1000 Lorenz systems.

   n_processor  Walltime(ms)  Speedup  efficiency 
  -------------------------------------------------------------------------------
             1        10986     1.00        1.00 
             2          5505     2.00        1.00 
             4          3091     3.55        0.89 
             8          1459     7.53        0.94 
            16         1355     8.11        0.51 
            32           739    14.87       0.46 
            64           424    25.91       0.40 
           128          382    28.76       0.22 
           256          284    38.68       0.15 
           512          293    37.49       0.07 
  Table 1: MPI performance of the Lorenz model solved by Torsten's BDF
  integrator. (n_population = 1000)

  Then we developed MPI-based population solvers that are specifically designed for PKPD applications, for which ODE system size $n$ is typically in the scale of $10^0\sim 10^2$. We employ the latest standard(MPI-3) functionalities for latency hiding, and test the implementation on two MPI implementations (OpenMPI and MPICH). Tables 2-5 show performance results of one such function on a simple two-compartment PK model($n=3$) and a more complex PKPD model($n=8$), run on a METWORX workflow.

   n_processor  Walltime(s)  speedup  efficiency 
  -------------------------------------------------------------------------------
             1                     2966     1.00        1.00 
             2                     1544     1.92        0.96 
             4                       866     3.42        0.85 
             8                       887     3.34        0.42 
  Table 2: Parallel performance of solving a two-compartment population
  model using pmx_solve_group_bdf and OpenMPI.


   n_processor  Walltime(s)  speedup  efficiency 
  -------------------------------------------------------------------------------
             1                    45791     1.00        1.00 
             2                    23532     1.95        0.97 
             4                    13421     3.41        0.85 
             8                    10394     4.41        0.55 
  Table 3: Parallel performance of solving a Neutropenia population
  model using pmx_solve_group_bdf and OpenMPI.


   n_processor  Walltime(s)  speedup  efficiency 
  -------------------------------------------------------------------------------
             1                      2470     1.00        1.00 
             2                      1419     1.74        0.87 
             4                      1170     2.11        0.53 
             8                        860     2.87        0.36 
  Table 4: Parallel performance of solving a two-compartment population
  model using pmx_solve_group_bdf and MPICH.

   n_processor  Walltime(s)  speedup  efficiency 
  -------------------------------------------------------------------------------
             1                      45087     1.00        1.00 
             2                      22976     1.96        0.98 
             4                      14158     3.18        0.80 
             8                      10523     4.28        0.54 
  Table 5: Parallel performance of solving a Neutropenia population
  model using pmx_solve_group_bdf and MPICH.

  In addtional to population-level parallelization, we are also implementing individual-level parallelization based on parallel time integration with multigrid.  This will enables us to reduce the solution time of a single ODE system, and create a multi-level parallelization for ODE-based population models. The results of a preliminary implementation are shown in Table 6.

   n_processor  Walltime(s)  speedup  efficiency 
  -------------------------------------------------------------------------------
             1                        2.8     1.00        1.00 
             2                        1.7     1.65        0.82 
             4                        1.2     2.33        0.58 
  Table 6: Parallel performance of solving 10^4 steps of a single
  Neutropenia ODE system using parallel-in-time technique.
  
<i></i>. .<b></b>

<i></i>. .<b></b>