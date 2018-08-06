#library(magrittr)
#select_filter_nonmissing <- function (d, x, y, z){
#  d <- d %>%
#    dplyr::select_(
#      x,y,z
#    ) %>%
#    dplyr::filter(
#      !is.na(rlang::UQ(dplyr::sym(x)))
#    )
#  return(d)
#}
#
#mtcars[c(1,2,5,6),1] <- NA
#
#select_filter_nonmissing(mtcars, "mpg", "vs", "am")
