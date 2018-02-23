summarize_factor <- function(ds, column){
  d1 <- ds[,column, drop=FALSE]
  d <- d1 #[complete.cases(d1),]
  names_d <- names(d)
  d %>%
  dplyr::select_(.dots = names_d) %>%
  dplyr::group_by_(.dots = names(d)
  ) %>%
  dplyr:: summarize(
    n = n()
   ) %>%
  dplyr::mutate(
    Percentage = paste0(round(n/sum(n)*100, 2), "%")
   ) %>%
  knitr::kable(
    align   = c("r"),
    format  = "markdown",
    col.names = proper_case(names(.))
  )
}

summarize_factor(mtcars, c("am","vs"))
