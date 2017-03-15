summary(tran)
boxplot(k~Total.Expenditure,data=tran)
hist(k)
boxplot(k)
k[which.max(k)]=median(k)+1.5*IQR(k)
trann=tran
trann$F9=k
