# proper_case <- function (x)
# {
#         s <- gsub("\\_", " ", x)
#         s <- gsub("\\.", " ", s)
#         y <- paste0(toupper(substr(s, 1, 1)), tolower(substring(s, 2)))
#     return(y)
# }