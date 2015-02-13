---
layout: post
title: "Git bisect - debug with git"
category: posts
featured_image: /images/git-logo.png
description: Using git bisect to help debugging - find breaking commits
keywords:
- git bisect
- bug fixing
---
# The setting

Imagine you have to find the commit that broke something - among hundreds of commits.  
What do you do? You can manually revert to the last known good commit, then check all the commits after. This can be tedious work, but of course can be automated - and basically this is what git bisect does.  

# Enter git bisect

__Git bisect__ is a tool you shouldn't need often - but when you need it, you need it bad. Bisect isolates the culprit commit with logarithmic efficiency by performing a binary search of the commits on your branch, dividing and conquering until only one commit remains.

# Tell me more

#### The first steps

{% highlight bash %}
$ git bisect start                                              # enter bisect mode
$ git bisect bad                                                # mark the current commit as bad
$ git bisect good df7c9a6d96cd5ff9ab4ad9282cd12206c0cfa5bb      # mark the last known good commit as good
Bisecting: 4 revisions left to test after this (roughly 3 steps)
[8aecfb4e3f7661b8df9145e6b20f9b555fbf8cd0] Merge pull request 9396 from twbs/docs-html-validation
{% endhighlight %}

At this point git bisect knows the commit range to check and tells us what to expect. It will start splitting the revision range [bad, good] in half and loading them up for you. It will checkout each revision and then ask you if the commit is good or bad. You answer git bisect good or git bisect bad and git will take care of the rest. It will use binary search to very quickly narrow down the offending commit.  
It has already checked out 8aecfb4e3f7661b8df9145e6b20f9b555fbf8cd0 as the first candidate. 

#### Let's see it in action

{% highlight bash %}
$ git bisect good                                               # this is still a working revision, we have to search further
Bisecting: 2 revisions left to test after this (roughly 1 step)
[af2ea581b24bfae28a72275fac000a72e9e4130a] update CDN links to point to continuously-updated build; addresses #9138 & its many dupes
# now af2ea581b24bfae28a72275fac000a72e9e4130a is checked out. Say this is a buggy revision:
$ git bisect bad
Bisecting: 0 revisions left to test after this (roughly 0 steps)
[461b05f5b1d75341fd8b98a216c69e2cc33418be] update download_dist for RC 2
$ git bisect bad
461b05f5b1d75341fd8b98a216c69e2cc33418be is the first bad commit
commit 461b05f5b1d75341fd8b98a216c69e2cc33418be                 # GOTCHA!
Author: Chris Rebert <code@rebertia.com>
Date:   Mon Aug 12 12:09:52 2013 -0700

    update download_dist for RC 2

:100644 100644 6dc300d668cb46c1ab4ed2293501e6825ddc52cd 7d4c1518948cbe03a964dd829e486e2fefd53b81 M  _config.yml
{% endhighlight %}

# Can't we automate it somehow?

Sure we can. Supose your app has tests to tell if the revision is good or bad. Then you can tell git bisect what to run for each commit to check if it's good or bad judging by the command's exit code the usual way (0 == ok, !0 == error)

{% highlight bash %}
$ git bisect start                                              # enter bisect mode
$ git bisect bad                                                # mark the current commit as bad
$ git bisect good df7c9a6d96cd5ff9ab4ad9282cd12206c0cfa5bb      # mark the last known good commit as good
Bisecting: 4 revisions left to test after this (roughly 3 steps)
[8aecfb4e3f7661b8df9145e6b20f9b555fbf8cd0] Merge pull request 9396 from twbs/docs-html-validation
$ git bisect run test.sh
{% endhighlight %}

Git bisect will do the previous process but in a fully automated way: It will check out revisions, run your command (unit/functional tests, etc.) for each and judge if the commit is good or bad based on the exit code of your command, finally presenting you with the first bad commit in the range you initially specified.

# Closing words

When you've found the offending commit, don't forget to exit bisect mode and get back on your working branch:
{% highlight bash %}
$ git bisect reset
{% endhighlight %}

Git bisect is a great tool for finding bugs in a long commit history, but of course it's even better to have tests for everyting and having them run automatically for each commit with git hooks, and/or having a CI setup.