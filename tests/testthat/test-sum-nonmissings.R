library(testthat)
library(dplyr)
requireNamespace("testthat")

###########
context("Sum nonmissing")
###########
iris[c(1,2,4), c(1,3,4)] <- NA

testthat::test_that("Sum non missing", {
  expected <- iris %>%
    dplyr::rowwise() %>%  # Notice the use of rowwise here
    dplyr::mutate(Sum.Non.Missings = sum_nonmissing(
      Sepal.Length, Sepal.Width, Petal.Length, Petal.Width)) %>% 
    dplyr::select(Sum.Non.Missings)
  
  actual <- apply(iris[,c('Sepal.Length', 'Sepal.Width', 'Petal.Length', 'Petal.Width')]
                  ,1, function(x) sum(!is.na(x)))
  testthat::expect_equal(label = "Yes, they are equal",
                         actual, expected$Sum.Non.Missings)
})
