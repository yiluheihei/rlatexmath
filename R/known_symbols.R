SPECIAL_SYMBOL <- c(
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
