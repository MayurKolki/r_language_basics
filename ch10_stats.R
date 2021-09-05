# ch10: Statistics with R

# data types

dept=c('finance','hr','rd','sales','admin')
print(dept)

# convert the vector to a factor variable
dept=as.factor(dept)
print(dept)

levels(dept)

# frequency distribution
height=floor(runif(50,90,200))
print(height[1:10])

# i) build the FD
# cut() -> specify the number of intervals for the data
fd_height = cut(height,5)
cbind(frequency=table(fd_height))

# plot the heights using a histogram
hist(height,col='yellow')

# to increase/decrease the number of intervals, use the breaks() parameter
hist(height,col='red',breaks=10)


# 2) measure of central tendency
set1 = round(runif(30,1,200),2)
set1[1:20]

# i) mean
# --------
round(mean(set1),2)

# if the data has NULLs, how to calculate the mean()
set1=c(set1,NA,NA)
set1
mean(set1)

# a) ignore the NULLs
mean(set1,na.rm = T)

# ii) weighted mean
# ------------------
# create a matrix of 6 students and 5 subjects
marks=sample(seq(1,100),30)
marks

r=stringi::stri_rand_strings(6,5,'[A-Za-z]')
c=c('hw','quiz','proj','term','final')
mx1=matrix(marks,byrow=T,ncol=length(c),
           dimnames=list(r,c))
mx1

w=c(10/100,10/100,25/100,25/100,30/100)
print(w)

# method 1
cbind(mx1,w[1]*mx1[,1] + w[2]*mx1[,2] + w[3]*mx1[,3]+w[4]*mx1[,4]+w[5]*mx1[,5])

# method 2
# w=matrix(w,nrow=length(w))
mx1 = cbind(mx1,average=(mx1%*%w))
mx1

colnames(mx1) = c(colnames(mx1)[1:5],'average')
mx1

# geometric mean
# --------------
# method 1
geomean(set1)

# since there is no na.rm() in geomean, the NA have to be removed first
set2 = set1[!is.na(set1)]
set2
geomean(set2)
mean(set2)

library(pracma)
# install.packages("pracma")

# nthroot() -> function to calculate the geometric mean

# method 2
# nthroot(multiplication of all values)

gm1 = function(vect)
{
  num = 1
  len = length(vect)
  
  for(i in seq(1,len))
    num = num * vect[i]
  
  # calculate the geometric mean
  gmean = nthroot(num,len)
  return(gmean)
}

# call the function gm1()
print(gm1(set2))


# iv) median
median(set1) # returns NA since data has null
median(set1,na.rm=T)

# v) mode
set3 = rep(c('red','blue','green','white'),c(4,9,7,5))
# shuffle the data
set3=sample(set3)
set3

# use the which() to get the maximum count
df=data.frame(cbind(value=unique(set3), count=table(set3)))
print(df)
df[which(df$count==max(df$count)),]

# method 2
df[which.max(df$count),]


## (2) Measure of dispersion / spread
# range, quartiles, variance, standard deviation

# i) range
max(set2) - min(set2)

cbind(max=max(set2), min=min(set2), range=max(set2)-min(set2))

# ii) quartiles/deciles/percentiles
quantile(set1) # gives all the 4 quartiles

# finding the individual quartiles
quantile(set2,0.25) # 1st quartile
quantile(set2,0.5)  # 2nd quartile
quantile(set2,0.75) # 3rd quartile

# find all the deciles (dividing the data into 10 parts)
# without any hardcoding
intervals = seq(.1,1,.1)
intervals

for(i in intervals)
  print(paste('decile',i*10,'value=',quantile(set2,i)))

# percentiles (data divided into 100 parts)
intervals=seq(.01,1,0.01)
intervals

for(i in intervals)
  print(paste('percentile',i*100,'value=',quantile(set1,i)))


# iii) IQR (inter-quartile range) Q3-Q1
IQR(set1)
quantile(set1,0.75) - quantile(set1,0.25)

# plot the data to identify quartiles/outliers
boxplot(set1,horizontal = T,col='green')

# add an outlier and check how it is plotted on boxplot
set1=c(set1,588.45)
boxplot(set1,col='red')


# variance and standard deviation

set1=set1[1:30]
set1

# variance
var(set1)

# standard deviation
sqrt(var(set1))
sd(set1)

## 3) Measure of Association
# -------------------------
# i) covariance and correlation

X = c(1.4,4.9,3.8,2.8)
Y = c(9,14,11,10)
# covariance
cov(X,Y)
# positive relation

# correlation
-cor(X,Y)

X = c(1.4,4.9,3.8,2.8)
Y = -c(9,14,11,10)
X
Y
cov(X,Y)
cor(X,Y)

