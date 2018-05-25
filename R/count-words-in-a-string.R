#' @name count_words_in_string
#'
#' @export
#'
#' @title This function count the number of words in given string
#'
#' @description This function count the number of words in given string by removing or without special
#' punctuation characters.
#'
#' @param string A text or paragraph
#' 
#' @param pattern A pattern to split the given string with
#' 
#' @param remove_punctuation A boolean argument whether to remove punctuation characters
#'
#' @return Numeric vector of words with their counts of occurrence in passed string
#'
#' @author Som Bohora
#'
#' @examples
#' 
#'string = "This is a string. This is a a word. hora?"
#'count_words_in_string(string = string, pattern = "[ ]", remove_punctuation = TRUE)

count_words_in_string <- function(string, pattern = "[.]", remove_punctuation = FALSE){
  counts = list()
  
  if (remove_punctuation) {
    #Remove punctuation characters (! " # $ % & ' ( ) * + , - . / : ; < = > ? @ [  ] ^ _ ` { | } ~)
    s <- gsub("[[:punct:]]","", string,ignore.case = TRUE)
    s = unlist(stringr::str_split(s,pattern = pattern))
  } else{
    s = unlist(stringr::str_split(string,pattern = pattern))
  }
  for (word in s) {
    if (word %in% names(counts)) { # names(counts) is important
      counts[[word]] <- counts[[word]] + 1
    } else {
      counts[[word]] <- 1
    }
  }
  return(unlist(counts))
}


# In python
# def count_words(x):
#     counts = dict()
#     s = string.split(' ')
#     
#     for word in s:
#         if word in counts:
#             counts[word] += 1
#         else:
#             counts[word] = 1 
#     return(counts)
#     
# print(count_words(string))