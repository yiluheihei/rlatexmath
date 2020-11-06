test_that("find all calls", {
  expect_identical(
    find_all_calls(quote(f(a + b) + g(x))),
    c("+", "f", "g")
  )
})
