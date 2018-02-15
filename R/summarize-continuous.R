summarize_continuous <- function(ds, groupby, descriptive_column){
  d <- ds[,c(groupby, descriptive_column)]
  names_d <- names(d)
  d %>%
  dplyr::select_(.dots = names_d) %>%
  dplyr::group_by_(.dots = groupby)%>%
  dplyr::summarise_(
       Mean                = interp(~round(mean(v, na.rm = TRUE),2), v = as.name(descriptive_column)),
       Median              = interp(~round(median(v, na.rm = TRUE),2), v = as.name(descriptive_column)),
       Standard_Deviation  = interp(~round(sd(v, na.rm = TRUE),2), v = as.name(descriptive_column)),
       Maximum             = interp(~max(v, na.rm = TRUE), v = as.name(descriptive_column)),
       Range               = interp(~diff(range(v, na.rm = TRUE)), v = as.name(descriptive_column)),
       Minimum             = interp(~min(v, na.rm = TRUE), v = as.name(descriptive_column)),
       Count               = ~n()

  ) %>%
  knitr::kable(
    align   = c("r"),
    format  = "markdown",
    col.names = capitalize_each_word(names(.))
  )
}