test_that("tranlate unknown symbols", {
  expect_identical(translate_latexmath(x), latexmath("x"))
  expect_identical(translate_latexmath(x), translate_latexmath("x"))
})

test_that("find all symbols", {
  expect_identical(
    find_all_symbols(quote(x + y)),
    c("x", "y")
  )

  expect_identical(
    find_all_symbols(1),
    character(0)
  )

  expect_identical(
    find_all_symbols(quote(x + y + f(a, b, c, 10))),
    c("x", "y", "a", "b", "c")
  )
})

test_that("expression type", {
  expect_identical(check_expr_type(1), "constant")
  expect_identical(check_expr_type(quote(a + b)), "call")
  expect_identical(check_expr_type(quote(a)), "symbol")
})
