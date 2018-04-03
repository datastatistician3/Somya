# get_mode <- function(x) {
#   ux <- unique(x)
#   ux <- x[!is.na(x)]
#   ux[which.max(tabulate(match(x, ux)))]
# }