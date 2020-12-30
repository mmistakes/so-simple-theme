---
title: "MathJax Example"
date: 2015-08-10T08:08:50-04:00
---

[MathJax](http://www.mathjax.org/) is a simple, yet powerful, way of
including Tex/LaTex/MathML based mathematics in HTML webpages.

## Usage

To enable MathJax support configure your `_config.xml` to:
 * Set `kramdown` as the Markdown parser.
 * Enable MathJax.

The version of MathJax enabled is v3.

An example setting for `_config.xml` is shown below:

```yaml
markdown: kramdown
mathjax:
  enable: true
  combo: "tex-svg"
  tags: "ams"
```

Use `$$` as delimiters to enable TeX math mode, both for inline and display (i.e. block) rendering.

Here is an example equation that is inline: $$a^2 + b^2 = c^2$$, where
$$a$$, $$b$$, and $$c$$ are variables.

Here is a block rendering with no default equation numbering:

$$
\frac{1}{n^{2}}
$$

And, below is a block using the `\begin{equation}` and
`\end{equation}` LaTeX delimiters.  This equation will be numbered in
the `ams` and `all` setting for `mathjax.tags`.

$$
\begin{equation}
\mathbf{X}_{n,p} = \mathbf{A}_{n,k} \mathbf{B}_{k,p}    \label{test}
\end{equation}
$$

If equation numbering is turned on, we should see an equation number here: $$\eqref{test}$$.

An example using the `{align}` LaTeX environment is below.  The first equation has a `\notag` directive.

$$
\begin{align}
(x + y) (x - y) &= x^2 + xy - xy + y^2   \notag \\
    &= x^2 - y^2
\end{align}
$$
