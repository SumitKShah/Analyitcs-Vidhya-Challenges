train1=train1[,-1]
train2=train2[,-1]
dtrain=xgb.DMatrix(data=data.matrix(train1[,-9]),label=data.matrix(train1[,9]))
dtest=xgb.DMatrix(data=data.matrix(train2[,-9]),label=data.matrix(train2[,9]))
lil=list(train=dtrain,test=dtest)
bst=xgb.train(data=dtrain,watchlist=lil,max_depth=4,eta=0.3,nrounds=25,objective="binary:logistic",eval_metric="auc")
pred=predict(bst,dt)
testing=testing[,-1]
dt=xgb.DMatrix(data=data.matrix(testing))
write.csv(as.numeric(pred>0.6),"nepred1.csv")
predi=predict(bst,dtest)
table(train2$Gold,predi>0.6)
for(i in 1:100){t[i]=mean(as.numeric(100*predi > i) == train2$Gold)}
t
