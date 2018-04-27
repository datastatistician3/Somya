#' @name fibonacci_loop
#'
#' @export
#'
#' @title This function returns the Fibonacci number at a given position
#'
#' @description This function returns the Fibonacci number at a given position using loop method
#'
#' @param n A position for which the Fibonacci number is desired 
#'
#' @return A Fibonacci number at a given position
#'
#' @author Som Bohora
#'
#' @examples
#' 
#' fibonacci_loop(3)

fibonacci_loop <- function( n ) {  
   if (n <= 2){
     return(1)
   } 
  f = 1
  f2 = 1
    
  for (i in 3:n) {
    result = f + f2
    f2 = f
    f = result
  }
   return(result)
 }
 