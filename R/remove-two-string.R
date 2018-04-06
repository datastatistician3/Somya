y <- "hi"
z <-  "hello"
x <- "hi there hello som"

remove_two_strings <- function(x, y, z){
  s <- base::trimws(base::gsub(y, " ", x))
  t <- base::trimws(base::gsub(z, " ", s))
  u <- base::gsub("\\s+", " ", t)
  return(u)
}

remove_two_string(x, y,z)
