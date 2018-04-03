#' @name capitalize_each_word
#'
#' @export
#'
#' @title This function makes first letter of each word in a string to uppercase
#'
#' @description This function capitalizes the first letter of each word in a string to uppercase
#'
#' @param x A string object or a vector of string objects with or without . or _ or space
#' delimiters 
#'
#' @return A string with first letter of each word capitalized
#'
#' @author Som Bohora
#'
#' @examples
#' 
#'capitalize_each_word("make each letter in this string capitalized.")
#'capitalize_each_word("make_each _etter_in_this_string_capitalized.")
#'capitalize_each_word("make.each.letter.in.this.string.cpitalized.")

capitalize_each_word <- function(x){
  g <- l <- j <- list()
  g <- stringr::str_split(x, pattern = "[_|.| ]")
  for ( i in 1:length(g)){
    l[[i]] <- paste(Hmisc::capitalize(g[[i]]), collapse = " ")
    j[[i]] <- paste(l[[i]], collapse = " ")
}
  return(unlist(j))
}