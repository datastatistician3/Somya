# format_model_result_glm_lm <- function(x){
#   if (class(x)[1] == "lm") {
#     cc <- confint(x)
#     d <- cbind.data.frame(summary(x)$coef, exp(summary(x)$coef[,1]), exp(cc))
#     colnames(d) <- capitalize_each_word(c('$\\hat{\\beta}$', "SE($\\hat{\\beta}$)", "z", "p", "exp($\\hat{\\beta}$)", "95%CI (lower)", "95%CI (upper)"))
#     rownames(d) <- capitalize_each_word(rownames(d))
#     d <- round(d, 4)
#     d_kable <- d %>% knitr::kable()
#     return(d_kable)
# 
#   } else if (class(x)[1] == "glm" || class(x)[1] == "clm") {
#      d_kable <- as.data.frame(round(summary(x)$coef,4))
#      colnames(d_kable) <- c("Estimate", "SE", "z","p")
#      rownames(d_kable) <- capitalize_each_word(rownames(d_kable))
#      d <- d_kable
#      d %>%
#       knitr::kable()
#   } else {
#     print("Model class needs to be either lm or glm.")
#   }
# }