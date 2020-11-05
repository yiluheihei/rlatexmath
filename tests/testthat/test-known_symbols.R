test_that("known symbols", {
  expect_equal(translate_latexmath(pi), latexmath("\\pi"))
  expect_equal(translate_latexmath("pi"), latexmath("pi"))

  # quoted object
  expect_equal(translate_latexmath_(quote(pi)), latexmath("\\pi"))
  expect_equal(translate_latexmath_(quote("pi")), latexmath("pi"))
})
