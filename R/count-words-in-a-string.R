
count_string_words <- function(string){
  counts = list()
  s = unlist(stringr::str_split(string,pattern = " "))
  for (word in s) {
    if (word %in% names(counts)) { # names(counts) is important
      counts[[word]] <- counts[[word]] + 1
    } else {
      counts[[word]] <- 1
    }
  }
  return(unlist(counts))
}

string = "This is a string. This is a a word."
count_string_words(string = string)
