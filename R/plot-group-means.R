library(magrittr)
library(ggplot2)

plot_group_means <- function(data, group1, group2 = NULL, x, y){
  message("This function requires `magrittr` & `ggplot2` packages. Please, load them.")
  data   <- mtcars
  group1 <- "am"
  group2 <- "gear"
  x      <- "vs"
  y      <- as.name("mpg")
  f <- as.formula("y ~ group1 + group2")
  
  if (missing(group2)){
    d <- as.data.frame(data)[,c(x,group1, y)]
    y_name <- as.name(y)
    d[,c(x,group1)] <- sapply(d[,c(x,group1)], factor)
    d_final <- d %>%
      # dplyr::select_(.dots = c(x,group1,y)) %>%
      dplyr::group_by_(.dots = c(x,group1)
      ) %>%
      dplyr::summarize(
        group_means = mean(y_name, na.rm = TRUE))
    
    aggregate(f, mtcars, function(x) mean(x, na.rm = T))
    
    
    ggplot(data = d_final,
           mapping = aes_string(x = x,
                                y = "group_means",
                                colour= group1))+ geom_point() + geom_line()
    
  }
  
  mtcars[group1]
  
  return(means_plot)
}

plot_group_means(data = mtcars, x = "drat", group1 = "am", y = "mpg")

ggplot(data = iris,
       mapping = aes_string(x = "Sepal.Length",
                            y = "Petal.Length",
                            colour= "Species"))+ geom_point() + geom_line()
names(iris)
mtcars[,c("am","gear")] <- sapply(mtcars[,c("am","gear")], factor)
