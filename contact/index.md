---
layout: page
title: Contact Us
excerpt: ""
modified:
image:
  feature: feature/wide_ensemble.png
  credit:
  creditlink:
---

Mailing Lists
=============

Because the Stan developers and users are distributed
geographically, almost all of the discussions of Stan takes place on
our group mailing lists.  We prefer to communicate to a wide
audience via the users group than to individuals via e-mail.

Users Group
-----------

The Users Group is for general discussion of Stan, including
modeling and installation issues.

* [Stan Users Group](https://groups.google.com/forum/?fromgroups#!forum/stan-users)
  <span class="note">(on Google Groups)</span>

Everyone who joins the users group has posting privileges.

Developers Group
----------------

The developers group is for the [development team](/team/)
to discuss Stan's code.

* [Stan Developers Group](https://groups.google.com/forum/?fromgroups#!forum/stan-dev)
  <span class="note">(on Google Groups)</span>

The developers group is open for everyone to read, but posting
is restricted to Stan developers; see the [contribution page](/contribute/)
contribution page if you are interested in contributing code.

Announcement Group
------------------

This group is only used to announce new releases.

* [Stan Announcement Group](https://groups.google.com/forum/?fromgroups#!forum/stan-announce)
  <span class="note">(on Google Groups)</span>

Buildbot Group
--------------

Stan follows a continuous integration process. Mail regarding
integration test failures is sent to this groups.

* [Stan Buildbot Group](https://groups.google.com/forum/?fromgroups#!forum/stan-buildbot)
  <span class="note">(on Google Groups)</span>

Reporting Bugs and Issues
=========================

Stan uses an issue tracker for reporting and monitoring progress
on bug fixes and feature requests.  Bugs include bugs in Stan, its
interfaces, installation, sample models, and documentation typos or
brainos.

Users can report bugs or request features by:

* mailing the Users' Group or
* opening an issue on the appropriate issue tracker.

The issue trackers for Stan and its interfaces are linked below.

How to Report Bugs
------------------

The rest of this page explains how to report bugs or request
features to make it easy for the development team to respond.  We
try to be responsive and track issues, but sometimes get behind or
forget;  if you have reported a bug and it doesn't get resolved,
please remind us on the issue tracker, through the users group,
or in a direct email.

The key to a successful bug report is to provide as much context as
possible.  Ideally, this will be in the form of a small example that
allows the developers to easily reproduce the bug.

Installation issues should be discussed on the users group; some
of these may be promoted to bugs or feature requests depending on
their root cause.

Documentation typos, brainos, or requests for more information
may be reported either on the users group or issue tracker.  Reports
should include the name of the document or web site and version as
well as page numbers or a link.

Modeling issues that have not been isolated in small reproducible
examples should first be discussed on the users group.

Bugs that have been isolated to reproducible examples may be
reported on the users group or issue tracker.  Bug reports should
include information about

* interface (RStan, PyStan, CmdStan) with version
* underlying language version (R, Python, Shell)
* any wrapper interfaces used and version (e.g., RStudio, RGui, IPython Notebook)
* operating system and version (Windows [including 32 bit or 64 bit], Mac
       OS X, Linux)
* system memory available
* C++ compiler (clang++, g++) with version
  * for CmdStan, include the result of <tt>g++ --version</tt>
        or <tt>clang++ --version</tt> and <tt>make --version</tt>
  * for RStan, include the full text of your <tt>.R/Makevars</tt>,
        which can be viewed from within R using
        <tt> file.show(file.path(Sys.getenv('HOME'),'.R','Makevars'))</tt>

For R users, most of this information is reported within R by <tt>sessionInfo()</tt>.

Most importantly, it is almost impossible to diagnose a bug without the

* full model file and data that produces the bug.

How to Request Features
-----------------------

The Stan developers are happy to field feature requests from
users.  Feature requests can be for new functions to support, new
samplers, support for platforms, etc.  Please provide as much
information as possible, including links to papers or formulas.

Feature requests should be made either on the users group or
using the issue tracker.

Issue Trackers
--------------

For issues with Stan itself, including bugs in functions, the
modeling language, the modeling language manual, or the behavior of
sampling, optimization, or diagnosis, use the Stan issue tracker.

* [Stan Issue Tracker](https://github.com/stan-dev/stan/issues)
  <span class="note">(Stan GitHub)</span>

For issues that are limited to RStan, PyStan, CmdStan,
MatlabStan, Stan.jl, or ShinyStan, including installation issues,
use the individual interface issue trackers.

* [RStan Issue Tracker](https://github.com/stan-dev/rstan/issues)
  <span class="note">(RStan GitHub)</span>

* [PyStan Issue Tracker](https://github.com/stan-dev/pystan/issues)
  <span class="note">(PyStan GitHub)</span>

* [CmdStan Issue Tracker](https://github.com/stan-dev/cmdstan/issues)
  <span class="note">(CmdStan GitHub)</span>

* [MatlabStan Issue Tracker](https://github.com/brian-lau/MatlabStan/issues)
  <span class="note">(MatlabStan GitHub)</span>

* [Stan.jl Issue Tracker](https://github.com/goedman/Stan.jl/issues)
  <span class="note">(Stan.jl GitHub)</span>

* [ShinyStan Issue Tracker](https://github.com/stan-dev/shinystan/issues)
  <span class="note">(ShinyStan GitHub)</span>
