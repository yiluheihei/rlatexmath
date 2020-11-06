#' Mark character as latex math
#'
#' Making the giving character as `latexmath` object, which means the escape
#' method will not perform on it and leave it unchanged.
#' @param char character
#' @return The same value marked as `latexmath` class.
#' @export
latexmath <- function(char) {
  structure(char, class = "latexmath")
}

#' Print method for latexmath
#'
#' S3 method for printing `latexmath`, prints markup rmarkdown latex math
#' equations.
#' @param x, `latexmath` to print.
#' @param ..., other arguments passed to print.
#' @export
print.latexmath <- function(x, ...) {
  cat("<LATEXMATH> ", x, "\n", sep = "")
  invisible(x)
}
