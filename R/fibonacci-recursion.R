#' @name compute_fibonacci
#' 
#' @export
#'
#' @title This function returns the Fibonacci number at a given position
#'
#' @description This function returns the Fibonacci number at a given position using recursion method
#'
#' @param n A position for which the Fibonacci number is desired 
#'
#' @return A Fibonacci number at a given position
#'
#' @author Som Bohora
#' 
#' @examples 
#' compute_fibonacci(5)
#' n = 10
#' for (i in 0:(n-1)) {
#'   print(compute_fibonacci(i))
#' }

compute_fibonacci <- function( n ) {
   if (n <= 1){
     return(n)
   } else {
     return(compute_fibonacci(n - 1) + compute_fibonacci(n - 2))
   }
}