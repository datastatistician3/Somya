#' @name make_proper_case
#' 
#' @export
#' 
#' @title This function removes variable separatedwith or without space or underscore or dot delimiters 
#' and converts the string to proper case
#'
#' @description This function removes variable separatedwith or without space or underscore or dot delimiters 
#' and converts the string to proper case
#'
#' @param string A string with or without space or underscore or dot delimiters
#'
#' @return A string with proper case
#'
#' @author Som Bohora
#'
#' @examples
#' 
#' make_proper_case("this is proper case.")
#' make_proper_case("this_is_proper_case.")
#' make_proper_case("this.is.proper.case.")

make_proper_case <- function (string) {
        s <- gsub("\\_", " ", string)
        s <- gsub("\\.", " ", s)
        s <- base::trimws(s)
        y <- paste0(toupper(substr(s, 1, 1)), tolower(substring(s, 2)))
    return(y)
}