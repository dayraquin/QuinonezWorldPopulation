library(testthat)
library(QuinonezWorldPopulation)

test_that('Output should be a graph of ',{
  expect_error(CountryPopulation("Amazon"))
  expect_error(CountryPopulation("Desert"))
})
