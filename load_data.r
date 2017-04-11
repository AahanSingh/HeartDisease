library(caret)
# LOAD DATA
heart.data <- read.csv('processed.cleveland.data.txt',header = FALSE,sep=',',na.strings = '?')
names(heart.data)<-c('age','sex','cp','trestbps','chol','fbs','restecg','thalach','exang','oldpeak','slope','ca','thal','num')

heart.data$num[heart.data$num > 0] <- 1

heart.data$age = as.numeric(heart.data$age)
heart.data$sex=as.factor(heart.data$sex)
heart.data$cp=as.factor(heart.data$cp)
heart.data$trestbps=as.factor(heart.data$trestbps)
heart.data$chol=as.numeric(heart.data$chol)
heart.data$fbs=as.factor(heart.data$fbs)
heart.data$restecg=as.factor(heart.data$restecg)
heart.data$thalach=as.numeric(heart.data$thalach)
heart.data$exang=as.factor(heart.data$exang)
heart.data$oldpeak=as.numeric(heart.data$oldpeak)
heart.data$slope=as.factor(heart.data$slope)
heart.data$ca=as.factor(heart.data$ca)
heart.data$thal=as.factor(heart.data$thal)
heart.data$num=as.factor(heart.data$num)

levels(heart.data$num) = c("No disease","Disease")
levels(heart.data$sex) = c("female","male")
heart.data <- na.omit(heart.data)
# PLOT INITIAL
mosaicplot(heart.data$sex ~ heart.data$num,
           main="Fate by Gender", shade=FALSE,color=TRUE,
           xlab="Gender", ylab="Heart disease")

boxplot(heart.data$age ~ heart.data$num,
        main="Fate by Age",
        ylab="Age",xlab="Heart disease")

# PARTITION DATA
set.seed(123)
t <- createDataPartition(heart.data$num, p = 0.7, list = FALSE)
train <- heart.data[t,]
test <- heart.data[-t,]
Accuracy <- vector()