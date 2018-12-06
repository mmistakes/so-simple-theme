# Stan Web Site (mc-stan.org)

This is the repository for the Stan web site.  

We are serving the `mc-stan.org` website using
[GitHub Pages](https://help.github.com/categories/github-pages-basics).
GitHub only serves _static_ webpages, i.e., it cannot dynamically generate
a page in response to an HTTP request.
GitHub pages provide integration with
[jekyll](https://help.github.com/articles/about-github-pages-and-jekyll/),
a static site generator designed for blogging and software documentation.
Content is written in markdown.  [Jekyll](https://jekyllrb.com) themes
provide the site-wide layouts, styling, and navigational elements.

### Managing the web site

The `master` branch contains the jekyll sources.
Whenever a verified member of the Stan organization pushes to master,
GitHub (re)builds and (re)deploys the website.

If you want to build and serve the web site locally to test changes, see the Wiki page: </br>
https://github.com/stan-dev/stan-dev.github.io/wiki/Using-the-Jeykll-Based-Website

### Contribute 

We take pull requests just as with the rest of the Stan repos.

### Case studies

Adding a case study requires adding a link in the index:

* users/documentation/case-studies.md

and putting the actual HTML of the case study here:

* users/documentation/case-studies/

All case studies must come with a clear indication of copyright holder and separate open-source license for code (we recommend BSD or similar non-copyleft license) and text (we recommend CC BY ND or CC BY NC).  


