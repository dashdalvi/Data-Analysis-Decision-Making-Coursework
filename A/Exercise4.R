load(file="C:/Users/ddalv/Documents/Courses/DADM/R/HW3/myData_PKWT.RData")
# A) Get R2R2 using fitted values
# Emitting NA values
New<- na.omit(myData_PKWT)


# To compare if R2 using pearson correlation is same as R2 using model summary

c(summary(g)$r.square,cor((g$fitted.values),New$Price )^2)

# As observed both values are equal 0.6544141

# B) Fit Plot

library(ggplot2)

qplot(g$fitted.values,Price,data=g,main='Fit Plot') +
  geom_abline(intercept=0, slope=1)

# COMMENTS:
# the fitted values in the model can predict the actual prices because majorrity of the points
# are close to the line, with very few outliers. Points are also close to each other and thus are stacked together