summarize_function <- function(ds, column){
# ds %>%
  d <- ds[,column]
  names_d <- names(d)
  # return(names_d)
  d %>%
  dplyr::select_(.dots = names_d) %>%
  dplyr::group_by_(.dots = names(d)
    # county,
    # engaged,
    # response
  ) %>%
  dplyr:: summarize(
    n = n()
   ) %>%
  dplyr::mutate(
    Percentage = paste0(round(n/sum(n)*100, 2), "%")
   ) %>%
  dplyr::rename_(
      "`County`"                         = "`county`"
    , "`Engagement Status`"              = "`engaged_pretty`"
    , "`Count`"                          = "`n`"
    , "`Percentage`"                     = "`Percentage`"
  ) %>%
  knitr::kable(
    align   = c("r"),
    format  = "markdown"
  )
}