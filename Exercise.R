library(faraway)
data(uswages)

summary(uswages)

# manipulating data
# we see that exper has neg. values
uswages$exper[uswages$exper <0] <-NA

# convert race, smsa, and pt to factor variables
uswages$race <- factor(uswages$race)
levels(uswages$race) <- c("White","Black")
uswages$smsa <- factor(uswages$smsa)
levels(uswages$smsa) <- c("No","Yes")
uswages$pt <- factor(uswages$pt)
levels(uswages$pt) <- c("No","Yes")

uswages <- data.frame(uswages,
                      region =
                        1*uswages$ne +
                        2*uswages$mw +
                        3*uswages$so +
                        4*uswages$we)
uswages$region <- factor(uswages$region)
levels(uswages$region) <- c("ne","mw","so","we")

# delete the four regions ne, mw, so, we
uswages <- subset(uswages,select=-c(ne:we))

# Take care of NAs
uswages <- na.omit(uswages)

# Variable names
names(uswages)
g<-lm(wage~region,data=uswages)
summary(g)
# The number of coefficients associated with region is 3
# they are regionmw,regionso and regionwe



# *********************************************************************


# Exercise 2)


aggregate(wage ~ region, data = uswages, mean)
test=lm(wage ~ region,data= uswages)

coef(test)
# consider equation y=b0+b1X
# here b1 =0 and thus average wage is equal to b0=641.71 which is northeast region

# Average wage in midwest region :
# y=bo+b1X ie) avg wage=bo+b1(midwest)
# Since b0=wages of northeast=691.71 and b1=-48.02
# avg wage of midwest= 593.69 which is 691.71-48.02
# hence average wage in the midwest is b0+b1 dollars

# Average wage in south  region :
# y=bo+b2X ie) avg wage=bo+b2(south )
# Since b0=wages of northeast=691.71 and b2=-56.903
# avg wage of midwest= 584.81 which is 691.71-56.903
# hence average wage in the south  is b0+b2 dollars

# Average wage in south  region :
# y=bo+b3X ie) avg wage=bo+b3(west )
# Since b0=wages of northeast=691.71 and b3=9.514
# avg wage of midwest= 651.23 which is 691.71+9.514
# hence average wage in the south  is b0+b3 dollars

# *********************************************************************




# Exercise 3

options(scipen=9999)
options(show.signif.stars=FALSE)
summary(g) # Model 1 for wage and region
# Here R2 is 0.003979, p value is 0.049 and Fstat is 2.614

g1<-lm(wage~region+educ+exper,data=uswages) # Model 2
summary(g1)
# In this model R2 is 0.138 , Fstar is 62.77 and p-value approx 2.2e-16

# Clearly Model 2 is better than Model 1 because of better F-Statistic, p value too among variables

anova(g, g1)
# using this function we can see that F-Ratio is 152.4 and p-value is 3.025386e-62

# Model 2 is better than model 1 because of high F-statistic, lower p-value

# yes Education and Experience matters when calculating wages and hence this model result will be better

# *********************************************************************





# Exercise 4

# Model 3
g3<-lm(wage~educ+exper,data=uswages)
summary(g3)
#The Fstat for this model is 153 with R2 being 0.134 and p-value <<<1

# Model 2 (wages with region,educ and exper)
summary(g1)
# In this model R2 is 0.138 , Fstar is 62.77 and p-value approx 2.2e-16

# Above models have difference in Fstatistics and have similar R2
# 

anova(g1, g3)
# As shown in above code, F-ratio is 2.404 and p-value is 0.06576
# Since alpha=0.05 and p is 0.06 which is greater than 0.05

#the p-value equals 0.066
#The F-Ratio 2.404 is big, & p-value is 0.066 which is greater than 0.05
#therfore based on this Model 1 is better. 

#education and experience determine wage regardless of the region of the United States you live in


# *******************************************************************************



# Exercise 5

x1 = lm(log(wage) ~ educ + exper, data= uswages) # Model 1
summary(x1)
x2 = lm(log(wage) ~region + educ + exper , data= uswages) # Model 2
summary(x2)
# R2 for both models is approx 0.174 and 0.176 resepctively for both models and p-value is same.
# though the f-statistics is different with 207.9 and 83.96 for model 1 and 2 respectively

anova(x1,x2)
# As shown in above output Fratio is 1.2891 and pvalues is 0.2765

#p-value is 0.276 which is greater than 0.05(alpha) based on this we therfore have  Model 1 is better. 


#education and experience determine wage regardless of the region of the United States you live in.

