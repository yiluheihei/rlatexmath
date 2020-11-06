################################################################################
## Description: Create an environment used for latex math evaluation
## Author: Yang Cao
## Create Time: Thu Nov  5 09:00:35 2020
## Updated Time:
################################################################################

#' Create an environment for latex math evaluation
#'
#' @param expr an R expression.
#' @keywords internal
latex_env <- function(expr) {
  # unknown functions
  calls <- find_all_calls(expr)
  unknown_function_env <- make_env(calls, translate_unknown_functions)

  # known functions
  known_function_env <- make_env(
    R_KNOW_OP,
    translate_know_function,
    unknown_function_env
  )

  # unknown symbols
  symbols <- all.vars(expr)
  symbol_env <- make_env(
    symbols,
    translate_unknown_symbol,
    known_function_env
  )

  # known special symbols
  known_symbol_env <- make_env(
    SPECIAL_SYMBOL,
    translate_known_symbol,
    symbol_env
  )

  known_symbol_env
}

#' create environment for symbols or calls
#' @param .x a symbol or call.
#' @param .f function to transform symbols or calls to latex math.
#' @param ... other arguments passed to `.f`.
#' @importFrom rlang empty_env set_names new_environment
#' @keywords internal
#' @return an environment.
make_env <- function(.x, .f, parent = empty_env(), ...) {
  dat <- .f(.x, ...)
  dat <- set_names(dat, .x)

  new_environment(dat, parent)
}
