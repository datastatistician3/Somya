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
  fold = 1
  fold2 = 1
    
  for (i in 3:n) {
    fnew = fold + fold2
    fold2 = fold
    fold = fnew
  }
   return(fnew)
 }
 