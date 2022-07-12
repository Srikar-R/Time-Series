#Introduction

#a time series is a series of data points indexed in time order. Most commonly, a time series is a sequence taken at successive equally spaced points in time. 
#Thus it is a sequence of discrete-time data.

#Stationarity-Time series are stationary if they do not have trend or seasonal effects. Summary statistics calculated on the time series are consistent over time, like the mean or the variance of the observations.
#When a time series is stationary, it can be easier to model. Statistical modeling methods assume or require the time series to be stationary.

#Moving average-A moving average is defined as an average of fixed number of items in the time series which move through the series by dropping the top items of
#the previous averaged group and adding the next in each successive average

#Method of differencing-Differencing is a method of transforming a time series dataset.It can be used to remove the series dependence on time, so-called temporal dependence. This includes structures like trends and seasonality.
#Differencing is performed by subtracting the previous observation from the current observation.


#Objective:

# To choose two-time series data sets with non-stationary components and demonstrate the method of moving average, method of differencing, and the method of seasonal 
#differencing to extract the stationary components.


#Domain 1

#Data Description:

#The dataset shows sales of a business from the year 1964- 1972. It contains 105 rows of data and 2 variables i.e., Year and Sales.

library(readxl)
s1 <- read_excel("C:/Users/Srikar/Desktop/SS/R/Sem 6/Practical 3/Datasets/sales.xlsx", 
                 sheet = "Sales", col_types = c("numeric"))
head(s1)


#Analyis:

library(astsa)
library(forecast)

ts.plot(s1)


#We observe that it is an additive model with a trend and a seasonal componet.

#Using the method of Moving average

#1) Performing method of moving average

#We use order 3 as we dont want to lose the obsevrations in the data.
ma2=ma(s1,order=3)

plot.ts(ma2)



# We can observe that the trend component has been removed and the data is not as seasonal as it used to be.


#Conclusion: Using method of moving average, we can convert a non-stationary dataset to a dataset which can further be used for anlaysis and 
#forecasting.

#Domain 2

#Data Description:

#The dataset shows the sale of ice-creams during the winter season.zThe dataset is a multiplicative model as the magnitude of its peak keeps 
#increasing.

library(readxl)


ice=AirPassengers

head(ice)


#Analyis:

library(astsa)

ts.plot(ice)

#Using the method of differencing

#1) Performing method of moving average


#Since its multiplicative model, we convert it into additive model to perofrm mivng average method.

lice=log(ice)
ts.plot(lice)

s=diff(lice,lag=12)
ts.plot(s)

# We can observe that the trend component has been removed and the data is not as seasonal as it used to be.




#Conclusion: Using method of differencing, we can convert a non-stationary dataset to a dataset which can further be used for anlaysis and 
#forecasting.