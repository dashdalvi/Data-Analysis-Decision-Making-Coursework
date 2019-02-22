#Exercise 3.
#Explore the distribution of Price

load(file="C:/Users/ddalv/Documents/Courses/DADM/R/EX2/ex.RData")
# to plot histogram, density plot, sort plot, QQ-plot against price

# Histogram
library("ggplot2")
plot1 <- hist(
  ex$Price, 
  density=20,
  breaks=20, 
  xlab="Price", 
  main="Price  frequency histogram")

# The variable is not normal and the values are highly skewed and the skewness>1 (1.702105)

# Kernal Density Plot
plot2 <- plot(density(ex$Price), main = "Kernel density of Price",xlab="Price")
polygon(density(ex$Price), col = "red", border = "blue")
plot2

# As shown in the density plot, the variables are skewed and this type of graph is bi modal, multiple modes

# Normal QQ-Plot
plot3 <- qqnorm(
  ex$Price, 
  pch=".", 
  cex=5, 
  main="Normal Probability QQ Plot") 

# In this graph, we observe values are skewed out and some are stretced out to the top
# There are clustered values in the start and at the end of the graph after (3 Quantiles)
# It can be also observed that as the Theroretical Quantiles increases, clustering is visible clearly

# Sort Plot
plot(
  sort(ex$Price), 
  pch=".", 
  cex=5,ylab="Price" ,
  main="Sort Plot")

# Sort plot reveals us that there are clustered values which are lying at the top of index 1400 
# Those values are very close to each other but drifted away from the rest of the points



