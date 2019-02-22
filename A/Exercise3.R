load(file="C:/Users/ddalv/Documents/Courses/DADM/R/HW3/myData_PKWT.RData")

library("ggplot2")
g <- lm(Price ~ 
          KM + 
          Weight + 
          Tow_Bar , 
        data=myData_PKWT
) 

options(scipen=9999)
options(show.signif.stars=FALSE)
summary(g)

# b) Residual five-number summary
# The minimum value is -19355.6 whereas the max value is 8762.4 whereas the median is -59.5
# The median is itself negative this means mhalf of the points are inclined negative
# the variables appear to be skewed that too towards the left because it's negative


# C) Intercept
# The intercept Estimate is -27342.64 for Price vs KM/Weight/TowBar,
# negative values tells that the Price of car will decrease with increase in KM, Weight and towbar
# Price has an estimate of -0.05 with KM indicating Price will decrease with increase in KM
# When compared to weight our data estimates that Price is directly proportional to weight
# However, if car has a tow bar then the price will decrease significantly

# The second part:
# The standard Error measures the average amount that the coefficient estimates vary from the actual average value of our response variable
# Std Error fir weight is 1.08 whereas estimate is 39.06 which is good
# whereas its huge for tow bar (124 and -635 estimate)

# D) Signs of the slope coeffcients
# the signs of the slopes are negative for KM, positive for Weight and negative for Tow Bar
# For KM, slope is -0.05 that is price will increase by 1 if KM decrease by -0.05
# For weight, its 39.06 that is prirce will increase by 1 if weigt increases by 39
# For tow bar(Yes), price will increase by 1 if tow bar decreases by 635



# E) Price vs KM


qplot(Price, KM, data=g) +
  geom_abline(intercept=0, slope=1)
# COMMENTS:
# Price tends to increase with decrease in KM,
# Price in lowest when KM is higher and gradually increase with decrease in KM
# there are outliers though where Price is high and KM is also high
# Maximum number of points are present when price is low and KM in range of 50000-100000
# As the price starts increasing, number of points also decreases to an extent


# F) Price vs Weight

qplot(Price, Weight, data=g) +
  geom_abline(intercept=0, slope=1)
# COMMENTS:
# Price increases with increase in weight till 1200 weight after which it remanins constant
# there are outliers present though when both Price and Weight are high
# There is a gradual increase only not a steep increase

# G) Price of a Tow_Bar

qplot(Price, Weight, data=g,col=Tow_Bar) +
  geom_abline(intercept=0, slope=1)

# COMMENTS:
# there is a clear indication that price increases with weight for cars without tow bar
# For cars with tow bar, there are few outliers 

# H) The Coefficient of Determination, Multiple R2
# The Multiple R square is 0.6544 which is roughly 65% 
# Corresponds with the amount of variability in what you're predicting that is explained by the model
# A high R-squared indicates good correlation