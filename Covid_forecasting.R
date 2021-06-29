#Importing Month Wise Covid Stats in Tamil Nadu.
CovidCases<-read.csv("Covid_Data_TN.csv")
View(CovidCases)

#Verifying type of data
str(CovidCases)

#Making the datas into timeseries data
covidtimeseries<-ts(CovidCases,start=c(2020,3),frequency=12)
print(covidtimeseries)


#Getting Time Series for particular columns.
samplesTested<-covidtimeseries[,"NumberOfSamplesTested"]
positiveCases<-covidtimeseries[,"NumberOfPositiveCases"]
recoveryCases<-covidtimeseries[,"NumberOfRecoveryCases"]
deathCases<-covidtimeseries[,"NumberOfDeathCases"]


#Forecasting and ploting using Armia method.
library(forecast)

#Forecasting is done till end of 2021
#Forecasting for sameples tested
samplesTestedFit<- auto.arima(samplesTested)
samplesTestedForecasting<-forecast(samplesTestedFit,8)
plot(samplesTestedForecasting,main="Sample Tested Forcast",type="l")
print(samplesTestedForecasting)

#Forecasting for postive cases
positiveCasesFit<- auto.arima(positiveCases)
positiveCasesForecasting<-forecast(positiveCasesFit,8)
plot(positiveCasesForecasting,main="Positive Cases Forcast",type="l")
print(positiveCasesForecasting)

#Forecasting for recovery cases
recoveryCasesFit<- auto.arima(recoveryCases)
recoveryCasesForecasting<-forecast(recoveryCasesFit,8)
plot(recoveryCasesForecasting,main="Recovery Cases Forcast",type="l")
print(recoveryCasesForecasting)


#Forecasting for death cases
deathCasesFit<- auto.arima(deathCases)
deathCasesForecasting<-forecast(deathCasesFit,8)
plot(deathCasesForecasting,main="Death Cases Forcast",type="l")
print(deathCasesForecasting)


#Multiple timeseries
combined<-matrix(c(CovidCases[,"NumberOfSamplesTested"],CovidCases[,"NumberOfPositiveCases"]),nrow=14)
View(combined)
timeseries<-ts(combined,start=c(2020,3),frequency=12)
print(timeseries)
plot(timeseries,main="Combined time series of samples tested and positive cases")




