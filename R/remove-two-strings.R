y <- "hi"
z <-  "hello"
x <- "hi there hello som"

remove_two_strings <- function(original_string, first_string, second_string){
  s <- base::trimws(base::gsub(first_string, " ", original_string))
  t <- base::trimws(base::gsub(second_string, " ", s))
  u <- base::gsub("\\s+", " ", t)
  return(u)
}

remove_two_strings(x, y, z)
