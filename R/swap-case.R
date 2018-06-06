#' @name swap_case
#'
#' @export
#'
#' @title This function converts all lowercase letters to uppercase letters and vice versa.
#'
#' @description Given a string, convert all lowercase letters to uppercase letters and vice versa.
#'
#' @param string A text or paragraph
#'
#' @return A string with swapped cases
#'
#' @author Som Bohora
#'
#' @examples
#' 
#'s <- "thTs Is a 'R Case Swap Function 2'."
#'swap_case(s)

swap_case <- function(string){
  x <- base::substring(string, base::seq(1,base::nchar(string),1), base::seq(1,base::nchar(string),1))
  
  lst = base::list()
  
  for (i in base::seq_along(x)) {
    if (base::grepl(pattern = "[a-z]", x = x[i])) {
      lst[i] <- base::toupper(x[i])
    } else if (base::grepl(pattern = "[A-Z]", x = x[i])) {
        lst[i] <- base::tolower(x[i])
    } else {
      lst[i] <- x[i]
    }
  }
  result <- base::paste0(base::unlist(lst, use.names = F),collapse = "")
  return(result)
}