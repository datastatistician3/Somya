
# Convert English words to Pig Latin
# @param x is an input seprated by a single space

print_duplicates_only <-function(x = base::readline(prompt = "Enter input values: ")){
  y <- base::unlist(base::strsplit(x, " "))
  z <- y[base::duplicated(y) | base::duplicated(y, fromLast = TRUE)]
  return(z)
}

#This will get user input from console
print_duplicates_only()

#This gets string input as parameter directly
print_duplicates_only(x = c("2 3 4 3 3 2"))



# Convert English words to Pig Latin
# @param x is a piece of English text

english_to_pig_latin <- function(x){
  s <- base::unlist(base::strsplit(x, " "))
  s <- base::paste0(base::substring(s, 2), base::substr(s,1,1), "ay")
  return(s)
}

#Example
english_to_pig_latin("this is a piece of english")
