# library(magrittr)
# 
# capitalize_each_word <- function(x){
#   g <- l <- j <- list()
#   g <- stringr::str_split(x, pattern = "[_|.| ]")
#   for ( i in 1:length(g)){
#     l[[i]] <- paste(Hmisc::capitalize(g[[i]]), collapse = " ")
#     j[[i]] <- paste(l[[i]], collapse = " ")
# }
#   return(unlist(j))
# }
# 
# plot_missing_data <- function(d, outcome, name_event){
#       ds_plot_missing_data <- d %>%
#                   # dplyr::filter(event_name %in% name_event) %>%
#                   dplyr::select_(.dots = c(outcome, name_event)) # %>%
#                   # dplyr::select(-event_name)
# 
#       item <- x <- vector(mode = "list")
#       for (i in seq_along(outcome)){
#            item[[i]] <- paste0("Item", i)            #tail(strsplit(outcome[i],split="_")[[1]],1)
#            item_names <- unlist(item)
#            x[[i]] <- paste0("Item",i," ", outcome[i])
#            d <- (do.call(rbind,x))
#       }
# 
#       plotted_data <- VIM::aggr(ds_plot_missing_data, col=c('navyblue','red'),
#                 numbers=TRUE, sortVars=TRUE, labels=item_names,
#                     cex.axis=.7, gap=3, ylab=c(paste0("Histogram of missing data for ",capitalize_each_word(name_event)), "pattern"))
# 
#       return(list(plotted_data, d))
# }
# 
# 
# # mtcars[c(1,3,4,7), c(3,5,10,1)] <- NA
# # plot_missing_data(mtcars, c("mpg","vs"), "am")
# 
