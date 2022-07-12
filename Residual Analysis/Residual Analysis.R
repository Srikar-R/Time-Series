#Introduction

# In time series models, the residuals are equal to the difference between the observations and the corresponding fitted values:
#Residuals are useful in checking whether a model has adequately captured the information in the data. A good forecasting method will yield residuals with the following properties:

#The residuals are uncorrelated. If there are correlations between residuals, then there is information left in the residuals which should be used in computing forecasts.
#The residuals have zero mean. If the residuals have a mean other than zero, then the forecasts are biased.



#Data Description 

#The dataset contains the number of earthqukes from the year 1916 to 2015 that occured in Japan.


#Objective

#1) Fit a suitable ARMA model
#2) Perform residual analysis for the fitted model

#Analysis

library(tseries)

#1) Importing the dataset

EQ <- read.delim("C:/Users/Srikar/Desktop/SS/R/Sem 6/Practical 8/earthquakes.txt")
head(EQ)

#Making it a time series object

eq=ts(EQ$Quakes,start = 1916,frequency = 10)

#2) Plotting the dataset

ts.plot(eq)

adf.test(eq)

#We observe that it is stationary

#3) Fiiting an ARMA model

library(forecast)


fit=auto.arima(eq,seasonal=FALSE)
fit
 
#The best fitted model is ARMA(0,1). The equation can be given as -0.8092a


#4) Fiiting the model

arim=arima(order=c(0,1,1),eq)


#Residual Analysis

res=resid(fit)


#1.Checking for uncorrelated errors

acf(res)


#From the ACF plot, it is evident that none of the errors are autocorrelated.

#2.Checking if residuals are normally distributed

qqnorm(res)
qqline(res)


#We observe that some observations do not fall on the line.To confirm normality,we can use the Shapiro-wilk test.

shapiro.test(res)

#Since p-value is greater than 0.05, we accept the NUll Hypothesis and say that it the errors are normally distributed.