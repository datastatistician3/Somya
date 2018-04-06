library(magrittr)

make_proper_case <- function (string) {
        s <- gsub("\\_", " ", string)
        s <- gsub("\\.", " ", s)
        s <- base::trimws(s)
        y <- paste0(toupper(substr(s, 1, 1)), tolower(substring(s, 2)))
    return(y)
}

summarize_continuous <- function(ds, groupby, descriptive_column){
  d <- ds[,c(groupby, descriptive_column)]
  names_d <- names(d)
  d %>%
  dplyr::select_(.dots = names_d) %>%
  dplyr::group_by_(.dots = groupby)%>%
  dplyr::summarise_(
       Mean                = lazyeval::interp(~round(mean(v, na.rm = TRUE),2), v = as.name(descriptive_column)),
       Median              = lazyeval::interp(~round(median(v, na.rm = TRUE),2), v = as.name(descriptive_column)),
       Standard_Deviation  = lazyeval::interp(~round(sd(v, na.rm = TRUE),2), v = as.name(descriptive_column)),
       Maximum             = lazyeval::interp(~max(v, na.rm = TRUE), v = as.name(descriptive_column)),
       Range               = lazyeval::interp(~diff(range(v, na.rm = TRUE)), v = as.name(descriptive_column)),
       Minimum             = lazyeval::interp(~min(v, na.rm = TRUE), v = as.name(descriptive_column)),
       Count               = ~n()

  ) %>%
  knitr::kable(
    align   = c("r"),
    format  = "markdown",
    col.names = make_proper_case(names(.))
  )
}

summarize_continuous(mtcars, "am", "mpg")
