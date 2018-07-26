#' @name is_palindrome
#'
#' @export
#'
#' @title This function checks if the given string is a palindrome
#'
#' @description Tests whether a string or sentence is a palindrome by removing special punctuation characters. A palindrome
#' is equal to its reverse, for example "rotor" or "racecar".
#'
#' @param str A string or full sentence 
#'
#' @return TRUE if s is a palindrome and FALSE otherwise
#'
#' @author Som Bohora
#'
#' @examples
#' 
#'is_palindrome("Was It A Rat I Saw?")

is_palindrome <- function(str) {

  s <- gsub("\\s", "", tolower(str))
  
  #Remove punctuation characters (! " # $ % & ' ( ) * + , - . / : ; < = > ? @ [  ] ^ _ ` { | } ~)
  s <- gsub("[[:punct:]]","", s,ignore.case = TRUE)
  
  # s <- substring(s, seq(1,nchar(s),1), seq(1,nchar(s),1))
  s <- unlist(strsplit(s, ""))

  # #Check for any punctuation characters
  # invalid_chars <- grepl("[[:punct:]]", s, ignore.case = T)
  # 
  # if (sum(invalid_chars) > 0) {
  #   stop("Please remove any punctuation characters.")
  # }
  if (length(s) <= 1) {
    return(TRUE)
  }
  # Check if first and last characters are same
  first = s[1]
  last = s[length(s)]

  if (first == last){
    shorter = paste0(s[3:length(s)-1], collapse = "")
    return(is_palindrome(shorter))
  } else {
    return(FALSE)
  }
}
