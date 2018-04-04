#' @name find_mode
#'
#' @export
#'
#' @title This function finds the mode value from a vector
#'
#' @description This function finds the mode value from a vector
#'
#' @param x A vector of values
#'
#' @return A mode value from the given vector
#'
#' @author Som Bohora
#'
#' @examples
#' 
#' find_mode(c(2,2,3,2,5,5,5,5,6,7))

find_mode <- function(x) {
  unique_x <- base::unique(x)
  nonmissing_x <- x[!is.na(x)]
  nonmissing_x[base::which.max(base::tabulate(base::match(x, nonmissing_x)))]
}