context("utils")

test_that("check_pkg() gives correct error message", {
  expect_error(
    dplyr:::check_pkg("`__foobarbaz__`", "foobar a baz"),
    'The `__foobarbaz__` package is required to foobar a baz.\nPlease install it with `install.packages("`__foobarbaz__`")`',
    fixed = TRUE
  )
  expect_error(
    dplyr:::check_pkg("`__foobarbaz__`", "foobar a baz", install = FALSE),
    "The `__foobarbaz__` package is required to foobar a baz."
  )
})

test_that("get_vars() handles list of symbols as vars attribute", {
  gdf <- group_by(tibble(g = 1:2), g)
  gdf <- structure(gdf, vars = list(sym("g")))
  expect_identical(test_grouped_df(gdf), gdf)
})
