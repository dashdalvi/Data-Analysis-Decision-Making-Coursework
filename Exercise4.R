
load(file="C:/Users/ddalv/Documents/Courses/DADM/R/EX2/ex.RData")
library(ggplot2)

options( warn = -1 ) # will ignore the warning errors


# Scatterplot using qplot() function

p <-
  invisible(qplot(Price, KM, data = ex,is.na=TRUE,alpha=I(1/2),shape=I(19)) + 
  geom_abline(intercept = 0, 
              slope = 1, 
              color="hot pink") + 
  geom_smooth(method = "lm", se=FALSE))
p
suppressMessages(library(memisc, warn.conflicts = FALSE, quietly=TRUE))

# Scatterplot using plot() function

plot(ex$Price,ex$KM,data=ex,is.na=TRUE,alpha=I(1/2),xlab="Price",ylab="KM",
     main="Scatterplot of Price vs KM")+
abline(lm(ex$Price~ex$KM), col="red") # regression line (y~x) +
lines(lowess(ex$Price,ex$KM), col="blue") # lowess line (x,y)

# COMMENTS:
# Analyzing both these scatterplots we observe that there is a curve not line between these two
# The curve is Non-Linear negative because it is decreasing with increase in Price


