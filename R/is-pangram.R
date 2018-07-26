#' @name is_pangram
#'
#' @export
#'
#' @title This function checks if the given string is a pangram
#'
#' @description Tests whether a string or sentence is a pangram by removing special punctuation characters. A pangram
#' is a sentence constructed using all the letters of the alphabet.
#'
#' @param str A string or full sentence 
#'
#' @return TRUE if s is a pangram and FALSE otherwise
#'
#' @author Som Bohora
#'
#' @examples
#' 
#' string = "The quick brown fox jumps over the lazy dog"
#' x = "Back in June we delivered oxygen equipment of the same size"
#' 
#'is_pangram(string)
#'is_pangram(x)

is_pangram <- function(str){
  # s <- string[!duplicated(string)]
  
  s <- gsub("\\s", "", tolower(str))
  
  #Remove punctuation characters (! " # $ % & ' ( ) * + , - . / : ; < = > ? @ [  ] ^ _ ` { | } ~)
  s <- gsub("[[:punct:]]","", s,ignore.case = TRUE)
  
  # s <- substring(s, seq(1,nchar(s),1), seq(1,nchar(s),1))
  s <- unlist(strsplit(s, ""))
  
  result <- sum(base::letters %in% s) == length(base::letters)
  
  return(result)
}

