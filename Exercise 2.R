#Exercise 2
library(ggplot2)
library(grid)
library(gridExtra)
# Set the state for random number generation in R
set.seed(123)

# Pick the number of observations
n <- 100


# Pick the values for the intercept and the slope
beta0 <- 10
beta1 <- 2

# Assume the error has a normal distribution
# Pick the mean and standard deviation
mu <- 0
sigma1 <- 2.7


# Pick the errors
err1 <- rnorm(n, mean = mu, sd = sigma1)

# Pick the observed inputs
x <- 1:n/(n+1)

# Generate the observed outputs
yobs1 <- beta0 + beta1*x + err1

# Repeat with a different error standard deviation
sigma2 <- 0.7
err2 <- rnorm(n, mean = mu, sd = sigma2)
yobs2 <- beta0 + beta1*x + err2


# 3rd Graph
sigma3 <- 0.27
err3 <- rnorm(n, mean = mu, sd = sigma3)
yobs3 <- beta0 + beta1*x + err3
my_data <- data.frame(x, yobs1, yobs2, yobs3)

#Plotting Graphs
p1 <- qplot(x, yobs1) + 
  geom_abline(intercept = beta0, slope = beta1)
p2 <- qplot(x, yobs2) + 
  geom_abline(intercept = beta0, slope = beta1)
p3 <- qplot(x, yobs3) + 
  geom_abline(intercept = beta0, slope = beta1)

# 4th Graph
x1 <- seq(10,80,70/(n-1))
sigma4 <- 2.7
err4 <- rnorm(n, mean = mu, sd = sigma4)
yobs4 <- beta0 + beta1*x1 + err4
my_data <- data.frame(x1, yobs1, yobs2, yobs3, yobs4)
library(grid)
library(gridExtra)
p4 <- qplot(x1, yobs4) + 
  geom_abline(intercept = beta0, slope = beta1)

grid.arrange(p1, p2, p3, p4,
             ncol = 4, 
             top = "Plots with different error variances")



# OBSERVATIONS
# First Graph
# 1. In the first graph we have taken standard deviation of 2.7, which is approximately between 95%-99.7% area of the bell curve.
# 2. So when the Error is calculated by random normalizing the number of observations, mean and standard deviation. We get alot of scattered errors.
# 3. Based on the standard linear model equation when the observations are generated we find alot of scattered values.
# 4. So when the graph is plotted we can see that alot of observations are scattered above and below the expected line.   

#Second Graph
# 5. Same way when we plot the second graph by changing the standard deviation to 0.7 which inturn reduced the Error.
# 6. Thats why we see a difference of expected value line and also the observations are less scattered compared to the first graph.

# Third Graph
# 7. In a similar way we plot the third graph by changing the standard deviation to 0.27, thus it reduces the error even more.
# 8. That is why the points are less scattered and are close to the expected value line.

# Fourth Graph
# 9. In fourth graph the x coordinate is modified by assigning 100 random variables between 10-80
# 10.Increasing the x variable results in y coordinate scale being increased when compared to previous three graphs
# 11. Interesting observation in this graph is even though the standard deviation is 2.7 which is higher error margin, all the points are lying on the expected value line
# 12. This is because all the values are lying between 95-99% and thus points are on the line