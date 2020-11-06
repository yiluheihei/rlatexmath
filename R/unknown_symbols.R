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
