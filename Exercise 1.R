#Exercise 1
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

# Make a dataframe
my_data <- data.frame(x, yobs1, yobs2, yobs3)
grid.arrange(p1, p2, p3, 
             ncol = 3, 
             top = "Three plots with different error variances")

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