# ii) coefficient of variance
# CoV = sigma[SD] / mu[mean]

# which stock should i buy ?
stock_a = round(runif(30,110,145),2)
stock_b = round(runif(30,45,288),2)

round(sd(stock_a) / mean(stock_a),2)
round(sd(stock_b) / mean(stock_b),2)


# rank correlation
set.seed(100)
r1=seq(1,10); r1=sample(r1); r1
r2=seq(1,10); r2=sample(r2); r2

# find the correlation between the ranks
df1=data.frame(rank1=r1,rank2=r2)
df1$diff = df1$rank1-df1$rank2
df1$diffsq = df1$diff^2
n = nrow(df1); n

num = 6*sum(df1$diffsq); num
den = n * (n*n-1); den 
rcor = round(1 - (num/den),4); rcor

# in-built function() ???
###############################################

## Distributions
# ------------->

# uniform
num = rep(0.1,10)
num
plot(num)

# random numbers for normal distribution
num2 = rnorm(1000)
num2
hist(num2)
# as the sample size increases, the distribution becomes normal

# random numbers for normal dist. with mean/sd
num3=rnorm(500,mean=97,sd=1.3)
print(num3)
hist(num3,breaks=15)

# binomial distribution
# there are 5 sample products. what is the probability of selecting exactly 1 defective product; given that the rate of defect is 25%

trials=5; p=0.25; s=1
dbinom(s,trials,p)

# A1) what is the probability that 0-5 products are defective?
s=seq(0,5)
probs=c()
for(x in s)
{
  pr = round(dbinom(x,trials,p),3)
  print(paste('probability that',x,'product is defective is',pr))
  probs=append(probs,pr)
}

barplot(probs,col='blue',xlab='success',ylab='probabilitiy')

# poisson distribution

# during a 20-minute interval, the average number of vehicles crossing a bridge is 10.
# what is the probability that exactly 'n' vehiclses will cross the bridge? n>=0

x=2
avg=10
ppois(x,lambda=avg)
# probability that exactly 2 cars will cross the bridge

s=seq(0,30); s
probs=c()
for(x in s)
{
  pr=dpois(x,lambda=avg)
  print(paste('probability that',x,'cars will cross :',pr))
  probs=append(probs,pr)
}
barplot(probs)


# hypothesis testing

# z-score = > (x-mu)/sd
X=2.39;mu = 0; sd=1
z = (X-mu) / sd
print(z)

# given the Z-score, find the area under curve
pnorm(z)

# ex:1 -> find the prob that a randomly selected thermometer will have a reading of < 1.58 deg given that mu=0; sd=1
X=1.58; mu=0; sd=1
z = (X-mu)/sd; z 
pnorm(z)

# to plot the area under curve for the given Z
# install.packages("visualize")

library(visualize)

# area to the left (< 1.58)
visualize.norm(z)

# ex:2 -> find the prob. that a randomly selected thermometer will have a reading of greater than -1.23 degrees. Given mu=0,sd=1
X=-1.23; mu=0; sd=1
z=(X-mu)/sd; z
visualize.norm(z,section="upper")

# ex:3 -> find the prob. that a thermometer will have a reading between -2 and 1.5
z1 = -2; z2 = 1.5
pnorm(z1)
pnorm(z2)

# area in between -2 and 1.5
pnorm(z2) - pnorm(z1)

# visualise the plot
visualize.norm(c(-2,1.5),section="bounded")


# given a probability, find the z-score
alpha = 0.05
abs(qnorm(alpha))

alpha=alpha/2
abs(qnorm(alpha))

### 
# 1-sample test for proportions
# tstat = (phat - p) / sqrt(p.q)/sqrt(n)

oneSampleTest_prop=function(n,phat,p,alpha=0.05)
{
  q = 1 - p
  num = phat - p
  den = sqrt(p*q)/sqrt(n)
  
  tstat = num/den
  
  zref = abs(qnorm(alpha))
  
  if(tstat > zref)
    msg = paste("tstat=",tstat,"zref=",zref," Reject H0") else
    msg = paste("tstat=",tstat,"zref=",zref,"Fail to Reject H0")
  
  return(msg)
}

# A sample of 706 companies found that 61% of CEO's were male. 
# Test the hypothesis that the claim ( Most CEO's are males) is appropriate.
# Take significance level (alpha) as 0.05

# H0: p = 0.5
# H1: p > 0.5

n=706;p=0.5;phat=0.61 

oneSampleTest_prop(n=n,p=p,phat=phat)


# 1-sample test for means
# tstat = (xbar-mu)/sd/sqrt(n)

