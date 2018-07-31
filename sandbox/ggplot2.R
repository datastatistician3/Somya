# library(ggplot2)
# d <- ggplot(mtcars, aes(cyl, mpg)) + geom_point()
# d + stat_summary(fun.data = "mean_cl_boot", colour = "red", size = 2, geom = "line")
# 
# d + stat_summary(fun.y = "median", colour = "red", size = 2, geom = "point")
# d + aes(colour = factor(vs)) + stat_summary(fun.y = mean, geom="line")
# d + aes(colour = factor(vs)) + stat_summary(fun.y = mean, fun.ymin = min, fun.ymax = max, geom = "line")
# 
# 
# ToothGrowth$F3 <- letters[1:2]
# ggplot(ToothGrowth, aes(y = len, x = supp, colour = dose, group = dose)) + 
#   geom_point()+
#   stat_summary(fun.y = mean,
#                fun.ymin = function(x) mean(x) - sd(x), 
#                fun.ymax = function(x) mean(x) + sd(x), 
#                geom = "pointrange") +
#   stat_summary(fun.y = mean,
#                geom = "line") +
#   facet_wrap( ~ F3)