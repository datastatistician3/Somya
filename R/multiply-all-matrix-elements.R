
multiply_all_matrix_elements <- function(mat){
  out <- 1
  for (i in 1:nrow(mat)) {
    for (j in 1:ncol(mat)) {
      out <- out * mat[i,j]
    }
  }
  return(out)
}

mat <- matrix(data = c(1,2,3,2,2,3), nrow = 2)
multiply_all_matrix_elements(mat)


rp <- function(x){
	apply(x, 1, prod)
}

mat <- matrix(c(1,2,3,4,2,3), nrow = 2)
rp(mat)


row_product <- function(input_matrix){
  set_start <- c(rep(1,nrow(input_matrix)))
  for (row_numer in 1:nrow(input_matrix)) {
    for (col_number in 1:ncol(input_matrix)) {
      set_start[row_numer] <- set_start[row_numer] * input_matrix[row_numer, col_number]
    } 
  }
  return(set_start)
}

row_product(mat)

column_product <- function(input_matrix){
  set_start <- c(rep(1,ncol(input_matrix)))
  for (row_numer in 1:ncol(input_matrix)) {
    for (col_number in 1:nrow(input_matrix)) {
      set_start[row_numer] <- set_start[row_numer] * input_matrix[col_number, row_numer]
    } 
  }
  return(set_start)
}

column_product(mat)

column_product <- function(x){
  r <- c(rep(1,ncol(x)))
  for (arow in 1:ncol(x)) {
    for (acol in 1:nrow(x)) {
      r[arow] <- r[arow] * x[acol, arow]
    } 
  }
  return(r)
}