oneSampleTest_means=function(n,xbar,mu,sd,alpha=0.05)
{
  num = xbar - mu
  den = sd/sqrt(n)
  tstat = round(abs(num/den),3)
  
  zref = round(abs(qnorm(alpha)),3)
  
  if(tstat > zref)
    msg = paste("tstat=",tstat,"zref=",zref," Reject H0") else
      msg = paste("tstat=",tstat,"zref=",zref,"Fail to Reject H0")
  
  return(msg)
}

# A sample of 40 sales receipts from a supermarket store has mean of Rs.1,410. The standard deviation of the sales is Rs. 302. Use these values to test whether or not the mean sales at the grocery store are different from Rs.1,500. 
# Choose alpha = 5%. 

n=40; xbar=1410; sd=302; 
# H0: mu = 1500
# H1: mu <> 1500
# 2-sample test
alpha = 0.05/2
mu = 1500

oneSampleTest_means(n=n,mu=mu,sd=sd,xbar=xbar,alpha=alpha)
# conclusion: cannot say with surety if the sale is 1500

# Will your answer change if you choose alpha = 10%?
alpha = (10/100)/2; alpha
oneSampleTest_means(n=n,mu=mu,sd=sd,xbar=xbar,alpha=alpha)
# conclusion: mean is different from 1500


# 2-sample test for prop
twoSampleTest_prop=function(s1,s2,alpha=0.05)
{
  n1=s1[1]; x1=s1[2]; p1=s1[3]; 
  n2=s2[1]; x2 = s2[2]; p2=s2[3]; 
  
  num = p1-p2
  Pbar = (x1+x2)/ (n1+n2)
  Qbar = 1-Pbar

  den = sqrt( Pbar*Qbar* ((1/n1)+(1/n2)) )
  
  tstat = abs(num / den)

  zref = round(abs(qnorm(alpha)),3)
  
  if(tstat > zref)
    msg = paste("tstat=",tstat,"zref=",zref," Reject H0") else
      msg = paste("tstat=",tstat,"zref=",zref,"Fail to Reject H0")
  
  return(msg)
}

# In a random sample of 800 people from rural area, 200 were found to be smokers. 
# From 1000 people from urban, 350 were smokers. 

# Test whether the proportion of smokers is same for both the populations 

# H0: sample prop are equal
# H1: sample prop are not equal
# 2-tail test
alpha = 0.05/2

n1=800; x1=200; p1 = x1/n1
n2=1000; x2=350; p2 = x2/n2

s1 = c(n1,x1,p1)
s2 = c(n2,x2,p2)

twoSampleTest_prop(s1=s1,s2=s2,alpha=alpha)


# 2-sample test for means
# assumption: variances are different

twoSampleTest_means=function(s1,s2,d0=0,alpha=0.05,vari="same")
{
  x1bar = s1[1]; sd1 = s1[2]; n1 = s1[3]
  x2bar = s2[1]; sd2 = s2[2]; n2 = s2[3]
  
  # numerator
  num = x1bar-x2bar-d0
  
  # variance is same
  if(var=="same")
  {
    sp = sqrt( ((n1-1)*sd1^2 + (n2-1)*sd2^2 ) / (n1-n2-2))
    den = sp * sqrt( (1/n1)+(1/n2))
  }
  else
  # when variance is not the same
  {
    # denominator
    den = sqrt( (sd1^2/n1) + (sd2^2/n2))
  }
  
  tstat = round(abs(num/den),3)

  zref = round(abs(qnorm(alpha)),3)
  
  if(tstat > zref)
    msg = paste("tstat=",tstat,"zref=",zref," Reject H0") else
      msg = paste("tstat=",tstat,"zref=",zref,"Fail to Reject H0")
  
  return(msg)
}  

# A trace element in blood sample varies by 14.1 and 9.5 ppm in males and females respectively. Random samples of 75 male and 50 females gives a mean of 28 and 33 ppm. 

# What is the likelihood that the population means of the concentrations of elements are same for both ? Test the significance at 95% Confidence level.
# c(mean,sd,n)

s1 = c(28,14.1,75)
s2 = c(33,9.5,50)
alpha=0.05/2

twoSampleTest_means(s1=s1,s2=s2,alpha=alpha)


# The data set contains miles per gallon for U.S. cars (sample 1) and for Japanese cars (sample 2). The summary statistics for each sample are shown below. 

# SAMPLE 1: Observations = 249  Mean = 20.14458  SD = 6.41470
# SAMPLE 2: Observations =  79  Mean = 30.48101  SD = 6.10771

# Test the hypothesis that the population means are equal for the two samples. 

# We assume that the variances for the two samples are equal.

twoSampleTest_means()



# anova
# chi-square





















































































































