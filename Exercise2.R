# Exercise 2:
#Convert categorical variables to factor
# Variables Mfg_year,Automatic,Mfr_Guarantee,BOVAG_Guarantee,ABS,Airbag_1,Airbag_2,Airco
# values should be converted into factors
#save(ex, file="ex.RData")

#Then, in a code chunk in the R Markdown file, load the data from the file:
  
load(file="C:/Users/ddalv/Documents/Courses/DADM/R/EX2/ex.RData")

# Converting categorical variable into a factor variable
ex$Mfg_Year <- factor(ex$Mfg_Year)

ex$Mfg_Month <- factor(ex$Mfg_Month)

ex$Mfr_Guarantee <- factor(ex$Mfr_Guarantee)
levels(ex$Mfr_Guarantee) <- c("No", "Yes")
# Giving the factor levels some useful names
# give the name *No* to 0 and *Yes* to 1

ex$ABS <- factor(ex$ABS)
levels(ex$ABS) <- c("No", "Yes")

ex$BOVAG_Guarantee <- factor(ex$BOVAG_Guarantee)
levels(ex$BOVAG_Guarantee) <- c("No", "Yes")

ex$Airbag_1 <- factor(ex$Airbag_1)
levels(ex$Airbag_1) <- c("No", "Yes")

ex$Airbag_2 <- factor(ex$Airbag_2)
levels(ex$Airbag_2) <- c("No", "Yes")

ex$Airco <- factor(ex$Airco)
levels(ex$Airco) <- c("No", "Yes")

ex$Automatic_airco <- factor(ex$Automatic_airco)
levels(ex$Automatic_airco) <- c("No", "Yes")

ex$Boardcomputer <- factor(ex$Boardcomputer)
levels(ex$Boardcomputer) <- c("No", "Yes")

ex$CD_Player <- factor(ex$CD_Player)
levels(ex$CD_Player) <- c("No", "Yes")

ex$Central_Lock <- factor(ex$Central_Lock)
levels(ex$Central_Lock) <- c("No", "Yes")

ex$Powered_Windows <- factor(ex$Powered_Windows)
levels(ex$Powered_Windows) <- c("No", "Yes")

ex$Power_Steering <- factor(ex$Power_Steering)
levels(ex$Power_Steering) <- c("No", "Yes")

ex$Radio <- factor(ex$Radio)
levels(ex$Radio) <- c("No", "Yes")

ex$Mistlamps <- factor(ex$Mistlamps)
levels(ex$Mistlamps) <- c("No", "Yes")

ex$Sport_Model <- factor(ex$Sport_Model)
levels(ex$Sport_Model) <- c("No", "Yes")

ex$Backseat_Divider <- factor(ex$Backseat_Divider)
levels(ex$Backseat_Divider) <- c("No", "Yes")

ex$Metallic_Rim <- factor(ex$Metallic_Rim)
levels(ex$Metallic_Rim) <- c("No", "Yes")

ex$Radio_cassette <- factor(ex$Radio_cassette)
levels(ex$Radio_cassette) <- c("No", "Yes")

ex$Tow_Bar <- factor(ex$Tow_Bar)
levels(ex$Tow_Bar) <- c("No", "Yes")

summary(ex)
