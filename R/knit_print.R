#' Custom knitr print methods for latexmath
#'
#' The S3 method for print `latexmath` object in code chunks of knitr.
#'
#' @param x `latexmath` object to knit_print.
#' @param inline if the method is called in code chunks or inline R code
#' @param ... Additional [`knitr::knit_print()`] arguments. Currently ignored,
#' except a optional argument `options`.
#' @export
#' @seealso [`knitr::knit_print()`]
#' @importFrom knitr knit_print
#' @references https://cran.r-project.org/web/packages/knitr/vignettes/knit_print.html#for-package-authors
knit_print.latexmath <- function(x, inline = FALSE, ...) {
  if (inline) {
    res <- paste0("$", x, "$")
  } else {
    res <- paste0("$$ ", x, " $$")
  }

  structure(res, class = 'knit_asis')
}

registerS3method("knit_print", "latexmath", knit_print.latexmath)
