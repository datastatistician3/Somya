plot_missing_data <- function(d, outcome, name_event="referral"){    
      ds_plot_missing_data <- d %>% 
                  dplyr::filter(event_name %in% name_event) %>%
                  dplyr::select_(.dots = c(outcome, "event_name")) %>% 
                  dplyr::select(-event_name)

      item <- x <- vector(mode = "list")
      for (i in seq_along(outcome)){
           item[[i]] <- paste0("Item", i)            #tail(strsplit(outcome[i],split="_")[[1]],1)
           item_names <- unlist(item)
           x[[i]] <- paste0("Item",i," ", outcome[i])
           d <- (do.call(rbind,x))
      }

      plotted_data <- VIM::aggr(ds_plot_missing_data, col=c('navyblue','red'), 
                numbers=TRUE, sortVars=TRUE, labels=item_names, 
                    cex.axis=.7, gap=3, ylab=c(paste0("Histogram of missing data for ",capitalize(name_event)), "pattern"))
      
      return(list(plotted_data, d))
}