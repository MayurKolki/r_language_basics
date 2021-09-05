# ch8: Functions in R

# what is a function ?

# every function has 2 main characteristics:
# 1) input parameters
# 2) output/return statement

# parameters/input to the functions
# i) mandatory
# ii) optional / default parameters
# iii) named parameters - order

# apply functions -> specialized functions in R

# calcTotal-> name of the function that has 4 mandatory input parameters: m1,m2,m3,m4
# the return is total of m1,m2,m3,m4

calcTotal = function(m1,m2,m3,m4)
{
  mks = m1+m2+m3+m4
  
  # return the total marks to the calling program
  return(mks)
}

# call the function with the input data
# input data is all mandatory
total = calcTotal(69,75,72,90)
print(paste('total = ',total))


# how to specify an optional parameter
# by including '='sign
calcTotal2 = function(m1,m2,m3,m4,grace=5)
{
  if((m1%in%seq(31,35))|(m2%in%seq(31,35))| (m3%in%seq(31,35))|(m4%in%seq(31,35)))
    mks = m1+m2+m3+m4+grace   else
    mks = m1+m2+m3+m4
   
  return(mks)
}

mks = calcTotal2(40,40,40,31)
print(mks)
mks = calcTotal2(90,90,90,90)

# make a small change to the function (calcTotal3)
# give grace mark of 5 to every subject where the score is less than 35. 
# calculate and return the total


calcTotal3 = function(m1,m2,m3,m4,grace=5)
{
  m1 = ifelse(m1<35,m1+grace,m1)
  m2 = ifelse(m2<35,m2+grace,m2)
  m3 = ifelse(m3<35,m3+grace,m3)
  m4 = ifelse(m4<35,m4+grace,m4)
  
  return(m1+m2+m3+m4)
}

calcTotal3(31,20,34,28)


# return multiple values from a function
# return the total and the average marks

calctotal4 = function(m1,m2,m3,m4,grace=10)
{
  # give grace marks of 10 for all marks < 35
  m1 = ifelse(m1<35,m1+grace,m1)
  m2 = ifelse(m2<35,m2+grace,m2)
  m3 = ifelse(m3<35,m3+grace,m3)
  m4 = ifelse(m4<35,m4+grace,m4)
  
  # calculate the total and average values  
  total = m1+m2+m3+m4
  avg = mean(c(m1,m2,m3,m4))
  
  # to return multiple values, create a list and store variables in
  # this list; and return the list
  
  # create an empty list
  ret = list() 
  ret = append(ret,c(total,avg))
  
  return(ret)
}

# function call
ret = calcTotal4(60,60,80,80)
ret = calcTotal4(30,35,30,35) 

print(paste('Total score =', ret[1]," with an average of ", ret[2]))


# named parameters
getPrice = function(bp,oc,disc,tax)
{
  # apply discount first
  price = bp - (disc/100)*bp
  
  # apply the tax
  price = price + (tax/100)*price
  
  # add the overhead cost to the final price
  price = price + oc
  
  return(price)
}

# call the function
price = getPrice(15000,700,15,12)
print(paste("Net Price = ", price))

# this will give wrong values since the mapping of numbers and values is 1-1
price = getPrice(12,15,15000,700)
print(price)

# named parameters
price = getPrice(tax=12,disc=15,bp=15000,oc=700)
print(price)

# modify the function 'getPrice' to make the OC, disc and tax optional
# the default values for OC = 750, disc=5%, tax=12.5%
getPrice2 = function(bp,oc=750,disc=5,tax=12.5)
{
  price = bp - (disc/100)*bp
  price = price + (tax/100)*price
  price = price + oc
  return(price)
}

# check and compare the final price by
# i) taking the default values
# ii) overriding the default values

# bp 
price=getPrice2(bp=20000); price

# bp/oc
price=getPrice2(bp=20000,oc=200); price

# bp/disc
price=getPrice2(bp=20000,disc=50); price

# bp/tax
price=getPrice2(bp=20000,tax=7.5); price

# bp/oc/tax
price=getPrice2(bp=20000,tax=7.5,oc=150); price

# bp/oc/disc
price=getPrice2(bp=20000,oc=150,disc=0); price

# bp/tax/disc
price=getPrice2(bp=20000,tax=10,disc=10); price

# bp/oc/tax/disc
price=getPrice2(bp=20000,tax=5,disc=1,oc=250); price


# A3) write a function to calculate the HCF of 2 positive integers

# A4) write a function to perform a matrix arithmetic operation as follows:
# parameter 1 -> 3x3 matrix
# parameter 2 -> 3x3 matrix
# parameter 3 -> action
#   if action = "A" -> add the 2 matrices
#             = "S" -> subtract the 2 matrices
#             = "D" -> divide the 2 matrices
#             = "M" -> multiply the 2 matrices

# return the answer to the calling program

###################################################

# ch 8_1: apply functions - family of apply functions
# ---------------------------------------------------

# create a matrix of newspaper readership of 5 different newspapers across 20 cities in India.

# create the city names
city=paste("C",seq(1,20),sep="");city

# newspapers
paper=c('Telegraph','TOI','ET','Express','DNA'); paper

# create the readership data (in lacs)
total = length(city) * length(paper); total

# to recreate the same data, use the set.seed()
set.seed(1234)
count = sample(seq(7,150), total, replace=T)

# create the matrix
mx_papers=matrix(count,ncol=length(paper),
                   dimnames=list(city,paper))
print(mx_papers)

# 1) apply - rowwise

# sum of readership of all cities
apply(mx_papers,1,sum)

