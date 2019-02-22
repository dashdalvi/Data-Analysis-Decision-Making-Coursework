#Excercise 1
#Process the data to make factors with named levels for race, smsa, and pt, replace the indicator variables ne, mw, so, and we with one factor called region with levels named: ne, mw, so, and we*. Remove all NAs?

library(faraway)
data(uswages)
uswages$exper[uswages$exper <0] <-NA
uswages$race <- factor(uswages$race)
levels(uswages$race) <- c("White","Black")
uswages$smsa <- factor(uswages$smsa)
levels(uswages$smsa) <- c("No","Yes")
uswages$pt <- factor(uswages$pt)
levels(uswages$pt) <- c("No","Yes")
summary(uswages)
uswages <- data.frame(uswages,region = 1*uswages$ne + 2*uswages$mw + 3*uswages$so + 4*uswages$we)
uswages$region <- factor(uswages$region)
levels(uswages$region) <- c("ne","mw","so","we")
uswages <- subset(uswages,select=-c(ne:we))
uswages <- na.omit(uswages)

#Exercise 2
#Show that the summary of your final data is the following?

summary(uswages)

#Exercise 3
#Compute OLS fit to model log(wage)~. and Perform the Shapiro-Wilk Test of Normality for the residuals, what is the conclusion?

## OLS Method
g <- lm(log(wage)~. , data = uswages)
summary(g)
par(mfrow=c(2,2))
plot(g)
vif(g)
shapiro.test(residuals(g))
#CONCLUSION:-
#The null hypothesis is that the residuals are normal. 
#Since the p-value is smaller than the significant value (0.05), we reject the null hypothesis. 
#Hence, we can say that the residuals are not normal.

#Exercise 4
#Compute WLS fit to model log(wage)~. and weights = 1/(1+educ), and perform the Shapiro-Wilk Test of Normality for the residuals, what is the conclusion?

## WLS Method
g1 <- lm(log(wage)~. , data = uswages,weights =  1/(1+educ))
summary(g1)
par(mfrow=c(2,2))
plot(g1)
vif(g1) ## collinearity changes drastically.
shapiro.test(residuals(g1)) ## value decreases.
#CONCLUSION:-
#The null hypothesis is that the residuals are normal. 
#Since the p-value is smaller than the significant value (0.05), we reject the null hypothesis. 
#Hence, we can say that the residuals are not normal.


#Exercise 5
#Compute Robust fit to model log(wage)~. using Huber, Hampel, Biquare, LTS, and LAD ?

## Huber Method
library(MASS)
g2 <- rlm(log(wage)~.,psi = psi.huber,data=uswages)
shapiro.test(residuals(g2)) 

## Hampel Method
g3 <- rlm(log(wage)~.,psi = psi.hampel,init = "lts", maxit = 100,data = uswages)
shapiro.test(residuals(g3))

## Bisquare Method
g4 <- rlm(log(wage)~.,psi = psi.bisquare,init = "lts", maxit = 100,data = uswages)
shapiro.test(residuals(g4))

## Least Trimmed Square Method
library(robustbase)
g5 <- ltsReg(log(wage)~.,data = uswages)
shapiro.test(residuals(g5))

## Least Absolution Deviation Method
library(quantreg)
g6 <- rq(log(wage)~.,data = uswages)
shapiro.test(residuals(g6))

#Compare coefficients of the above fits using OLS, WLS, Huber, Hampel, Biquare, LTS, and LAD ?
library(car)
coefs <- compareCoefs(g, g1, g2, g3, g4, g5, g6, se = FALSE)
colnames(coefs) <- c("OLS","WLS" ,"Huber", "Bisquare", "Hample", "LTS", "LAD")
coefs

#CONCLUSION:-

#We see that LTS and LTS-exact appear to agree with each other and both are very different from OLS.
#All three M-estimation methods, Huber, Bisquare, and Hample are different from each other, and different from OLS and both LTS's.
#LAD is similar to OLS.
#LTS is recommended since it has the best breakdown.
#LTS-exact may take a lot of CPU time for even a moderate size dataset.
 
