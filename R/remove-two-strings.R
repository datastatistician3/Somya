y <- "hi"
z <-  "hello"
x <- "hi there hello som"

## todo use for loop with parameters to allow as many string as possible

#Does not work in vector
remove_two_strings <- function(original_string, first_string, second_string){
  s <- base::trimws(base::gsub(first_string, " ", original_string))
  t <- base::trimws(base::gsub(second_string, " ", s))
  u <- base::gsub("\\s+", " ", t)
  return(u)
}

remove_two_strings(x, y, z)


first_string <- c("hi")
second_string <- c("hello")
original_string <- c("hi hello there hello som", "hi som there hello")

ds <- data.frame(original_string,first_string,second_string, stringsAsFactors = FALSE)

# Works in vector
remove_two_strings_vector <- function(original_string, first_string, second_string){
  s <- base::trimws(str_replace(original_string, first_string, " "))
  t <- base::trimws(str_replace(s, second_string, " "))
  u <- base::trimws(str_replace(t, "\\s+", " "))
  return(u)
}

remove_two_strings_vector(original_string = tolower(ds$original_string), first_string = ds$first_string,second_string = ds$second_string)
