
context("Test template functions")

test_that("returns_true returns TRUE", {
    expect_equal(returns_true(), TRUE)
    expect_identical(returns_true(), TRUE)
    expect_true(returns_true())
})
