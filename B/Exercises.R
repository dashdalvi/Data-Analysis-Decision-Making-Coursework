load(file="C:/Users/ddalv/Documents/Courses/DADM/R/HW3/myData_PKWT.RData")
#1.
# Obtain the Residuals vs Fitted Plot of the fitted model with an added horizontal line at y=0y=0. 
# Do the points look randomly distributed about the line?

library(ggplot2)
ggplot(g, aes(.fitted, .resid)) +
  geom_point() +
  geom_hline(yintercept=0) +
  ggtitle("Residual Plot")
# The points are not randomly distributed about the line


# b)
mod<-fortify(g)
ggplot(mod, aes(.fitted,.stdresid)) +
  geom_point() +
  geom_hline(yintercept=c(-2,0,2), linetype="dashed") +
  ggtitle("Residual Plot")

# There are outliers present both top and bottom of the lines.
# number of outliers are more at the +ve of the y intercept

# we observe a floor effect on the data
# residuals doesn't look like a normal distribution



# Exercise 2: Residual Normal QQ-Plot
mod <- fortify(g)
qplot(sample =.stdresid, data = mod, geom = "qq",main = 'Normal QQ-Plot') + geom_abline()
# We see quite a few outliers, and some departure from normality
# Although the plot looks like a stratight line with some outliers


# Exercise 3: Composite goodness-of-fit plots

plot(g)
# plot(g, which=4, cook.levels=cutoff) used to identify the row numbers

# All the four graphs involve residuals, however the "Scale-location" graph uses square root of the residuals

# the Residuals vs Fitted Plot and the Normal QQ-Plot obtained from this graph is similar to that obtained on the above exercise

# Yes there are outliers present in the graph
# row numbers
# 222, 961