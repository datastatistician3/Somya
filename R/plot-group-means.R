library(magrittr)
library(ggplot2)

plot_group_means <- function(data, group1, group2 = NULL, group3=NULL, y){
  message("This function requires `magrittr` & `ggplot2` packages. Please, load them.")
  group1 <- group1
  group2 <- group2
  group3 <- group3
  y <- y
  y_name <- as.name(y)
   title <- readline(prompt = "Enter title of the plot:") 
   x_lab <- readline(prompt = "Enter x label:") 
   y_lab <- readline(prompt = "Enter y label:") 
   legend_title <- readline(prompt = "Enter the title for legend:")

   if(!missing(group1) && is.null(group2) && is.null(group3)){
    d <- as.data.frame(data)[,c(y,group1)]
    d[,!names(d) %in% y] <- sapply(d[,!names(d) %in% y, drop=F], factor)
    d_final <- d %>%
     dplyr::group_by_(.dots = c(group1)
     ) %>%
     dplyr::summarize(
                 group_means = mean(y_name, na.rm = TRUE),
                 N           = n(),
                 sd          = sd(y_name)) %>% 
     dplyr::mutate(se = sd/sqrt(N),
                   constant = qnorm(0.975)*sd/se,
                   lower    = group_means - constant,
                   upper    = group_means + constant) %>% as.data.frame()
    
     
    pd <- position_dodge(.0)
    final_plot <- ggplot(d_final, aes_string(x=group1, y=quote(group_means))) + 
        geom_errorbar(aes(ymin=lower, ymax=upper), colour="black", width=.1, position=pd) +
        geom_line(position=pd) + scale_colour_brewer(palette = "Set1") + #ggplot2::scale_color_manual(values = c("red", "blue")) +
        geom_point(position=pd, size=3) +
        theme_bw()  + xlab(x_lab) + ylab(y_lab) + ggtitle(title) + theme(legend.position = c(0.9,0.8)) + labs(color= legend_title)
    return(final_plot)
  } else if (!missing(group1) &&  !is.null(group2) &&  is.null(group3)){
   d <- as.data.frame(mtcars)[,c(y,group1, group2)]
   d[,!names(d) %in% c(y)] <- lapply(d[,!names(d) %in% c(y)], factor)
   d_final <- d %>%
    dplyr::group_by_(.dots = c(group1, group2)
    ) %>%
    dplyr::summarize(
                group_means = mean(y_name, na.rm = TRUE),
                N           = n(),
                sd          = sd(y_name)) %>% 
    dplyr::mutate(se = sd/sqrt(N),
                  constant = qnorm(0.975)*sd/se,
                  lower    = group_means - constant,
                  upper    = group_means + constant) %>% as.data.frame()
  
   pd <- position_dodge(.0)
   final_plot <- ggplot(d_final, aes_string(x=group1, y=quote(group_means), colour=group2, group=group2)) + 
       geom_errorbar(aes(ymin=lower, ymax=upper), colour="black", width=.1, position=pd) +
       geom_line(position=pd)  +
       scale_colour_brewer(palette = "Set1") + 
       geom_point(position=pd, size=3) +
       theme_bw()  + xlab(x_lab) + ylab(y_lab) + ggtitle(title) + theme(legend.position = c(0.9,0.8)) + labs(color= legend_title)
return(final_plot)
  } else if (!missing(group1) && !is.null(group2) && !is.null(group3)) {
   d <- as.data.frame(mtcars)[,c(y,group1, group2, group3)]
   d[,!names(d) %in% c(y)] <- lapply(d[,!names(d) %in% c(y)], factor)
   d_final <- d %>%
    dplyr::group_by_(.dots = c(group1, group2, group3)
    ) %>%
    dplyr::summarize(
                group_means = mean(y_name, na.rm = TRUE),
                N           = n(),
                sd          = sd(y_name)) %>% 
    dplyr::mutate(se = sd/sqrt(N),
                  constant = qnorm(0.975)*sd/se,
                  lower    = group_means - constant,
                  upper    = group_means + constant) %>% as.data.frame()
  
   pd <- position_dodge(.0)
   final_plot <- ggplot(d_final, aes_string(x=group1, y=quote(group_means), colour=group2, group=group2)) + 
       geom_errorbar(aes(ymin=lower, ymax=upper), colour="black", width=.1, position=pd) +
       geom_line(position=pd) + facet_wrap(as.formula(sprintf('~%s', group3))) +
       scale_colour_brewer(palette = "Set1") + 
       geom_point(position=pd, size=3) +
       theme_bw()  + xlab(x_lab) + ylab(y_lab) + ggtitle(title) + theme(legend.position = c(0.9,0.8)) + labs(color= legend_title)
return(final_plot)
  } else {
    stop("You need to choose at least one grouping variable.")
  }
}