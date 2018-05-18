
count_words_in_string <- function(string){
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

string = "This is a string. This is a a word. hora?"
count_words_in_string(string = string)


# In python
string = "This is a string. This is a a word."

def count_words(x):
    counts = dict()
    s = string.split(' ')
    
    for word in s:
        if word in counts:
            counts[word] += 1
        else:
            counts[word] = 1 
    return(counts)
    
print(count_words(string))