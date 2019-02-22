# Exercise 1
#For the prostate data in faraway, fit a model with lpsa as the response and the other variables as predictors.
#Compute 90% and 95% CIs for the parameter associated with age

library(faraway)
g=lm(lpsa ~ .,prostate)
summary(g)

# Confidence internval for 90%
confint(g,"age",level=0.9)


# Confidence internval for 95%
confint(g,"age",level=0.95)




# Exercise 2

# Compute and display a 95% joint confidence region for the parameters associated with age and lbph.
# Plot the origin and report the outcome of the appropriate hypotheses test. 
# Affirm this conclusion with an appropriate partial F-test.

library(ellipse)
# by default confint is specified at 95% 
plot(ellipse(g,c("age","lbph")),
     type="l",
     main="Joint Confidence Region")
points(0,0)
points(coef(g)["age"],coef(g)["lbph"],pch=18)
abline(v=confint(g)["age",],lty=2)
abline(h=confint(g)["lbph",],lty=2)

# Since the origin(zero point) is lieing inside the Ellipse , 
# We cannot reject the null hypothesis

# Testing the same using F-test 
# We now plot the linear model for the above

g2=lm(lpsa ~ age + lbph, prostate) # Since we need only age and lbph for this analysis
anova(g2,g) # comparing this with the original model (lpsa against all predictors)

# Since the F-value is 25.89 which is a big value and p-value is 2.2e-16 which is really small
# We do not reject the null hypothesis and keep age and pbph as the predictors





# Exercise 3

# Predict lpsa (95%) for a new patient with lcavol = 1.22692, lweight = 3.62301, age = 65, lbph = -0.3001, svi = 0.0, lcp = -0.79851, gleason = 7.0, pgg45 = 15.0. 
# Do this again for the mean response. Using the exp() function, obtain the new prediction and mean response for psa

a= data.frame(lcavol=1.22692,
               lweight=3.62301,
               age=65,
               lbph=-0.3001,
               svi=0.0,
               lcp=-0.79851,
               gleason=7.0,
               pgg45=15.0)

predict(g,a,interval = "prediction")


# using the exp function

exp(predict(g,a,interval = "prediction"))
# the values are higher in this case because we are using exp function




# Exercise 4
# Repeat the above exercise with new patient age = 20

a= data.frame(lcavol=1.22692,
               lweight=3.62301,
               age=20,
               lbph=-0.3001,
               svi=0.0,
               lcp=-0.79851,
               gleason=7.0,
               pgg45=15.0)

predict(g,a,interval = "prediction")
exp(predict(g,a,interval = "prediction"))

# We observe that once we change the value of age from 65 to 20, the values drastically change, indicating that age is certainly a strong predictor



# Exercise 5
# For the model in exercise 1, remove all the predictors that are not significant at the 5% level.
# Recompute the predictions for exercises 3 and 4. Compare CIs. On the psa scale, which CIs do you prefer?


summary(g)
confint(g,level=0.9)
# Based on above results we are removing lcp,gleason and pgg45  from our analysis and recreating model 1 again

x<-lm(lpsa ~ lcavol+lweight+age+svi,prostate)
summary(x)

b <- data.frame(lcavol = 1.22692, lweight = 3.62031, age = 65,svi=0)
predict(x,b,interval= "prediction",level=0.95)

exp(predict(x,b,interval = "prediction",level = .95))

# repeating the above for age=20
b <- data.frame(lcavol = 1.22692, lweight = 3.62031, age = 20,svi=0)
predict(x,b,interval= "prediction",level=0.95)

exp(predict(x,b,interval = "prediction",level = .95))

# the prediction intervals from second model appears to be less than the first model values (when all predictors were involved)
# This is because we have removed other values from our model 
# The values are clearly reduced when we compare it with the original model

# The second model should be preferred over the first model and it will accurately fit the model better



#Excercise 6

#Test the "small" model in exercise 5 against the "big"" model in
#exercise 1 at probability type I error ?? =0.05 Which model is preferred?

# In order to test the small and big model, we simply compare the two models using anova function

anova(g,x) # where g model contains all predictors


#Since the p-value for the F-stat is 0.1805 and is larger than the significance level 0.05, we accept the reduced model
#Thus, the smaller model is preferred because it is simpler and still valid.
