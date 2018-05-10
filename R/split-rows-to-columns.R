#' @name split_rows_to_columns
#'
#' @export
#'
#' @title This function takes a vector and truns it into a data frame with multiple columns.
#'
#' @description This function takes a vector and truns it into a data frame with multiple columns.
#'
#' @param vector A vector
#' 
#' @param number_rows Number of rows to split the vector into data frame 
#'
#' @param col_name_prefix A prefix for column names for the data frame 
#'
#' @return A data frame with multiple columns
#'
#' @author Som Bohora
#'
#' @examples
#' 
#'split_rows_to_columns(mtcars$mpg, number_rows = 7, col_name_prefix = "ID List")

split_rows_to_columns <- function(vector, number_rows, col_name_prefix = "name"){
  col_names <- c(base::paste0(col_name_prefix, " ", base::seq_len(base::ceiling(length(vector)/number_rows))))
  seq_vector <- base::seq_along(vector)
  split_vector <- base::split(vector, base::ceiling(seq_vector/number_rows))
  length_each_list <- base::sapply(split_vector, base::length)
  maximum_seq_value <- base::seq_len(base::max(length_each_list))
  d <- base::as.data.frame(base::sapply(split_vector, "[", i = maximum_seq_value))
  base::colnames(d) <- col_names
  return(d)
}
