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
  # known functions
  known_function_env <- make_env(R_KNOW_OP, translate_know_function)

  # unknown symbols
  symbols <- all.vars(expr)
  symbol_env <- make_env(symbols, translate_unknown_symbol, known_function_env)

  # known special symbols
  known_symbol_env <- make_env(special_symbol, translate_known_symbol, symbol_env)

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


################################################################################
# special symbols, such as greek letters, dots or infinity
################################################################################

special_symbol <- c(
  # greek lowercase and letters
  "alpha", "theta", "tau", "beta", "vartheta", "pi", "upsilon",
  "gamma", "gamma", "varpi", "phi", "delta", "kappa", "rho",
  "varphi", "epsilon", "lambda", "varrho", "chi", "varepsilon",
  "mu", "sigma", "psi", "zeta", "nu", "varsigma", "omega", "eta",
  "xi", "Gamma", "Lambda", "Sigma", "Psi", "Delta", "Xi",
  "Upsilon", "Omega", "Theta", "Pi", "Phi",

  # dots
  "ldots", "cdots", "vdots", "ddots",

  # infinity
  "infty"
)

#' transform known symbols to latex math, add prefix \\
#' @keywords internal
translate_known_symbol <- function(symbol) {
  paste0('\\', symbol)
}


################################################################################
# unknown symbols
################################################################################
#' Find all symbols in the given expression
#'
#' Function used to find all symbols by walking the AST of R expression.
#' @keywords internal
find_all_symbols <- function(expr) {
  switch_expr(expr,
    constant = character(),
    symbol = as.character(expr),
    call = flat_map_chr(as.list(expr[-1]), ~ unique(find_all_symbols(.x)))
  )
}

# leave unknown symbol as is
translate_unknown_symbol <- function(symbol) {
  escape(symbol)
}

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





