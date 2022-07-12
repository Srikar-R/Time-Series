#Introduction

#a time series that can be described using an additive model with increasing or decreasing trend and no seasonality, you can use Holt’s exponential smoothing to make short-term forecasts.
#Holt’s exponential smoothing estimates the level and slope at the current time point. Smoothing is controlled by two parameters, alpha, for the estimate of the level at the current time point, and beta
#for the estimate of the slope beta of the trend component at the current time point.The paramters alpha and beta have values between 0 and 1.
#The values that are closer to 0 means that little weight is placed on the most recent observations when making forecasts of future values.

#Objective:

# To fit a suitable model and predcit values for next 5 data points

#Data Description:

#This dataset describes the monthly number of sales of shampoo over a 3 year period.The units are a sales count and
#there are 36 observations. The original dataset is credited to Makridakis, Wheelwright and Hyndman (1998).

# Source: https://machinelearningmastery.com/time-series-datasets-for-machine-learning/

library(readxl)

dat <- read_excel("C:/Users/Srikar/Desktop/SS/R/Sem 6/Practical 4/Dataset.xlsx")
head(dat)

#Analysis:

library(astsa)

#1) Plotting the time series data

sales=gnp
plot.ts(sales,main="Sales")

#2) Applying Holts-Winters filtering

forecasting <- HoltWinters(sales, gamma=FALSE)


#3)Plotting forecast

library(forecast)
forecast_data=forecast(forecasting,h=5)
plot(forecast_data)

#Conclusion:

#Using the holt-winters filter, we forecast data whhich has trend or seasonality.


