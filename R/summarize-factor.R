# @name summarize_factor
#
# @export
#
# @title This function summarizes factor variable
#
# @description This function sorts the given unsorted vector using insertion algorithm
#
# @param ds A dataframe object
# 
# @param column A factor column or vector of factor columns
#
# @return A sorted vector
#
# @author Som Bohora
#
# @examples
# library(magrittr)
# summarize_factor(mtcars, c("am","vs"))
# 
# @importFrom magrittr %>%
# @export
library(magrittr)

make_proper_case <- function (string) {
        s <- gsub("\\_", " ", string)
        s <- gsub("\\.", " ", s)
        s <- base::trimws(s)
        y <- paste0(toupper(substr(s, 1, 1)), tolower(substring(s, 2)))
    return(y)
}

summarize_factor <- function(ds, column){
 d1 <- ds[,column, drop=FALSE]
 d <- d1 #[complete.cases(d1),]
 names_d <- names(d)
 d %>%
 dplyr::select_(.dots = names_d) %>%
 dplyr::group_by_(.dots = names(d)
 ) %>%
 dplyr::summarise(
   num = n()
  ) %>%
 dplyr::mutate(
   Percentage = paste0(round(num/sum(num)*100, 2), "%")
  ) %>%
 knitr::kable(
   align   = c("r"),
   format  = "markdown",
   col.names = make_proper_case(names(.))
 )
}

summarize_factor(mtcars, c("am","vs"))
