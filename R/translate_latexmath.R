#' Generate latex math in R
#'
#' Transform R expression to latex math.
#'
#' @param expr, R expression
#' @export
#' @examples
#' translate_latexmath(pi)
#' translate_latexmath(alpha)
#'
#' # keep the constant as is
#' translate_latexmath("pi")
#'
#' # use translate_latexmath_ for quoted object
#' translate_latexmath_(quote(pi))
#'
#' @importFrom rlang enexpr
#' @export
translate_latexmath <- function(expr) {
  expr <- enexpr(expr)
  latexmath(eval(expr, latex_env(expr)))
}

#' @export
#' @rdname translate_latexmath
translate_latexmath_ <- function(expr) {
  if (is.atomic(expr) || is.language(expr))
    return(latexmath(eval(expr, latex_env(expr))))
  stop("Must be an expresson or a constant", call. = FALSE)
}
