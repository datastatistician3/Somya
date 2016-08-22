#' @name sum_nonmissing
#' @export
#'
#' @title Calculate sum of non missing values rowwise.
#'
#' @description Calculate sum of all non missing values rowwise within mutate function in dplyr package.
#' 
#' @param ... A list of column names from a dataframe for which non-missings are to be calculated rowwise
#'
#' @return A an integer value of sum of non-missing values
#'
#' @author Som Bohora
#'
#' @examples
#' library(magrittr)
#' iris[c(1,2,4), c(1,3,4)] <- NA
#'   expected <- iris %>%
#'     dplyr::rowwise() %>%  # Notice the use of rowwise here
#'     dplyr::mutate(Sum.Non.Missings = sum_nonmissing(
#'       Sepal.Length, Sepal.Width, Petal.Length, Petal.Width))

sum_nonmissing <- function(...){
  dots  <- list(...)
  x <- sum(!is.na(dots))
  return(x)
}



