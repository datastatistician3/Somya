library(magrittr)

make_proper_case <- function (string) {
        s <- gsub("\\_", " ", string)
        s <- gsub("\\.", " ", s)
        s <- base::trimws(s)
        y <- paste0(toupper(substr(s, 1, 1)), tolower(substring(s, 2)))
    return(y)
}

format_model_result_glm_lm <- function(x){
  if (class(x)[1] == "lm") {
    cc <- stats::confint(x)
    d <- cbind.data.frame(summary(x)$coef, exp(summary(x)$coef[,1]), exp(cc))
    colnames(d) <- make_proper_case(c('$\\hat{\\beta}$', "SE($\\hat{\\beta}$)", "z", "p", "exp($\\hat{\\beta}$)", "95%CI (lower)", "95%CI (upper)"))
    rownames(d) <- make_proper_case(rownames(d))
    d <- round(d, 4)
    d_kable <- d %>% knitr::kable()
    return(d_kable)

  } else if (class(x)[1] == "glm" || class(x)[1] == "clm") {
     d_kable <- as.data.frame(round(summary(x)$coef,4))
     colnames(d_kable) <- c("Estimate", "SE", "z","p")
     rownames(d_kable) <- make_proper_case(rownames(d_kable))
     d <- d_kable
     d %>%
      knitr::kable()
  } else {
    print("Model class should be either lm or glm.")
  }
}