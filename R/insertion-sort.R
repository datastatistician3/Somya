#' @name insertion_sort
#'
#' @export
#'
#' @title This function sorts the unsorted vector
#'
#' @description This function sorts the given unsorted vector using insertion algorithm
#'
#' @param input_vector An unsorted vector 
#'
#' @return A sorted vector
#'
#' @author Som Bohora
#'
#' @examples
#' 
#' x <- c(2,1,4,7,5,4,2,1,3,1,9,8,7)
#' insertion_sort(x)

insertion_sort <- function(input_vector){
  for (i in 1:length(input_vector)) {
    save_value = input_vector[i]
    j = i
    while ((j > 1) && (input_vector[j - 1] > save_value)) {
      input_vector[j] = input_vector[j - 1]
      j = j - 1
    }
    input_vector[j] = save_value
  }
  return(input_vector)
}

