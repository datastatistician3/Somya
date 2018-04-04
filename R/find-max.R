#' @name find_max
#'
#' @export
#'
#' @title This function finds the maximum value from a vector
#'
#' @description This function finds the maximum value from a vector
#'
#' @param vector A vector of values
#'
#' @return A maximum value from the given vector
#'
#' @author Som Bohora
#'
#' @examples
#' 
#'find_max(c(2,3,200,5,6,7))

find_max <- function(vector) {
   max <- vector[1]
   
   for (i in 1:length(vector)) {
     if (vector[i] > max)
       max <- vector[i]
   }
   return(max)
}
