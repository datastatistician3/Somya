format_model_result_glmer <- function(x){
  cc <- confint(x, parm = "beta_", method = "Wald")
  d <- cbind.data.frame(summary(x)$coef, exp(summary(x)$coef[,1]), exp(cc))
  colnames(d) <- capitalize_each_word(c('$\\hat{\\beta}$', "SE($\\hat{\\beta}$)", "z", "p", "exp($\\hat{\\beta}$)", "95%CI (lower)", "95%CI (upper)"))
  rownames(d) <- capitalize_each_word(rownames(d))
  d <- round(d, 3)
  d_kable <- d %>% knitr::kable()
  return(d_kable)
}