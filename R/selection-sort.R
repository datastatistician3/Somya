#' @name selection_sort
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
#'x <- c(6,3,2,5,1,0,7,10,5)
#'selection_sort(x)

selection_sort <- function(input_vector){
	for (i in seq_len(length(input_vector)-1)) {
	  minIndex = i
	  for (j in (i + 1) : length(input_vector)) {
	      if (input_vector[j] < input_vector[minIndex]) {
		  	minIndex = j
	    }
	  }
		temp = input_vector[minIndex]
		input_vector[minIndex] = input_vector[i]
		input_vector[i] = temp
	}
return(input_vector)
}






