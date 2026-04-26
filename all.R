# linear programming
library(lpSolve)
obj.fn = c(500,450,580)
const.mat= matrix(c(8.4,6,9.6,3,6,8,1,0,0),ncol=3,byrow=TRUE)
const.dir = c("<=","<=","<=")
const.rhs = c(72,40,8)

lp.solution= lp("max",obj.fn,const.mat,const.dir,const.rhs,compute.sens = TRUE)
lp.solution

lp.solution$solution

# normal distribution and probability
mean =75
sd= 10
prob_between = pnorm(80,mean,sd)- pnorm(60,mean,sd)
prob_between

pro_abov_90 = 1- pnorm(90,mean,sd)
pro_abov_90

# generate normal distribution samples
scores=rnorm(1000,mean,sd)

hist(scores,main="histogram of 1000 random samples",xlab="test score")

# binomial distribution
mean=5
sd=5
bino_data=rbinom(15,size=12,prob=1)
summary(bino_data)

# paired t test - lactic acid
before <- c(15,16,13,13,17,20,13,16,14,18)
after<-c(33,20,30,35,40,37,18,26,21,19)

result<-t.test(after,before,paired=TRUE)
print(result)

# as the value of p<0.05 reject H0 , there is significant difference in means

# generate 30 random numbers from binomial distribution
# binomial : mean =5,variance =3
# mean = n*p=5, variance = n*p*q=3
# q= 3/5 =0.6 , p=0.4, n=5/0.4= 13
binomal_data= rbinom(30,size=13,prob=0.4)
binomal_data
summary(binomal_data)

# generate 200 from normal distribution with mean=10, variance=16
norm_data=rnorm(200,mean=10,sd=4)
summary(norm_data)

# bootstrap
library(ISLR)
library(boot)
attach(Auto)
Auto
statistic=function(data,index){ lm.fit=lm(mpg~horsepower,data=data,subset=index)
coef(lm.fit)}
statistic(Auto,1:392)
summary(lm(mpg~horsepower,data=Auto))
# linear bootstrap
boot_linear=boot(Auto,statistic,1000)
print(boot_linear)
# quad bootstrap
quad_statistic=function(data,index){
  lm.fit=lm(mpg~poly(horsepower,2),data=data,subset=index)
  coef(lm.fit)}
quad_statistic(Auto,1:392)
boot_quad=boot(Auto,quad_statistic,1000)
boot_quad
summary(lm(mpg~poly(horsepower,2),data=Auto))


# logistics regression
model=mtcars[c("am","cyl","hp","wt")]
log_model=glm(formula=am~cyl+hp+wt,data=model,family=binomial)
summary(log_model)

#polynomial regression
x=c(1,2,3,4,5,6,7,8,9,10)
y=c(6,8,12,14,18,20,22,24,26,28)
plot(x,y)
fit1=lm(y~x)
fit1
abline(fit1,col="red")
summary(fit1)

xsq=x^2
fit2=lm(y~x+xsq)
fit2
x1=seq(min(x),max(x),0.01)
y1=predict(fit2,list(x=x1,xsq=x1^2))
lines(x1,y1,col="blue")




#   TRANSPORTATION PROBLEM

library(lpSolve)
cost.mat=matrix(nrow=3,ncol=5)
cost.mat[1,]=c(3,2,3,4,1)
cost.mat[2,]=c(4,1,2,4,2)
cost.mat[3,]=c(1,0,5,3,2)
row.rhs=c(75,150,75)
col.rhs=c(100,60,40,75,25)
row.det=c("<=","<=","<=")
col.det=c(">=",">=",">=",">=",">=")
result=lp.transport(cost.mat,"min",row.det,row.rhs,col.det,col.rhs)
result
result$solution


#   LOGISTICS REGRESSION USING MTCARS

model=mtcars[c("am","cyl","hp","wt")]
data_model=glm(formula = am~cyl+hp+wt, data = model,family=binomial)
summary(data_model)


#  POLYNOMIAL REGRESSION FOR GIVEN DATA

x=c(1,2,3,4,5,6,7,8,9,10)
y=c(6,8,12,14,18,20,22,24,26,28)
       #  for linear line
fit1=lm(y~x)
plot(x,y)
abline(fit1,col="red")
       # for quadratic line
xsq=x^2
fit2=lm(y~x+xsq)
xv=seq(min(x),max(x),0.01)
yv=predict(fit2,list(x=xv,xsq=xv^2))
lines(xv,yv,col="blue")

       # for cubic line
xcub=x^3
fit3=lm(y~x+xsq+xcub)
xx=seq(min(x),max(x),0.01)
yy=predict(fit3,list(x=xx,xsq=xx^2,xcub=xx^3))
lines(xx,yy,col="green")


summary(fit1)
summary(fit2)
summary(fit3)

# LOGISTICS REGRESSION USING MTCARS WITH PREDICTION

library(dplyr)
summary(mtcars)
library(caTools)

   # splitting data
split=sample.split(mtcars,SplitRatio= 0.8)
train_reg=subset(mtcars,split==TRUE)
test_reg=subset(mtcars,split==FALSE)

   # training model

logistics_model=glm(am~cyl+hp+wt,data=train_reg,family="binomial")
logistics_model

summary(logistics_model)
   
   # predict test data based on the model
predict_reg= predict(logistics_model,test_reg,type="response")
predict_reg
 
   # evaluating confusion metric
table(test_reg$am,predict_reg>0.5)

accuracy=(5+4)/(5+4+0+0)
accuracy


# LINEAR PROGRAMMING : ASSIGNMENT PROBLEM

library(lpSolve)
m=rbind(c(1,2,2),c(2,3,3),c(5,1,3))
sol=lp.assign(cost.mat=m,direction = "min")
sol
sol$solution

