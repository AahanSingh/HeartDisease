library(clusterGeneration)
library(nnet)
train$ANN <- class.ind(train$num)
wts<- read.csv('optimal.txt',header = FALSE,sep = '\n')
wts<-wts$V1
print(optimal_wts)
ANNModel <- nnet(formula = ANN ~  .-num , data = train, size = 3, softmax = TRUE,maxit=500, Wts=wts)
ANNPred <- predict(ANNModel, test)
ANNPred <- ANNPred[,2] > ANNPred[,1] # 2>1 IF DISEASED. THUS IS TRUE THEN DISEASED
cpy<-test$num
levels(cpy)<-c("FALSE","TRUE")
cpy<-as.logical(cpy)
print(eval(ANNPred,cpy))
accAnn<-eval(ANNPred,cpy)