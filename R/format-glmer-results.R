library(magrittr)

make_proper_case <- function (string) {
        s <- gsub("\\_", " ", string)
        s <- gsub("\\.", " ", s)
        s <- base::trimws(s)
        y <- paste0(toupper(substr(s, 1, 1)), tolower(substring(s, 2)))
    return(y)
}

format_model_result_glmer <- function(x){
  cc <- stats::confint(x, parm = "beta_", method = "Wald")
  d <- cbind.data.frame(summary(x)$coef, exp(summary(x)$coef[,1]), exp(cc))
  colnames(d) <- make_proper_case(c('$\\hat{\\beta}$', "SE($\\hat{\\beta}$)", "z", "p", "exp($\\hat{\\beta}$)", "95%CI (lower)", "95%CI (upper)"))
  rownames(d) <- make_proper_case(rownames(d))
  d <- round(d, 3)
  d_kable <- d %>% knitr::kable()
  return(d_kable)
}


