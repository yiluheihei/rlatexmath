
[![R build
status](https://github.com/yiluheihei/rlatexmath/workflows/R-CMD-check/badge.svg)](https://github.com/yiluheihei/rlatexmath/actions)
[![License: GPL
v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://github.com/yiluheihei/microbiomeMarker/blob/master/LICENSE.md)
[![Codecov test
coverage](https://codecov.io/gh/yiluheihei/rlatexmath/branch/master/graph/badge.svg)](https://codecov.io/gh/yiluheihei/rlatexmath?branch=master)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

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

## related projects

-   [equatiomatic](https://github.com/datalorax/equatiomatic)
-   [latex2exp](https://github.com/stefano-meschiari/latex2exp)
-   [textables](https://github.com/setzler/textables)

## Acknowledgements

-   [Hadley Wickham’s book advanced
    R](https://adv-r.hadley.nz/translation.html#latex). Both the idea
    and the code are scratch from this book.
