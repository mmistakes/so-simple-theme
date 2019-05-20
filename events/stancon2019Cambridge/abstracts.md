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

[**Pharmacutical**](#pharma)

[**Core Stan**](#development)

[**Inference**](#inference)

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

<!-- 
|n_processor|Walltime(ms)|Speedup|efficiency|
|-------|--------|-------|-----| 
|1|10986|1.00| 1.00|
|2     |     5505  |   2.00    |    1.00 |
|             4 |         3091 |    3.55  |      0.89| 
|             8    |      1459   |  7.53   |     0.94 |
|            16   |      1355 |    8.11  |      0.51 |
|            32       |    739  |  14.87    |   0.46 |
|            64      |     424 |   25.91     |  0.40 |
|           128        |  382  |  28.76   |    0.22 |
|           256     |     284  |  38.68    |   0.15 |
|          512      |    293   | 37.49   |    0.07 |

-->

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

