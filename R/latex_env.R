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
  # known special symbols
  know_symbol_env <- make_env(special_symbol, transform_know_symbol)

  know_symbol_env
}

#' create environment for symbols or calls
#' @param x a symbol or call.
#' @param f function to transform symbols or calls to latex math.
#' @param ... other arguments passed to `f`.
#' @importFrom rlang empty_env set_names new_environment
#' @keywords internal
#' @return an environment.
make_env <- function(x, f, parent = empty_env(), ...) {
  dat <- f(x, ...)
  dat <- set_names(dat, x)

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
transform_know_symbol <- function(symbol) {
  paste0('\\', symbol)
}


