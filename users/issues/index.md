---
layout: page
title: Issues
excerpt: ""
modified:
image:
  feature: feature/wide_ensemble.png
  credit:
  creditlink:
---

{:.center-txt}
report bugs &amp; request features

# Report a Bug

Bugs in Stan, its interfaces, or its documentation may be reported
through the appropriate interface-specific issue tracker.
Installation issues should be discussed in the appropriate Interface category
of the [Stan Forums](http://discourse.mc-stan.org/).

To report a bug, first read the instructions below; then [select an
interface](/users/interfaces/) to find the link to the appropriate issue
tracker.

## How to Report Bugs

The key to a successful bug report is to *provide as much context as
possible*, ideally in the form of a small reproducible example.  The
more of the following you include, the easier it will be for us to
help you:

* a description of what you were trying to do,
* call to Stan that caused the bug,
* the complete Stan program,
* the complete error message,
* Stan version and Stan interface version,
* host language version if applicable (e.g., R or Python)
* operating system and version,
* C++ compiler and version.

For R users, much of this information is reported within R by
<tt>sessionInfo()</tt>.

# Request Features

We're happy to field feature requests from users.  Feature requests might
include, but are not limited to, the incorporation of new functions or new
samplers, or support for platforms.  Please provide as much information as
possible, including links to papers or formulas.

Feature requests should be made either on the Stan Forums or using the issue
tracker for the appropriate interface.

# Submit Bug Fixes or Enhancements

We are grateful to accept bug fixes or enhancements to the
documentation or code or example models.

## GitHub Pull Requests

Patches to Stan are managed through GitHub pull requests; specifically
requests to merge into the current <tt>develop</tt> branch.  For more
information on how to submit a pull request to Stan please see the
[Stan Developer Overview](https://github.com/stan-dev/stan/wiki/Developer-process-overview).

## Copyright and Licensing

Code authors maintain copyright, but must agree to release all
submitted patches under the open-source license for the interface
being patched.
