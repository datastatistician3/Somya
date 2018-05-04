rm(list = ls(all=TRUE))
# data.frame(mtcars$mpg[1:5],mtcars$mpg[6:10],mtcars$mpg[11:15],mtcars$mpg[16:20])
# 
# v <- mtcars$mpg
# number_rows = 10
# col_names = c(paste0("name", seq_len(number_rows)))

split_rows_to_columns <- function(vector, number_rows, col_name_prefix = "name"){
  col_names <- c(paste0(col_name_prefix, " ", seq_len(base::ceiling(length(vector)/number_rows))))
  seq_vector <- base::seq_along(vector)
  split_vector <- base::split(vector, base::ceiling(seq_vector/number_rows))
  length_each_list <- base::sapply(split_vector, base::length)
  maximum_seq_value <- base::seq_len(base::max(length_each_list))
  d <- base::as.data.frame(base::sapply(split_vector, "[", i = maximum_seq_value))
  base::colnames(d) <- col_names
  return(d)
}

split_rows_to_columns(mtcars$mpg, number_rows = 7, col_name_prefix = "ID List")
