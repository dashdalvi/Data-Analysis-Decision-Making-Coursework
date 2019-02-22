## Boxplot

load(file="C:/Users/ddalv/Documents/Courses/DADM/R/EX2/ex.RData")

library(ggplot2)
boxplot(Price~ABS,data=ex, main="Boxplot of Price vs ABS",xlab="ABS", ylab="Price",col="lightgray",borders=c("black","black"))



# COMMENTS:

# Above is the boxplot of Price vs ABS and we observe that cars not having ABS are having low price
# For cars having ABS we observe that the prices are high
# There are outliers present in both values
# For ABS with Yes, outliers are present (approx three) with very high prices
# for cars with No ABS, outliers are not distant from the quartiles when compared to cars with ABS


# Correlation between Price and KM

cor(ex$Price,ex$KM,use = "complete.obs") # this will exclude the NA values

# ANALYSIS:
# Correlation is -0.56 between Price and KM
# Negative correlation is a relationship between two variables in which one variable increases as the other decreases, and vice versa.
# this means if KM increases price decreases because the value is depreciated
# -0.56 correlation identifies as a moderate downhill(negative) relationship between these two
