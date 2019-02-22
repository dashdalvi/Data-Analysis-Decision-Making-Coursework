load(file="C:/Users/ddalv/Documents/Courses/DADM/R/HW3/myData_PKWT.RData")

#pairs(~Price + KM+Weight, data = myData_PKWT)

library("GGally","ggplot2")
ggpairs(myData_PKWT, columns = c(2:3,1))

# COMMENTS:
# The KM is plotted against Price and it's not normally distributed because there are certain outliers due to which graph is not distributed normally
# The coefficient of KM with price is negative (-0.569), this means Price will increase if KM is less and vice versa, this is clearly a predictor for Price estimation
# The coefficient of Weight with Price is postivie(0.58), which tells us that they are directly related to each other, increase in weight will resilt in incease in Price

# Reduntants:
# Yes Weight and KM are reduntant to each other and there is no relationship among them, there correlation is also -0.01

# Outliers
# There are outliers present in all the graphs
# In Weight vs Price graph, there are several outliers present at values approx(1550  weight) and other at 1600 weight
# In KM vs Price there are outliers having KM above 30000

#pairs(~Price + KM+Weight, data = myData_PKWT,col=myData_PKWT$Tow_Bar)

ggpairs(myData_PKWT, columns = c(2:3,1),ggplot2::aes(colour=Tow_Bar))

# Plot is of Scatterplot matrix with factor information

# COMMENTS:
# The relation between Price and KM for cars with/without tow bar is not same
# The relation between Price/KM without tow bar is higher(Price-KM are inversely related) with r=-0.58
# On the other hand for cars with tow bar, r=-0.50
# Though the graph is almost similar for them, still we observe that for cars without tow bar

# When we compare Price with Weight for cars with/without tow bars, great variation is observed
# we observe that the value of r varies greatly for cars with/without tow bars (2 times the value)
# For cars without tow bar, r is high as 0.61 whereas it's 0.30 for cars without tow bar
# there is a strong relation between weight of car with it's price for cars without tow bar