# QUADRATIC PROGRAMMING
library(quadprog)
D=matrix(c(1,-1,-1,2),2,2,byrow=T)
d=c(2,6)
A=rbind(c(-1,-1),c(1,-2),c(-2,-1))
b=c(-2,-2,-3)

sol=solve.QP(D,d,t(A),c(b),meq=0)
res=sol$solution
res
sol$value

# ANOVA ONE WAY
library(dplyr)
mtcars_aov<- aov(mtcars$disp~factor(mtcars$gear))
summary(mtcars_aov)

# TWO WAY ANOVA
library(dplyr)
mtcar_aov2<-aov(mtcars$disp~factor(mtcars$gear)*factor(mtcars$am))
summary(mtcar_aov2)

# GERNERATION OF NORMAL DISTRIBUTION

mean=75
sd=10
  # p bte 60 and 80
prob_between=pnorm(80,mean,sd) - pnorm(60,mean,sd)
prob_between
  # p above 90
pro_abov_90 = 1- pnorm(90,mean,sd)
pro_abov_90
   #simulate 1000 random selections and plot hist
scores=rnorm(1000,mean,sd)
hist(scores,main="histogrm of 1000 random test scores",xlab="Test score")

min(scores)
max(scores)


# LINEAR PROGRAMMING : MAX PROFIT
library(lpSolve)
obj.fn=c(500,450,580)
cost.mat=matrix(c(8.4,6,9.6,3,6,8,1,0,0),ncol=3,byrow=T)
cost.det=c("<=","<=","<=")
cost.rhs=c(72,40,8)
lp.solution=lp("max",obj.fn,cost.mat,cost.det,cost.rhs,compute.sens = TRUE)
lp.solution
lp.solution$solution


# GENERATION ON BINOMIAL DISTRIBUION

bino_data<-rbinom(30, size=13,prob=0.4)
summary(bino_data)

# BOOTSTRAP
library(MASS)
library(boot)
attach(Auto)
statistic=function(data, index) {
  lm.fit=lm(mpg ~ horsepower, data = data, subset = index)
  coef(lm.fit)
}
statistic(Auto, 1:392)
summary(lm(mpg ~ horsepower, data = Auto))
set.seed(123)
boot_linear=boot(Auto, statistic, 1000)
quad_statistic <- function(data, index) {
  lm.fit <- lm(mpg ~ poly(horsepower, 2), data = data, subset = index)
  coef(lm.fit)
}
set.seed(1)
boot_quad=boot(Auto, quad_statistic, 1000)
boot_quad
summary_lm_quad=summary(lm(mpg ~ poly(horsepower, 2), data = Auto))
summary_lm_quad



library(ISLR)
names(Hitters)

# 1. best subset selection

# to see variables
dim(Hitters)

sum(is.na(Hitters$Salary))

# to calculate no of missing observations
Hitters=na.omit(Hitters)  # to remove all rows that have missing values
Hitters
dim(Hitters)

library(leaps)

# to perform best subset selection on the dataset

regfit.full=regsubsets(Salary~.,data=Hitters,nvmax=19)
reg.summary=summary(regfit.full)
names(reg.summary)
reg.summary
reg.summary$rsq

reg.summary$rss

reg.summary$adjr2

reg.summary$cp

reg.summary$bic


par(mfrow=c(2,2))
plot(reg.summary$rss,xlab="number of variables",ylab="RSS", type="l")

plot(reg.summary$adjr2,xlab="number of variables",ylab="Adjusted rsq", type="l")
adjr2max= which.max(reg.summary$adjr2)

plot(reg.summary$cp,xlab="number of variables",ylab="Cp",type='l')
plot(reg.summary$bic,xlab="number of variables",ylab="BIC",type='l')

bic.min= which.min(reg.summary$bic)
bic.min  # gives which model is the best LR build on the dataset

coef(regfit.full,6)

# result : 6th model is the best fit LR build on the given dataset with Rsq 0.4972001 and bic -147.91

# logistics regression
model=mtcars[c("am","cyl","hp","wt")]
am_data = glm(formula =am~cyl+hp+wt, data= model , family = binomial)
summary(am_data)


# polynomial regression
x=c(1,2,3,4,5,6,7,8,9,10)
y=c(6,8,12,14,18,20,22,24,26,28)
xsq=x^2
xcub=x^3
plot(x,y)
fit1=lm(y~x)
abline(fit1,col="red")
fit2=lm(y~x+xsq)

xv=seq(min(x),max(x),0.01)
yv=predict(fit2,list(x=xv,xsq=xv^2))
lines(xv,yv,col="blue")
fit3=lm(y~x+xsq+xcub)
xx=seq(min(x),max(x),0.01)
yy=predict(fit3,list(x=xx,xsq=xx^2,xcub=xx^3))
lines(xx,yy,col="green")

summary(fit1)
summary(fit2)
summary(fit3)

# r2 of linear :0.9865
#r2 of quadratic :0.9954
# r2 cubic :0.9948

# logistic with prediction
library(dplyr)
summary(mtcars)

# load package
library(caTools)

# splitting data
split=sample.split(mtcars, SplitRatio = 0.8)
train_reg=subset(mtcars,split=="TRUE")
test_reg=subset(mtcars,split=="FALSE")

#training model
log_model=glm(am~wt,data=train_reg,family = "binomial")
log_model

summary(log_model)

#predict test data based on model
predict_reg= predict(log_model,test_reg,type="response")
predict_reg

# evaluating model accuracy using confusion matrix
table(test_reg$am,predict_reg>0.5)
accuracy=(5+3)/(5+3+0+1)
accuracy
