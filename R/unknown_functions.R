#' find all calls in the expression
#' @param expr expression
#' @keywords internal

# use base R's all.names and
find_all_calls <- function(expr) {
  symbol_function <- all.names(expr, functions = TRUE, unique = TRUE)
  symbol <- all.vars(expr)
  calls <- setdiff(symbol_function, symbol)

  calls
}

# use tidy evaluation
find_all_calls2 <- function(expr) {
  switch_expr(expr,
    constant = ,
    symbol =   character(),
    call = {
      fname <- as.character(expr[[1]])
      children <- flat_map_chr(
        as.list(expr[-1]),
        ~ unique(find_all_calls(.x))
      )

      c(fname, children)
    }
  )
}

#' translate unknown functions
#' @param op a operator.
#' @keywords internal
translate_unknown_function <- function(op) {
  force(op)
  function(...) {
    contents <- paste(..., collapse = ", ")
    paste0("\\mathrm{", op, "}(", contents, ")")
  }
  # will raise a warning in R CMD check:
  # Warning: <anonymous>: ... may be used in an incorrect context:
  # paste(..., collapse = ", ")
  #
  # new_function(
  #   exprs(... = ),
  #   expr({
  #     contents <- paste(..., collapse = ", ")
  #     paste0(!!paste0("\\mathrm{", op, "}("), contents, ")")
  #   })
  # )
}

#' multiple operators returned from `find_all_calls()`
#' @keywords internal
translate_unknown_functions <- function(calls) {
  purrr::map(calls, translate_unknown_function)
}
