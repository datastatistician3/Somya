# ```{r echo=TRUE, eval=TRUE, message=FALSE, warning=FALSE, tidy=TRUE}
# rm(list=ls(all=TRUE))
# library(foreign)
# library(reshape2)
# library(sqldf)
# library(reshape)
# library(Hmisc)
# library(dplyr)
# ```
# 
# ## Reading data and manipulation
# depressData <- spss.get("",
#                   datevars = c("datew1", "datew2", "datew3"), to.data.frame = T, use.value.labels = F)
# 
# depressData$CM <- with(depressData, ifelse(hurt1w1 %in% c(1, 2, 3, 4) | badnamesw1 %in%
#                   1:4 | needsw1 %in% 1:4 | sexabusew1 == 1, CM <- 1, ifelse(hurt1w1 == 0 &
#                   badnamesw1 == 0 & needsw1 == 0 & sexabusew1 == 0, CM <- 0, NA)))
# 
# sapply(depressData[, c("PHASTcw1", "PHASTcw2", "PHASTcw3")], function(x) psych::describe(x))
# 
# ## Imputation and restructure
# library(mice)
# imputed1 <- mice(allNumericFactorVars, me =c("", "logreg","logreg","logreg","logreg","",
#                               "","","","norm","norm","norm"))
# 
# # Removing these variables as predictors
# pred <- imputed1$pred
# pred[,c("OUID2","Group", "bdiw1", "bdiw2", "bdiw3")] <- 0
# 
# # Removing `pred` variables as predictors and re-running `MICE`
# imputed2 <- mice(allNumericFactorVars, seed= 98765431, me =c("", "logreg","logreg","logreg","logreg","",
#                               "","","","norm","norm","norm"), pred = pred)
# 
# completeImputed <- complete(imputed2, inc=FALSE)
# 
# long <-reshape(completeImputed, varying =list(c("bdiw1","bdiw2", "bdiw3")),
# #                                 c("PHASTcw1","PHASTcw2","PHASTcw3"),
# #                                 c("singpsyrw1", "singpsyrw2", "singpsyrw3"),
# #                                 c("TOTFRSw1", "TOTFRSw2", "TOTFRSw3"),
# #                                 c("pregw1", "pregw2", "pregw3"),
# #                                 c("helpfw1", "helpfw2", "helpfw3"),
# #                                 c("spstotw1","spstotw2","spstotw3")),
#                                 # c("datew1","datew2","datew3")),
#                               v.names=c("bdiScore"),
#                              times = 1:3, new.row.names = NULL, direction = "long")
# table(long$time)
# summary(long)
# 
# keepLong <- subset(long,
#                     select = c(OUID2, Group,CM, time,bdiScore,PHASTcw1,singpsyrw1,TOTFRSw1,pregw1,helpfw1,spstotw1))
# keepLong$PHASTcw1 <- ifelse(keepLong$PHASTcw1 < 0, 0, keepLong$PHASTcw1)
# summary(keepLong)
# 
# 
