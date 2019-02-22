# Exercise 1:
#Compute the 5-Number Summary of all the vairables

ex<-read.csv("C:/Users/ddalv/Documents/Courses/DADM/# data/ToyotaPrices/ToyotaPrices.csv", header = TRUE) # loading data into R


summary(ex) # to get five table summary

# Variables where we observe skewness
# 1. KM (minimum value is 1)
# 2. CC ( 16000 is the cc value which is not possible)

#Converting data to NA
ex$KM[ex$KM==1]<-NA
ex$cc[ex$cc==16000]<-NA

# re running the five table summary after fixing values
summary(ex)

