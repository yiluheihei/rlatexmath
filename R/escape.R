#'Escape special character of latex math
#'
#' Escape special character so that it can be safely included as latex math.
#'
#' @param x, an object used to select a method
#' @export
#' @rdname escape
escape <- function(x) UseMethod("escape")

#' @export
#' @rdname escape
escape.latexmath <- function(x) x

#' @export
#' @rdname escape
escape.character <- function(x) {
  x <- gsub("\\\\", "\\\\backslash", x)
  x <- gsub("%", "\\\\%", x)
  x <- gsub("\\$", "\\\\$", x)
  # latexmath(x)

  latexmath(x)
}

#' @export
#' @rdname escape
escape.list <- function(x) {
  lapply(x, escape)
}
