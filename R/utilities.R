#' check the expression type
#'
#' There are four types of expressions in R, including constant, symbol, call
#'  and pairlist. This function was to check the type of expresison.
#' @keywords internal
check_expr_type <- function(expr) {
  if (rlang::is_syntactic_literal(expr)) {
    "constant"
  } else if (is.symbol(expr)) {
    "symbol"
  } else if (is.call(expr)) {
    "call"
  } else if (is.pairlist(expr)) {
    "pairlist"
  } else {
    typeof(expr)
  }

}

#' switch evaluated type of `expr`
#' @param expr an expression.
#' @param ... the list of alternatives.
#' @keywords internal
switch_expr <- function(expr, ...) {
  switch(check_expr_type(expr),
    ...,
    stop("Don't know how to handle type ", typeof(expr), call. = FALSE)
  )
}


#' flattern `map` results into a single character vector
#' @param .x,.f,... arguments inherits from [`purrr::map()`].
#' @keywords internal
flat_map_chr <- function(.x, .f, ...) {
  purrr::flatten_chr(purrr::map(.x, .f, ...))
}
