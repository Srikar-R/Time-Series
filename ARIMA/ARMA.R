#Introduction

#An ARMA model, or Autoregressive Moving Average model, is used to describe weakly stationary stochastic time series in terms of two polynomials. 
#The first of these polynomials is for autoregression, the second for the moving average

#Data Description

#The dataset describes Quarterly U.K. imports: goods and services (Pound millions) from 1960 – 1970.

library(readxl)
UK <- read_excel("C:/Users/Srikar/Desktop/SS/R/Sem 6/Practical 7/UKimport.xlsx")
head(UK)

View(UK)

view(UK)
data=ts(UK,start=(1960),frequency=4)
ts.plot(data)


#Objective 

#1 To fit a suitable ARIMA model for describing the patterns in the model
#2. To find a suitable model while examining the ACF and PACF plot of the stationary data




#Analysis 

#Objective 1

#1) Using first difference to make it stationary 

diffdata=diff(data)

plot(diffdata)

#We observe that data is stationary after looking at the plot.

#2) Checking for stationarity
library(tseries)
adf.test(diffdata)

#Since the p-value is less than 0.05, we accept the null hypothesis i.e our model is non-stationary

#3)Checking the ACF and PACF

library(forecast)

par=(mfrow=c(1,2))
acf(diffdata, lag=100)
pacf(diffdata , lag=100)

#From the acf and pacf, we can see that both tails off to 0 after certain lags, which is an indication of an ARMA(p,q) model.That is both AR and MA part will be included in the
#model. But we cannot identify the order p,q of ARMA(p,q) using acf and pacf plots



#5. Fitting ARMA models

library(forecast)
fit=auto.arima(diffdata,seasonal="FALSE")
fit

res=residuals(fit)

Box.test(res,lag=10,fitdf=1)

#Conclusion

#We get a model Yt= -0.4602(Yt-1)


#Objective 2


#From the ACF and PACF we observe that the plots tend to zero after some lags. However,
#we cannot determine the value of p and q. Hence we use different values of p and q. Since
#there is a significant ρ value at lag of 15, we suspect that this process has a moving average
#component of 15 lags. Hence we check for an ARMA(1,15).

arima(order=c(1,0,15),UK)


#The AIC of this new tested model is 488.39. This is much greater than the AIC of the fitted model which is 452.48. Hence we can conclude that the fitted model was the best model.

#Conclusion
#Thus,an ARMA model can be fitted for a time series data. 











