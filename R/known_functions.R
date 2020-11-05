################################################################################
## Description: known functions for latex math
## Author: Yang Cao
## Create Time: Thu Nov  5 21:18:42 2020
## Updated Time:
################################################################################

#' translate known functions
#' @keywords internal
translate_know_function <- function(...) {
  unary_latex <- purrr::pmap(LATEX_UNARY_ELEMENT, translate_unary_op)
  binary_latex <- purrr::map(LATEX_BINARY_ELEMENT, translate_binary_op)
  nary_latex <- purrr::map(LATEX_NARY_ELEMENT, translate_nary_op)

  c(unary_latex, binary_latex, nary_latex, other_latex)
}

################################################################################
# unary operators
################################################################################
#' unary operators
#' @importFrom rlang new_function expr exprs caller_env !!
#' @keywords internal
translate_unary_op <- function(left, right) {
  new_function(
    exprs(e1 = ),
    expr(
      paste0(!!left, e1, !!right)
    ),
    caller_env()
  )
}

# accent
ACCENT <- c("tilde", "hat", "widetilde", "widehat", "bar")
ACCENT_LEFT <- paste0("\\", ACCENT, "{")
ACCENT_RIGHT <- rep("}", length(ACCENT))

# typeface
TYPEFACE <- c("plain", "bold", "italic", "bolditalic")
TYPEFACE_LEFT <- paste0("\\", c("mathrm", "mathbf", "mathit", "boldsymbol"), "{")
TYPEFACE_RIGHT <- rep("}", length(TYPEFACE))

# other unary operator
OTHER_UNARY_OP <- c(
  # group
  "{", "(",

  "abs", "phantom", "vphantom"
)
OTHER_UNARY_OP_LEFT <- c(
  # group
  "{", "\\left(",

  "\\vert ", "\\phantom{", "\\vphantom{"
)
OTHER_UNARY_OP_RIGHT <- c(
  # group
  "}", "\\right)",

  "\\vert", "}", "}"
)


R_UNARY_OP <- c(ACCENT, TYPEFACE, OTHER_UNARY_OP)

LATEX_UNARY_ELEMENT <- list(
  left = c(ACCENT_LEFT, TYPEFACE_LEFT, OTHER_UNARY_OP_LEFT),
  right = c(ACCENT_RIGHT, TYPEFACE_RIGHT, OTHER_UNARY_OP_RIGHT)
)


################################################################################
# binary operators
################################################################################
#' @keywords internal
translate_binary_op <- function(sep) {
  new_function(
    exprs(e1 = , e2 = ),
    expr(
      paste0(e1, !!sep, e2)
    ),
    caller_env()
  )
}

R_BINARY_OP <- c(
  # arithmetic
  "+", "-", "*", "/", "%+-%", "%/%", "%*%", "%.%",
  "^", "[", "$",

  # relation
  "==", "!=", "<", "<=", ">=", ">",
  "%==%", "%~~%", "%=~%", "%prop%",

  # set
  "%supset%", "%supseteq%", "%notsubset%",
  "%subset%", "%subseteq%", "%in%", "%notin%",

  # arrow
  "%<->%", "%<-%", "%up%", "%->%", "%down%",
  "%<=>%", "%<=%", "%dblup%", "%=>%", "%dbldown%",

  # customized
  "atop",

  # spacing
  "~"
)

LATEX_BINARY_ELEMENT <-  c(
  # arithmetic
  " + ", " - ", " ", " / "," \\pm ", " \\div "," \\times ", " \\cdot ",
  "^", "_", "\\$",

  # relations
  " = ", " \\neq ", " < ", " \\leq ", " \\geq ", " > ",
  " \\equiv ", " \\approx ", " \\cong ", " \\propto ",

  # set
  " \\supset ", " \\supseteq ", " \\not\\subset ",
  " \\subset ", " \\subseteq ", " \\in ", " \\notin ",

  # arrow
  " \\leftrightarrow ", " \\leftarrow ", " \\uparrow ",
  " \\rightarrow ", " \\downarrow ", " \\Leftrightarrow ",
  " \\Leftarrow ", " \\Uparrow ", " \\Rightarrow ", " \\Downarrow ",

  # operators customized (not in R)
  " \\atop ",

  # spacing

  " \  "
)

################################################################################
# n-ary
################################################################################
translate_nary_op <- function(op) {
  new_function(
    exprs(body = NULL, sub = NULL, sup = NULL),
    expr(
      paste0(
        "\\",
      !!op,
      if (!is.null(sub)) paste0("_{", sub, "}"),
      if (!is.null(sup)) paste0("^{", sup, "}"),
      " ", body
    ))

  )
}

R_NARY_OP <- c(
  "sum", "prod", "integral", "union",
  "intersect", "lim", "min", "max"
)
LATEX_NARY_ELEMENT <- c(
  "sum", "prod", "int", "bigcup",
  "bigcap", "lim", "min", "max"
)
################################################################################
# other known operators
################################################################################
R_OTHER_OP <- c("paste", "list", "frac", "sqrt", "group", "bgroup")

# paste
translate_paste <-function(..., collapse = NULL) {
  paste0(..., collapse = collapse)
}

# lists
translate_list <- function(...) {
  args <- list(...)
  flatten_latexmath(purrr::map(args, translate_latexmath_))
}

flatten_latexmath <- function(latexmath_list) {
  paste(unlist(latexmath_list), collapse = ", ")
}

# fractions
translate_frac <- function(a = NULL, b = NULL) {
  paste0("\\frac{", a, "}{", b, "}")
}

# sqrt
translate_sqrt <- function(a = NULL, b = NULL) {
  paste0("\\sqrt[", b, "]{", a, "}")
}

# delimiter: group and bgroup
translate_group <- function(left = NULL, body, right = NULL) {
  if (is.null(left) || is.null(right))
    stop("invalid group delimiter")
  paste(left, body, right)
}

translate_bgroup <- function(left = NULL, body, right = NULL) {
  if (is.null(left) || is.null(right))
    stop("invalid group delimiter")
  paste("\\left", left, body, "\\right", right)
}

other_latex <- purrr::map(paste0("translate_", R_OTHER_OP), match.fun)

################################################################################
# all known functions
################################################################################
R_KNOW_OP <- c(R_UNARY_OP, R_BINARY_OP, R_NARY_OP, R_OTHER_OP)


# supress warning: no visible binding for global variables <var>
utils::globalVariables(c("e1", "e2", "sup"))