# find the sum of readership of all cities for the newspapers 'TOI' and 'ET'
apply(mx_papers[,c('TOI','ET')],1,sum)
apply(mx_papers[,c(2,3)],1,sum)

# find the sum of readership of all cities for the newspapers other than 'Telegraph'
apply(mx_papers[,-1],1,sum) # 1
apply(mx_papers[,2:5],1,sum) # 2

# find the sum of readership of all cities for the newspapers other than 'ET'
dimnames(mx_papers)[2]

# apply
# average readership in all cities
apply(mx_papers,1,mean)


# column-wise
# find the total readership of all newspapers in all cities
apply(mx_papers,2,sum)

# average readership of papers across cities
apply(mx_papers,2,mean)

# find the average readership of 'ET' from the cities 'C5,C6,C15,C20'


# based on a survey, it was found that there was an overall decrease of 5% in the readership of all newspapers in all cities.
# what is the new count now ?

mx_papers

# create a function that will calculate the 5% decrease
decrease = function(x) return(round(x-(0.05*x),0))

newmx = apply(mx_papers,2,decrease)

# A2) based on a survey, it was found that the newspaper readership has gone up by 2% (on an average). what is the new count ?
increase = function(x) return(  round(x+(0.02*x),0) )
newx = apply(mx_papers,2,increase)

mx_papers[1:5,]
newx[1:5,]

# based on a survey, it was found that the 'TOI' paper had an increase of 10% readership.
# what is the new count ?

increase=function(x) return( round(x+(0.1*x),0)  )

# to apply a function on a single column, first convert the data into a matrix form
apply(as.matrix(mx_papers[,'TOI']),2,increase)

################################

mx_papers[1:3,]

# 2) lapply() -> returns a list

# create a named list
l_papers = list(
              'Telegraph'= mx_papers[,1],
              'TOI'= mx_papers[,2],
              'ET'= mx_papers[,3],
              'Express'= mx_papers[,4],
              'DNA'= mx_papers[,5])
print(l_papers)

# sum of readership of all the newspapers in all cities
lapply(l_papers,sum)

# average readership
lapply(l_papers,mean)

# user-defined functions
lapply(l_papers,increase)

# returns the length of each word as a list
# input->vector; output->list
word = c('keyboard','apple','cricket','soccer','abc')
lapply(word,nchar)

# punctuation marks in R

# same result as lapply(), but different format
nchar(word)

# A4) Extract the largest words from each element of the list
mylist = list(
    c('catch','elephnat','cow','anagram','constantinople','vehicle'),
    c('photosynthesis','biology','lab','signal','code','error')
)
mylist

for(i in seq(1,length(mylist)))
{
  # get the length of each word using lapply()
  res = unlist(lapply(mylist,nchar)[i])
  
  # for each set, get the maximum value
  maxval = max(res)
  
  # for the max value, find the index
  ndx = which(maxval==res)
  
  print(paste('Element=',i,"Longest word = ", mylist[[i]][ndx]))
}

################

# 3) sapply() -> simplified output
sapply(l_papers,sum)
sapply(l_papers,mean)
sapply(l_papers,increase)

word
sapply(word,nchar)

# create a named list with different data types
list1=list("age" = sample(seq(18,80),25),
           "beta" = exp(-3:3),
           "flag" = c(T,T,T,F)   )
list1

sapply(list1, mean)

#######################

# 4) tapply() -> tabular format
# GROUP BY functionality

mx_papers

# group the paper readership based on the tier
tier = rep(c(1,2,3), c(7,8,5))

# create a new column in the matrix 'tier'
mx_papers=cbind(mx_papers,tier=tier)
mx_papers

# find the average readership of 'Telegraph' based on the tier
tapply(mx_papers[,'Telegraph'],mx_papers[,'tier'], mean)

# find the sum of readership for 'TOI'
tapply(mx_papers[,'TOI'],mx_papers[,'tier'],sum)

# tapply() can be used on a list
# create a list of marks and section 

m1=sample(seq(1,100),20)
m2=sample(seq(1,100),20)
m3=sample(seq(1,100),20)
section= rep(c('A','B','C'),c(6,7,7))

l_stud = list( 'maths'= m1,
               'hindi'=m2,
               'history'=m3,
               'section'=section)
l_stud

tapply(l_stud$maths, l_stud$section, sum)
###


## 5) rapply()
# consider a list with 2 elements
mylist = list(seq(1:20), c(41:60))
mylist

# to get the sum of the 1st and 2nd element
sum(unlist(mylist[1]))
sum(unlist(mylist[2]))

# easy way to do the same action as above
# returns a simple output
rapply(mylist,sum)

# returns in form of a list
rapply(mylist,summary,how = "list")

# A5) use the rapply() on the l_stud list to get the total marks of each subject

rapply(l_stud[1:3],sum)

# vapply()
# mapply()

paste("h","a","r","d","i","k",sep="")
#############

# 6) vapply()
mylist = list(seq(1,20), c(seq(50,100)) )
print(mylist)

# get the summary of each element in the list
summary(unlist(mylist[1]))
summary(unlist(mylist[2]))

# to get the summary of all the elements in 1 view

vapply(mylist,summary,
       FUN.VALUE = c(numeric(1), numeric(1),
                     numeric(1), numeric(1),
                     numeric(1), numeric(1) )
             )


summary(unlist(mylist[1]))


# 7) mapply() - matrix-like

v1=c(1:5); v2=c(1:5); v3=c(1:5)
v1
v2
v3
mapply(sum,v1,v2,v3)





















