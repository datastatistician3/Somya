#' @description Computes a Fibonacci number.
#' @param n an integer
#' 
#' @return the nth Fibonacci number
#' 
#' @example 
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
