Accuracy<-c(accAnn,accDT,accRF,accSVM)
barplot(Accuracy, main="Model Comparison", horiz=TRUE,names.arg=c("ANN", "Decision Tree", "Random Forest","SVM"),xlim = c(0,100))