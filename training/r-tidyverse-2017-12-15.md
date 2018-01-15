---
layout: page
title: Data Manipulation and Visualisation using R
excerpt: "A course on dplyr and ggplot2"
---

- Sheffield - 15th December 2017
- 09:30am - 5pm
- Pam Liversidge Design Studio 2 - E06

<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d9519.181464571486!2d-1.4777067!3d53.3827108!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x60e5580cdf19b137!2sPam+Liversidge+Building!5e0!3m2!1sen!2suk!4v1510862811609" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>

## Registration

Registration is now closed. Please [check back](http://sbc.shef.ac.uk//training/) for future dates

## Overview

It has been said that 80% of data analysis is spent on the process of cleaning and preparing the data. In this course we introduce some relatively-new additions to the R programming language; dplyr and ggplot2. In combination these provide a powerful toolkit to make the process of manipulating and visualising data easy and intuitive. 

## Who should attend this course?

Researchers in life sciences who want to get started using R for their data analysis

## Aims:- After this course you should be able to:

- Import tidy datasets into R and perform some basic data cleaning
- Use dplyr to explore a dataset interactively
- Produce simple analysis workflows in R
- Make publication-ready graphics using ggplot2

## Objectives:- During this course you will learn about:

- What constitues a tidy dataset
- Subseting and filtering datasets using dplyr
- *Piping* commands together to form a workflow
- Producing summary statistics from a dataset
- Joining datasets using dplyr
- The grammar of graphics approach to plotting used in ggplot2
- Producing publication-ready graphics using ggplot2


## Prerequisites

We will assume that you have basic familarity with R and are familiar with vectors, data frames, variables and using functions.

## Software installation

You will need to bring an internet-enabled laptop to the course and install the latest versions of *both* R ***and*** RStudio before coming to the course

- [R](https://cran.r-project.org/)
- [RStudio](https://www.rstudio.com/products/rstudio/download/#download)

### Windows

Install R by downloading and running [this .exe file](http://cran.r-project.org/bin/windows/base/release.htm) from CRAN. Also, please install the [RStudio IDE](http://www.rstudio.com/ide/download/desktop). Note that if you have separate user and admin accounts, you should run the installers as administrator (right-click on .exe file and select "Run as administrator" instead of double-clicking). Otherwise problems may occur later, for example when installing R packages.

Please copy and paste the following line of text into an R console to install the R packages required for the course
```
install.packages(c("tidyverse","rmarkdown"))
```


### Mac

Install R by downloading and running [this .pkg file](http://cran.r-project.org/bin/macosx/R-latest.pkg) from CRAN. Also, please install the [RStudio IDE](http://www.rstudio.com/ide/download/desktop). 

Please copy and paste the following line of text into an R console to install the R packages required for the course
```
install.packages(c("tidyverse","rmarkdown"))
```

### Linux

You can download the binary files for your distribution from CRAN. Or you can use your package manager (e.g. for Debian/Ubuntu run `sudo apt-get install r-base` and for Fedora run `sudo yum install R`). Also, please install [the RStudio IDE](http://www.rstudio.com/ide/download/desktop). 

Please copy and paste the following line of text into an R console to install the R packages required for the course
```
install.packages(c("tidyverse","rmarkdown"))
```


## Course Data

Please click on this link to download all the files required to run the examples in the course:- [Click Here](https://rawgit.com/bioinformatics-core-shared-training/r-intermediate/master/Course_Data.zip)

## Instructors

- Mark Dunning, Bioinformatics Core Director
- Katjuša Koler, PhD Student, [Hide Lab](https://hidelab.wordpress.com/), (SITraN)
- Tim Freeman, PhD Student, [Wang lab](http://sitran.org/people/wang/), (SITraN)

## Schedule


- [Course Introduction](https://rawgit.com/bioinformatics-core-shared-training/r-intermediate/master/1.introduction.html)
- [Introduction to dplyr](https://rawgit.com/bioinformatics-core-shared-training/r-intermediate/master/2.dplyr-intro.nb.html)
- [Writing analysis workflows in R](https://rawgit.com/bioinformatics-core-shared-training/r-intermediate/master/3.workflows.nb.html)
- [Summarising and Combining data](https://rawgit.com/bioinformatics-core-shared-training/r-intermediate/master/4.summarise-and-combine.nb.html)
- [Plotting data with ggplot2](https://rawgit.com/bioinformatics-core-shared-training/r-intermediate/master/ggplot2.html)
    + [ggplot2 exercise set 1](https://rawgit.com/bioinformatics-core-shared-training/r-intermediate/master/ggplot2-exercises1-images.html)
    + [ggplot2 exercise set 2](https://rawgit.com/bioinformatics-core-shared-training/r-intermediate/master/ggplot2-exercises2-images.html)
    
## Solutions

- [dplyr Intro](https://rawgit.com/bioinformatics-core-shared-training/r-intermediate/master/2.dplyr-intro-solutions.html)
- [Workflows](https://rawgit.com/bioinformatics-core-shared-training/r-intermediate/master/3.workflows-solutions.html)
- [Summarising and Joining](https://rawgit.com/bioinformatics-core-shared-training/r-intermediate/master/4.summarise-and-combine-solutions.html)
- [ggplot2 exercise set 1](https://rawgit.com/bioinformatics-core-shared-training/r-intermediate/master/ggplot2-solutions1.html)
- [ggplot2 exercise set 2](https://rawgit.com/bioinformatics-core-shared-training/r-intermediate/master/ggplot2-solutions2.html)

## References

- [dplyr cheatsheet](https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf)
- [ggplot2 cheatsheet](https://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf)
- [R graphics gallery](https://www.r-graph-gallery.com/)
    
## Acknowledgements

These materials were developing in collaboration with Matthew Eldridge [(CRUK Cambridge Institute)](http://www.cruk.cam.ac.uk/core-facilities/bioinformatics-core), Thomas Carroll (Rockefeller University) and Michael Schubert.

## Feedback

- Please give us feedback on how we can improve the course using [this form](https://docs.google.com/forms/d/e/1FAIpQLScKnivGl4ixKPPyEm7DQYYknhdGbEgZUEud9O0HspOwhXXJ3A/viewform)

