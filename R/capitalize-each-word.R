#' @name capitalize_each_word
#'
#' @export
#'
#' @title This function makes first letter of each word in a string to uppercase
#'
#' @description This function capitalizes the first letter of each word in a string to uppercase
#'
#' @param string A string object or a vector of string objects with or without . or _ or space
#' delimiters 
#' 
#' @param pattern A regular expression pattern to split the string with. Default delimiter is space. 
#'
#' @return A string with first letter of each word capitalized
#'
#' @author Som Bohora
#'
#' @examples
#' 
#'capitalize_each_word("make each letter in this string capitalized.", pattern = NULL)
#'capitalize_each_word("make_each _etter_in_this_string_capitalized.", pattern = "[_]")
#'capitalize_each_word("make.each.letter.in.this.string.capitalized.", pattern = "[.]")

capitalize_each_word <- function(string, pattern = NULL){
  if (!is.null(pattern)) {
    g <- l <- j <- list()
    g <- stringr::str_split(base::trimws(string), pattern = pattern)
    for ( i in 1:length(g)){
      l[[i]] <- paste(Hmisc::capitalize(g[[i]]), collapse = " ")
      j[[i]] <- paste(l[[i]], collapse = " ")
    }
    } else {
    g <- l <- j <- list()
    g <- stringr::str_split(base::trimws(string), pattern = "\\s+")
    for ( i in 1:length(g)){
      l[[i]] <- paste(Hmisc::capitalize(g[[i]]), collapse = " ")
      j[[i]] <- paste(l[[i]], collapse = " ")
  }
}
  return(unlist(j))
}
