library(e1071)
svmModel <- svm(num~.,data = train)
print(svmModel)
svmPred <- predict(svmModel, test)
print(eval(svmPred,test$num))
accSVM<- eval(svmPred,test$num)