# y <- "hi"
# z <-  "hello"
# x <- "hi there hello som"
# 
# ## todo use for loop with parameters to allow as many string as possible
# 
# #Does not work in vector
# remove_two_strings <- function(original_string, first_string, second_string){
#   s <- base::trimws(base::gsub(first_string, " ", original_string))
#   t <- base::trimws(base::gsub(second_string, " ", s))
#   u <- base::gsub("\\s+", " ", t)
#   return(u)
# }
# 
# remove_two_strings(x, y, z)
# 
# 
# # Works in vector
# remove_two_strings <- function(ds, original_string, first_string, second_string){
#   # original_string <- base::trimws(stringr::str_replace_all(original_string, first_string, " "))
#   # t <- base::trimws(stringr::str_replace_all(original_string, second_string, " "))
#   # original_string <- base::trimws(stringr::str_replace_all(original_string, "\\s+", " "))
#   ds %>% 
#     dplyr::mutate(original_string = base::trimws(stringr::str_replace_all(original_string, first_string, " "))) %>% 
#     dplyr::mutate(original_string = base::trimws(stringr::str_replace_all(original_string, second_string, " ")))
#   return(ds)
# }
# 
# remove_two_strings_vector(original_string = ds$original_string, first_string = ds$first_string, second_string = ds$second_string)
# 
# s <- stringr::str_replace_all(ds$original_string, ds$first_string, "+")
# s <- stringr::str_replace_all(s, "he", "-")
# 
# func <- function(x,y,z) {
#   zz <- setdiff(z,c(x,y))
#   return(zz)
# }
# my_names <- c("original_string", "first_string", "second_string")

first_string <- c("hi", "hello",NA_character_)
second_string <- c("hello",NA_character_,"go")
original_string <- c("hi hello there hello som",NA_character_, "hi som there hello go here")

ds <- data.frame(original_string,first_string,second_string, stringsAsFactors = FALSE)

gsub_vector <- function(ds, original_string,first_string,second_string){
  ds[,original_string] <- trimws(tolower(ds[,original_string]))
  ds[,first_string] <- tolower(ds[,first_string])
  ds[,second_string] <- tolower(ds[,second_string])
  for (i in 1:nrow(ds)) {
    ds[i,"white_space"] <- "\\s+"
    if (is.na(ds[i,original_string])) {
      ds[i,original_string] <- ds[i,original_string]
    } else if (!is.na(ds[i,first_string]) & is.na(ds[i,second_string])) {
      ds[i,original_string] <- base::trimws(base::gsub(ds[i,first_string], " ", ds[i,original_string]))
      # ds[i,original_string] <- base::trimws(base::gsub(ds[i,second_string], " ", ds[i,original_string]))
      ds[i,original_string] <- base::trimws(base::gsub(ds[i, "white_space"], " ",  ds[i,original_string]))
    } else if (is.na(ds[i,first_string]) & !is.na(ds[i,second_string])){
    # ds[i,original_string] <- base::trimws(base::gsub(ds[i,first_string], " ", ds[i,original_string]))
    ds[i,original_string] <- base::trimws(base::gsub(ds[i,second_string], " ", ds[i,original_string]))
    ds[i,original_string] <- base::trimws(base::gsub(ds[i, "white_space"], " ",  ds[i,original_string]))
    } else {
    ds[i,original_string] <- base::trimws(base::gsub(ds[i,first_string], " ", ds[i,original_string]))
    ds[i,original_string] <- base::trimws(base::gsub(ds[i,second_string], " ", ds[i,original_string]))
    ds[i,original_string] <- base::trimws(base::gsub(ds[i, "white_space"], " ",  ds[i,original_string]))
    }
  }
  return(ds)
}

gsub_vector(ds, "original_string","first_string","second_string" )
