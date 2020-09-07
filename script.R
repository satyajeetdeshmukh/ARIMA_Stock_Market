library(data.table)
library(ggplot2)
library(fpp2)
library(forecast)
library(stats)
library(tseries)
library(readr)

LT.df <- read.csv("C:/Users/satya/Desktop/ARIMA on LT/airtel_monthly.csv", header = TRUE, stringsAsFactors = FALSE)
colnames(LT.df)
class(LT.df$Date)
class(LT.df$Adj.Close)

LT.ts <- ts(data=LT.df$Adj.Close, frequency = 12, start=c(2002,7), end=c(2015,8)) 

time(LT.ts)
frequency(LT.ts)

plot(LT.ts)


TSDecompose <- decompose(LT.ts, type = "multiplicative", filter = NULL)
plot(TSDecompose)

model_autoARIMA = auto.arima(LT.ts, D=2)
summary(model_autoARIMA)

forecast_autoARIMA <- forecast(model_autoARIMA, (12*3))
plot(forecast_autoARIMA)

#uses linear interpolation to replace missing points if any
# tsclean(LT.ts, replace.missing = TRUE, lambda = NULL)

