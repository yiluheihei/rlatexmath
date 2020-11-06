
[![R build
status](https://github.com/yiluheihei/rlatexmath/workflows/R-CMD-check/badge.svg)](https://github.com/yiluheihei/rlatexmath/actions)
[![License: GPL
v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://github.com/yiluheihei/microbiomeMarker/blob/master/LICENSE.md)
[![Codecov test
coverage](https://codecov.io/gh/yiluheihei/rlatexmath/branch/master/graph/badge.svg)](https://codecov.io/gh/yiluheihei/rlatexmath?branch=master)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

**NOTE: Markdown does not support well for mathematical equations. And
some equations not displayed properly in this page, such as
`$\frac{x}{y}$`, `$\sqrt[y]{x}$` and `$\prod_{i = 1}^{n} x_i$`, . See
the [html
vignette](https://yiluheihei.github.io/rlatexmath/articles/Intro.html)
for all the correct displayed equations.**

Tools for converting R expressions to latex mathematical equations. This
project is scratch from the [section 21.3 transforms mathematically R
code into its LaTeX
equivalent](https://adv-r.hadley.nz/translation.html#latex).

## Usage

### Special symbols

``` r
library(rlatexmath)
translate_latexmath(pi)
```

*π*

``` r
# quoted object
translate_latexmath_(quote(pi))
```

*π*

### Known functions

| R expression                  | latex math                                  |
|-------------------------------|---------------------------------------------|
| <b>Binary operators</b>       |                                             |
| x + y                         | *x* + *y*                                   |
| x - y                         | *x* − *y*                                   |
| x \* y                        | *x**y*                                      |
| x / y                         | *x*/*y*                                     |
| x %+-% y                      | *x* ± *y*                                   |
| x %/% y                       | *x* ÷ *y*                                   |
| x %\*% y                      | *x* × *y*                                   |
| x %.% y                       | *x* ⋅ *y*                                   |
| x\[i\]                        | *x*<sub>*i*</sub>                           |
| x^i                           | *x*<sup>*i*</sup>                           |
| <b>Grouping</b>               |                                             |
| (x + y)                       | (*x*+*y*)                                   |
| {x y}                         | *x* + *y*                                   |
| <b>Juxtaposition</b>          |                                             |
| paste(x, y, z)                | *x**y**z*                                   |
| <b>Comma separated lists</b>  |                                             |
| list(x + y, z)                | *x* + *y*, *z*                              |
| <b>Fractions</b>              |                                             |
| frac(x, y)                    | $\\frac{x}{y}$                              |
| atop(x, y)                    | $x \\atop y$                                |
| <b>Ellipsis</b>               |                                             |
| list(x\[1\], cdots, x\[2\])   | *x*<sub>1</sub>, ⋯, *x*<sub>2</sub>         |
| list(x\[1\], ldots, x\[2\])   | *x*<sub>1</sub>, …, *x*<sub>2</sub>         |
| <b>Radicals</b>               |                                             |
| sqrt(x)                       | $\\sqrt\[\]{x}$                             |
| sqrt(x, y)                    | $\\sqrt\[y\]{x}$                            |
| <b>Relation</b>               |                                             |
| x == y                        | *x* = *y*                                   |
| x != y                        | *x* ≠ *y*                                   |
| x &lt; y                      | *x* &lt; *y*                                |
| x &gt; y                      | *x* &gt; *y*                                |
| x &gt;= y                     | *x* ≥ *y*                                   |
| x &lt;= y                     | *x* ≤ *y*                                   |
| x %==% y                      | *x* ≡ *y*                                   |
| x %\~\~% y                    | *x* ≈ *y*                                   |
| x %=\~% y                     | *x* ≅ *y*                                   |
| x %prop% y                    | *x* ∝ *y*                                   |
| <b>Set&lt;/&gt;               |                                             |
| x %supset% y                  | *x* ⊃ *y*                                   |
| x %supseteq% y                | *x* ⊇ *y*                                   |
| x %subset% y                  | *x* ⊂ *y*                                   |
| x %notsubset% y               | *x* ⊄ *y*                                   |
| x %subseteq% y                | *x* ⊆ *y*                                   |
| x %in% y                      | *x* ∈ *y*                                   |
| x %notin% y                   | *x* ∉ *y*                                   |
| <b>Arrow</b>                  |                                             |
| x %&lt;-&gt;% y               | *x* ↔ *y*                                   |
| x %&lt;-% y                   | *x* ← *y*                                   |
| x %up% y                      | *x* ↑ *y*                                   |
| x %-&gt;% y                   | *x* → *y*                                   |
| x %down% y                    | *x* ↓ *y*                                   |
| x %&lt;=&gt;% y               | *x* ⇔ *y*                                   |
| x %&lt;=% y                   | *x* ⇐ *y*                                   |
| x %dblup% y                   | *x* ⇑ *y*                                   |
| x %=&gt;% y                   | *x* ⇒ *y*                                   |
| x %dbldown% y                 | *x* ⇓ *y*                                   |
| <b>Accent</b>                 |                                             |
| tilde(x)                      | *x̃*                                         |
| hat(x)                        | *x̂*                                         |
| widetilde(x)                  | *x̃*                                         |
| widehat(x)                    | *x̂*                                         |
| bar(x)                        | *x̄*                                         |
| <b>Operators</b>              |                                             |
| sum(x\[i\])                   | ∑*x*<sub>*i*</sub>sum(x\[i\], i==1, n)      |
| prod(x\[i\])                  | ∏*x*<sub>*i*</sub>                          |
| prod(x\[i\], i==1, n)         | $\\prod\_{i = 1}^{n} x\_i$                  |
| integral(f(x)\*{dx}, a, b)    | ∫<sub>*a*</sub><sup>*b*</sup>*f*(*x*)*d**x* |
| union(A\[i\], i==1, n)        | $\\bigcup\_{i = 1}^{n} A\_i$                |
| intersect(A\[i\], i==1, n)    | $\\bigcup\_{i = 1}^{n} A\_i$                |
| lim(f(x), x %-&gt;% infty)    | lim<sub>*x* → ∞</sub>*f*(*x*)               |
| min(f(x), x &gt;= 0)          | min<sub>*x* ≥ 0</sub>*f*(*x*)               |
| max(f(x), x &gt;= 0)          | max<sub>*x* ≥ 0</sub>*f*(*x*)               |
| <b>Typeface</b>               |                                             |
| plain(x)                      | *x*                                         |
| bold(x)                       | **x**                                       |
| italic(x)                     | *x*                                         |
| bolditalic(x)                 | **x**                                       |
| <b>Delimiters</b>             |                                             |
| group(“(”, list(a,b), “\]”)   | (*a*, *b*\]                                 |
| bgroup(“\[", frac(a,b), "\]”) | $\\left \[ \\frac{a}{b} \\right \]$         |
| abs(x)                        | \|*x*\|                                     |

## related projects

-   [equatiomatic](https://github.com/datalorax/equatiomatic)
-   [latex2exp](https://github.com/stefano-meschiari/latex2exp)
-   [textables](https://github.com/setzler/textables)

## Acknowledgements

-   [Hadley Wickham’s book advanced
    R](https://adv-r.hadley.nz/translation.html#latex). Both the idea
    and the code are scratch from this book.
