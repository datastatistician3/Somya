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

# library(magrittr)
# f2 <- function (d, variables_to_select, variable_required){
#   d %>%
#     dplyr::select(!!variables_to_select) %>%
#     tidyr::drop_na(!!variable_required)
# }
