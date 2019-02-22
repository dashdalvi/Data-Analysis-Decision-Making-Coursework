ex3a<-read.csv("C:/Users/ddalv/Documents/Courses/DADM/# data/ToyotaPrices/ToyotaPrices.csv", header = TRUE)
myData_PKWT <- subset(ex3a, select = c(Price, KM, Weight, Tow_Bar))

summary(myData_PKWT)

# from the summary we can identify that there is high skewness in Price,KM and slightly in Weight
# if the difference between mean and median is -ve then -ve skewness and vice versa
# in this case skewness is positive so the skewness is inclined towards right and it's right skewed


# Cleaning out Junk or identifying missing  values
myData_PKWT$KM[myData_PKWT$KM==1]<-NA

summary(myData_PKWT)

# Kernal Density Plot for Price

plot2 <- plot(density(myData_PKWT$Price), main = "Kernel density of Price",xlab="Price")
polygon(density(myData_PKWT$Price), col = "red", border = "blue")

# COMMENTS:
# Price is skewed since this graph is bi modal
# This graph is not normal distributed since we are having multiple clusters in graph

# Normal QQ-Plot for Price

plot3 <- qqnorm(
  myData_PKWT$Price, 
  pch=".", 
  cex=5, 
  main="Normal Probability QQ Plot")
# COMMENTS:
# There are outliers in the graph and the graph shows that it is rightly skewed
# This is not normally distributed since there are highs and lows in the graph



# Kernal Density Plot for KM
plot(density(myData_PKWT$KM[!is.na(myData_PKWT$KM)]), main = "Kernel density of KM",xlab="KM")
polygon(density(myData_PKWT$KM[!is.na(myData_PKWT$KM)]), col = "red", border = "blue")

# COMMENTS:
# Price is skewed since this graph is bi modal
# This graph is not normal distributed since we are having multiple clusters in graph

# Normal QQ-Plot for KM
qqnorm(
  myData_PKWT$KM[!is.na(myData_PKWT$KM)], 
  pch=".", 
  cex=5, 
  main="Normal Probability QQ Plot") 

# COMMENTS:
# There are outliers in the graph and the graph shows that it is rightly skewed
# This is not normally distributed since there are highs and lows in the graph



#c)  Recode a categotical variable as a factor

# Converting categorical variable into a factor variable
myData_PKWT$Tow_Bar <- factor(myData_PKWT$Tow_Bar)
levels(myData_PKWT$Tow_Bar) <- c("No", "Yes")
summary(myData_PKWT)
# d) Price vs Tow_Bar

boxplot(Price~Tow_Bar,data=myData_PKWT, main="Boxplot of Price vs Tow_Bar",xlab="Tow_Bar", ylab="Price",col="lightgray",borders=c("black","black"))

# COMMENTS:
# Boxplots are different when plotted against Towbar and Price
# It can be easily seen from the box plots that the prices are higher for cars with "no" tow bar when compared with cars having tow bar
# Though there are outliers in cars having tow bar which matches up to an extent with cars not having tow bar
# The max and min vlaues are also low for cars having tow bar (15000,6000) instead of 17000 in case of cars not having tow bars
# Tow bars can be used to predict the price of cars to an extent. We can clearly state that the price will be higher generally for cars not having tow bars.

# e) KM vs Tow_Bar

boxplot(KM~Tow_Bar,data=myData_PKWT, main="Boxplot of KM vs Towbar",xlab="Towbar", ylab="KM",col="lightgray",borders=c("black","black"),is.na=TRUE)
# COMMENTS:
# Boxplots are different when plotted against KM and Towbar
# It cannot be easily seen from the box plots that the KM are higher for cars with "no" tow bar when compared with cars having tow bar
# Though there are outliers in both plots having tow bar which matches up to an extent with cars not having tow bar
# The max and min vlaues are almost at par with each other (cars not having tow bars have max value higher than cars having tow bars and are lower too)
# Tow bars cannot be used to predict the KM

# f)
# Based on the above box plots of Price vs Tow bar & KM vs Tow Bar
# the direction of Prediction of price against tow bar is that if a car is not having tow bars then it's price can be high for a car having tow bars
# The maximum price of a car without tow bar is way higher than car having tow bar, so does the quantiles of the plots
# Clearly one of the predictors to calculate price is "tow bars"