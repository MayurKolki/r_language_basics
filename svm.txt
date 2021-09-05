#svm classification
#dataser:CTG


library(caret)
library(MASS)
library(corrplot)
library(ROCR)
library(ggplot2)
library(rpart)
library(rpart.plot)
library(e1071)   #svm
path="C:/Users/mayur/Desktop/data analyst vedios/r language/machine learning/ctg_1.csv"

ctg=read.csv(path,header=T) #,stringsAsFactors = T)
#file.choose()

#nrow()
View(ctg)
head(ctg)
tail(ctg)

dim(ctg)

str(ctg)
# functions to check Nulls/0
checkNull=function(x) return(any(is.na(x)))
checkZero=function(x) return(any(x==0))

# EDA
colnames(ctg)[apply(ctg,2,checkNull)]
colnames(ctg)[apply(ctg,2,checkZero)]

#


nrow(ctg)

#distribution of y
table(ctg$NSP)

ctg$NSP=as.numeric(ctg$NSP)

str(ctg)

#minmax 
minmax=function(x) return((x-min(x))/(max(x)-min(x)))


#standardize the data set

ctg_scale=as.data.frame(lapply(ctg,minmax))

#ensure the svcalin has been done properly 
#data shd  lie between 0 and 1
summary(ctg_scale)
head(ctg)
head(ctg_scale)

#replace the scaled NSP with the original Y 
ctg_scale$NSP=ctg$NSP
View(ctg_scale)


#change the y to factor 
ctg_scale$NSP=as.factor(ctg_scale$NSP)
ctg$NSP=as.factor(ctg$NSP)


#check singularity
library(funModeling)
freq(ctg$NSP)

table(ctg$DS)
2118/2126
table(ctg$DP)
1948/2126



#split the dATA into train and test
total=nrow(ctg_scale)
ss=sample(seq(1,total),floor(0.7*total))
train=ctg_scale[ss,]
test=ctg_scale[-ss,]

#build SVM model using different kernels 
#1)liner
#2)radial #gama
#3)sigmoid # gama
#4)polynimial #gama
###
ker='linear'
#every kernel has c hyperparametr
c_list=c(0.001,0.01,0.1,1,10,50,100)

#do the cv to get the best c
cv1=tune(svm,NSP~.,
         data=train,
         kernal=ker,
         ranges=list(cos=c_list),
         cross=3   
           )
print(cv1)
optC=unlist(cv1$best.parameters)
optC

#build model with the optc
m1=svm(NSP~.,data=train,kernel=ker,
       cost=optC)
?svm
#predict
p1=predict(m1,test)

#confusion matrix and classification report
cm1=confusionMatrix(test$NSP,p1)
table(test$NSP)

493/499


#visualise
plot(m1,Max~Tendency)
    plot(m1,,test,ASTV~Variance)
name(train)
plot(m1,test,DP~UC)

#model 2kernel =radial 
ker="radial"
c_list=c(0.001,0.01,0.1,1,10,50,100)
g_list=c(0.005,0.05,0.05,0.02,0.01,0.1,1)
#cross-validation to get the optimal c and gama combination
cv1=tune(svm,NSP~.,data=train,cm2
         kernel=ker,
         ranges=list(cos=c_list,gamma=g_list))

?tune

print(cv1$best.parameters)

optC=unlist(cv1$best.parameters[1])
optG=unlist(cv1$best.parameters[2])

m2=svm(NSP~.,data=train,kernel=ker,cost=optC,gamma=optG)


#predict
p2=predict(m2,test)
#confusiomatrix
cm2=confusionMatrix(test$NSP,p2)


#model 3:kernel=sigmoid
ker="sigmoid"
c_list=c(0.001,0.01,0.1,1,10,50,100)
g_list=c(0.005,0.05,0.05,0.02,0.01,0.1,1)

#do the cv to get the best c
cv1=tune(svm,NSP~.,
         data=train,
         kernal=ker,
         ranges=list(cos=c_list,gama=g_list)
          )
print(cv1$best.parameters)

optC=unlist(cv1$best.parameters[1])
optG=unlist(cv1$best.parameters[2])

optC
optG

#sigmoid model 
m3=svm(NSP~.,data=train,kernel=ker,cost=optC,gamma=optG)

#predict
p3=predict(m3,test)

#confusionmatrix 
cm3=confusionMatrix(test$NSP,p3)


##model 4:kernel=polynomial
ker="polynomial"
c_list=c(0.001,0.01,0.1,1,10,50,100)
g_list=c(0.005,0.05,0.05,0.02,0.01,0.1,1)

#do the cv to get the best c
cv1=tune(svm,NSP~.,
         data=train,
         kernal=ker,
         ranges=list(cos=c_list,gama=g_list)
)
print(cv1$best.parameters)

optC=unlist(cv1$best.parameters[1])
optG=unlist(cv1$best.parameters[2])

optC
optG

#polynomial model 
m4=svm(NSP~.,data=train,kernel=ker,cost=optC,gamma=optG)

#predict
p4=predict(m4,test)

#confusionmatrix 
cm3=confusionMatrix(test$NSP,p4)














