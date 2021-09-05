#iii) calculate the average and total rainfall for each month for all the 3 districts
rdata=c(0,33.634,0,10.863,65.732,303.553,197.565,419.547,109.193,69.274,4.309,0.548,0.001,30.855,0,17.432,44.012,91.709,93.81,150.554,124.983,163.897,57.556,18.016,
        0.008,29.256,0,40.611,59.111,94.714,98.985,171.999,163.666,216.036,33.587,18.4950)
print(rdata)

length(rdata)

rdata1=matrix(rdata,ncol=3)
print(rdata1)

cols=c('district1','district2','district3')
rows=c('jan','feb','mar','apr','may','jun','july','aug','sep','oct','nov','dec')

rdata2=matrix(rdata,ncol=3,
              byrow=T,
              dimnames=list(rows,cols)
)

print(rdata1)
print(rdata2)

rdata2=cbind(rdata2,sum= apply(rdata2,1,sum))
apply(rdata2,2,sum)
rdata2=cbind(rdata2,avg= apply(rdata2,1,mean))
apply(rdata2,2,mean)

rdata2=colnames([1:3],sum,avg)

#################################
spcl=c('!','@','#','$','%','&','*')
print(spcl)
totalrows = length(spcl)

ss = sample(seq(1,totalrows),5)
q=spcl[ss]
q


paswd = stringi::stri_rand_strings(100,5,"[A-Za-z0-9]")
paswd

s=cbind(paswd,q)
s



###########################################################################
record = "19498~ashish~M~23~MTech~10-Jun"
strsplit(record,"~",fixed=T)
strsplit(record,"~")

record = "19498+ashish+M+23+MTech+10-Jun"
strsplit(record,"+")
strsplit(record,"+",fixed=T)

# generate random strings
# stri_rand_strings() -> 3 parameters
# i) how many strings to generate
# ii) length of the string
# iii) source for the string
# install.packages("stringr")
# install.packages("stringi")
 library(stringi)

library(stringr)



# generate 10 password of length 7
# password must contain uppercase, lowercase and numbers
pwd = stri_rand_strings(10, 7, "[A-Z0-9a-z]")
print(pwd)
###############################
# ch4: Lists

# unnamed list
clr1 = list('r','g','b')
print(clr1)

# access the unnamed list
clr1[1] # 1st element
clr1[1:2] # range of elements

length(clr1) # total number of elements

# named list
clr2 = list('primary' = 'red','green','blue')
print(clr2)

# access the named list
clr2[1]
clr2$primary[1]

# add new elements
#   a) at any position
#   b) always at the end
# change existing elements
# remove elements

# unnamed
educ1=list('school','highschool','college','pg','dr')
print(educ1)

# named
educ2=list('education'='school','highschool','college','pg','dr')
print(educ2)

# get data from the list of any sequence
educ1[seq(1,5,2)]
educ1[c(1,2,5)]

# A1) create a list having names of months
# extract months in even positions;store it in a list -> even_months
# extract months in odd positions;store it in a list -> odd_months

months=list('jan','feb','mar','apr','may','jun','jul','aug','sep','oct','nov','dec')
print(months)

even_months = months[seq(2,length(months),2)]
odd_months = months[seq(1,length(months),2)]
print(even_months)
print(odd_months)

# converting a list into a vector
vmonths = unlist(months)
print(vmonths)

# sorting a list
sort(months) # cannot sort a list directly

# convert list to vector and then sort the vector
sort(unlist(months))

# to store the sorted vector into a new list
s_months = as.list(sort(unlist(months)))
print(s_months)

# list can contain multiple data types

# create a list containing 5 elements having data types as:
# string,string,integer,float,boolean

hetero_list = list('sriram', # element 1
                   'trainer', # element 2
                   seq(1:5), # element 3
                   round(runif(5,10,25),2), # element 4
                   TRUE # element 5
)
print(hetero_list)

hetero_list[1]
hetero_list[4]

# how to get the 3rd element from the 4th element of the list?
hetero_list[[4]][3]

# convert the hetero_list into a named list
hetero_list = list(
  'name' = 'sriram', 
  'profession' = 'trainer',
  'rank' = seq(1:5),
  'average' = round(runif(5,10,25),2),
  'flag' = TRUE
)

print(hetero_list)

# how to get the 3rd value of average' ?
hetero_list$average[3]

# to get the names of the list
names(hetero_list)

##

length(months)

# add new elements to a list

# method 1)
# add 2 new values 'monthA' and 'monthB' to the list
months = append(months,c('monthA','monthB'))
length(months)
print(months)

# method 2)
# append value 'monthC' to the list
months[length(months)+1] = "monthC"
length(months)
print(months)

# method 3)
# add a new value at a specific location
unlist(months)

# add a new value 'monthD' between 'apr' and 'may'
months = append(months,'monthD',after=which(months=='apr')) 
# other option direct puting value
months = append(months,'monthD',after=4)
unlist(months)

print(months)

# difference between grep() and which()
# eg: find the index position of 'nov'
which(months=='nov')
months[12]

unlist(months)
# get the values that have the string 'month' in them
months[grep('month',months)]

# A1) add a new value 'month-1' as the first element
# A2) add a new value 'month-2' in before August
months=append(months,'month-1',after=0)
months=append(months,'month-2',after=which(months=='aug')-1)

# change values of elements of a list
unlist(months)
months[2] = 'january'
unlist(months)

# change 'sep' to 'september'
months[which(months=='sep')] = 'september'
unlist(months)

# remove elements from list
# remove 'monthB'
months[which(months=='monthB')] = NULL
unlist(months)

# remove the value 'month-2'
unlist(months)

# remove all the values that have 'month' in them
pos = grep('month',months)
pos
months[pos] = NULL

unlist(months)

# dealing with duplicate values in list
months=append(months,c('feb','feb'))
which(months=='feb')
months=unique(months)
unlist(months)

# nested lists / list of lists

# element 1 -> education
# element 2 -> year of passing
# element 3 -> gpa
# element 4 -> city

myEdu = list(
  "eductype"=list('school','highschool','grad','postgrad'),
  "year"=list(1989,1991,1994,2015),
  "gpa"=list(4.8,4.2,4.1,4.9),
  "city"=list('pune','kolkata','chennai','mumbai')
)
print(myEdu)

# education type
myEdu[1]
myEdu$eductype
myEdu$eductype[1] # first value of 'education type'

# A3) print the education details in the following format:

# 1) Passed college in 1994 with a gpa of 4.1
paste('passed college in',myEdu$year[3],'with a gpa of',myEdu$gpa[3] )

# 2) postgrad from mumbai in 2015
paste(myEdu$eductype[4],'from',myEdu$city[4],'in',myEdu$year[4])


names(myEdu)
# add a new element with a list of values -eg: add 'instname' with 4 values
myEdu[['instname']]=list('lawrence school','hindu school','xaviers','aegis')

print(myEdu)
myEdu$instname

# to change the value of 'xaviers' to 'st xaviers'
myEdu$instname[3] = 'st.xaviers'
myEdu$instname

# change the name of the list
names(myEdu)
names(myEdu)[3] = "GPA"
names(myEdu)

# merge 2 lists
lst1=list(1,5,8,10)
lst2=list(20,45,19)
print(lst1)
print(lst2)

# merging lst1 and lst2 into a new list lst3
lst3=c(lst1,lst2)
print(lst3)

# pre-defined list in R
list(month.abb)
month.name
list(month.abb)
as.list(month.abb)

#################################

# assignments

# 1) create a list with names of colors of the rainbow
vibgyor

# 2) add 2 new colours 'black' and 'white' to the list
append()

# 3) add colour 'wine red' before 'green'
append(, after=which()-1)

# 4) alter the value of 'blue' to 'sky blue'
lst[which(blue)] = <>
  
  # 5) check if the colour 'pink' exists in the list
  grep('pink')
which('pink')

# 6) create a nested list as follows:
# element 1: 6 country names
# element 2: respective capitals
# element 3: currency of the countries
# element 4: continent to which the country belongs

data1 = list(
  'country'=list(),
  'capital'=list(),
  .... )

# 6.1) To the above nested list, add a new element, 
# element 5: head of state(name of PM,president etc)

data1[['headofstate']]=list()

# 7) create a list having data of diff data types as follows:
# element 1 -> 5 random names; each name with length of 10
# element 2 -> 20 random integers
# element 3 -> 15 random float numbers with 1-decimal precision
# element 4 -> sequence ['a','b','c'] repeated 3 times

library(stringi)

lst1 = list(
  stri_rand_strings(),
  sample(seq(10,200),20),
  round(runif(15,15,30),1),
  rep() )
# tomorrow: matrix / arrays

########################################################

# ch5: matrix

score=sample(seq(1,100),20)
print(score)
length(score)

# convert the above vector into a 2-d obj
# R *  C   = total
# 1 *  20  = 20
# 2 *  10  = 20
# 4 *  5   = 20
# 5 *  4   = 20
# 10 * 2   = 20
# 20 * 1   = 20
# rows and columns represent dimensions

# to create matrix,
# i) data
# ii) rows OR columns
# iii) dimension names (optional)
# iv) order of creation - R/C

# by default, values are filled 'columnwise'
mxscore1=matrix(score,ncol=4)
print(mxscore1)

# create matrix with the foll:
# i) give names to rows/columns
# ii) fill the data 'row-wise'

cols=c('match1','match2','match3','match4')
rows=c('rohit','virat','saun','kartik','joe')

mxscore2=matrix(score,ncol=4,
                byrow=T,
                dimnames=list(rows,cols)
)

print(mxscore1)
print(mxscore2)
print(score)

# transpose a matrix
# converting R->C and C->R
mxscore1 = t(mxscore2)
print(mxscore1)
print(mxscore2)

# dimensions
dim(mxscore1)

# total elements
length(mxscore1)

# A1)
# create a matrix of marks obtained by 10 students in a class in 5 subjects.
# marks range from 1-50
# subjects are: maths,science,arts,english,history
# student names can be left blank or you can generate random names
# fill the data row-wise


# why 'by-row' important ?

# inventory data:
cols=c('itemcode','itemname','qty','rate','avail')
rows=c()
items=c(47900940,'color tv',19,93949,'Y',
        3934991,'fridge',399,39491,'N',
        888192,'musicplayer',10,165656,'Y')

# create the matrix
# wrong format
mx1=matrix(items,ncol=length(cols),
           dimnames=list(rows,cols))
print(mx1)

# right format
mx1=matrix(items,ncol=length(cols),
           byrow=T, dimnames=list(rows,cols))
mx1

# access the matrix - using the index pos for R,C
mxscore1[1] # r=1,c=1
mxscore1[1,] # first row
mxscore1[1:2] # first 2 rows
mxscore1[,1] # r=all, first column
mxscore1[,1:2] # r=all, first 2 columns
mxscore1[1:2,3:4] # r=1-2, c=3-4
mxscore1[c(1,3),c(1,3,5)] # r=1and3,c=1,3,5

# change value in a matrix
print(mxscore1)
mxscore1[1,1] = 17

mxscore1[4,]=0 # all columns in 4th row=0
print(mxscore1)

# matrix arithmetic
n1=sample(seq(1,20),6)
n2=sample(seq(51,70),6)
mx1=matrix(n1,ncol=2)
mx2=matrix(n2,ncol=2)
mx1
mx2

# arithmetic operations - element-wise
mx1+mx2 # addition
abs(mx1-mx2) # subtraction
mx1*mx2 # multiplication
round(mx1/mx2,3) # division

# for arithmetic ops, dimensions must be same
# else, there will be an error
mx2=matrix(n2,ncol=2)
mx1=matrix(n1,ncol=3)
mx1
mx2
mx1+mx2

# diagonal of a matrix
n1=sample(seq(1,20),16)
mx1=matrix(n1,ncol=4)
mx1
diag(mx1)

# changing the dimension of an existing matrix
dim(mx1)

# change 4,4 to a 2,8 dimension
mx1=matrix(mx1,ncol=8)
print(mx1)
dim(mx1)

# operations on a matrix
mxscore1

## 1) row-wise
apply(mxscore1,1,sum)

# total for the first and second match
apply(mxscore1,2,sum)[1]
apply(mxscore1,1,sum)[2]

# maximum of the scores
max(apply(mxscore1,1,sum))

# match-wise average scores
apply(mxscore1,1,mean)

# match-wise median scores
apply(mxscore1,1,median)

## 2) column-wise
mxscore1
apply(mxscore1,2,sum) # total of each player

# which player scored max runs
max(apply(mxscore1,2,sum))

# average score
apply(mxscore1,2,mean)

# lowest average
min(apply(mxscore1,2,mean))

# A3) total score = <>, average = <> for player='kartik'
print(paste('Kartik: Total score=',
            apply(mxscore1,2,sum)[4],
            'Average=',
            apply(mxscore1,2,mean)[4]))


## matrix multiplication
v1=c(32,37,48,45,14,10)
mx1=matrix(v1,ncol=3,byrow=T); mx1
v1=seq(1:3); v1
mx1%*%v1
32*1 + 37*2 + 48*3
45*1 + 14*2 + 10*3


# adding new columns to matrix
# adding new rows to matrix

# create a matrix to store the average stock prices of a company for the 4 quarters for the years 2001-2010
# take price range from 105 - 775 with a 1 decimal precision

cols=c('Q1','Q2','Q3','Q4');cols
rows=seq(2001,2010); rows
total = length(rows) * length(cols); total
prices = round(runif(total,105,775),1)

stock=matrix(prices,
             ncol=length(cols),
             dimnames=list(rows,cols)
)
print(stock)

# add 2 new columns to the matrix
# high,low price for each year

lowp=round(runif(length(rows),90,140),1)
highp=round(runif(length(rows),600,1000),1)

lowp
highp

length(lowp)
length(highp)
stock

# column binding - to add new columns to matrix
stock = cbind(stock,low=lowp,high=highp)
print(stock)

# A4) create a new column 'tot_st_traded'
# measured in thousands
# range -> 1000-2500

tr=sample(seq(1000,2500),length(rows))

stock = cbind(stock,tot_st_tr=tr)
print(stock)
###################################################

# ch6: array

sem = 4
stud = stringi::stri_rand_strings(20,3,"[A-Za-z]")
sub = c('Math','DS','PM','Lang')

marks=sample(seq(1,100), 
             sem*length(stud)*length(sub),
             replace=T)
length(marks)

# lengths
lenrow = length(stud); lenrow
lencol = length(sub); lencol

# array -> 
# p1 -> data
# p2 -> dimension of each line
# p3 -> dimension names

arrstud=array(marks, 
              dim=c(lenrow,lencol,sem),
              dimnames=list(stud,sub))
print(arrstud)

# dimension of the array
dim(arrstud)

# total elements in the array
length(arrstud)

# first sememster data
# ,,1 -> all rows, all columns, 1st line
sem1 = arrstud[,,1]
sem2 = arrstud[,,2]

print(sem1)
print(sem2)

# sememster 1 total marks of all students
apply(arrstud[,,1],1,sum)
sem1

# A1) for semester1, calculate the total and average marks of each student; and append it into the matrix sem1

# expected output
#  math  ds  pm   lang   total   avg
# 1 67    45  98   46      250     64.1

print(sem1)

sem1=cbind(sem1,
           total=apply(sem1,1,sum),
           average=apply(sem1,1,mean) )
print(sem1)

#####################################################

# ch6: Programming constructs

# to verify whether a candidate has qualified for a given test or not

# qualification criteria is: score should be more than 55

score = 89
print(score)

if(score > 55)
  print("qualified") else
    print("not qualified")


# what are conditions ?
# check(s) to perform against a variable
# condition can be 1 or more than 1

# types of conditions
# == equal to
# > greater than
# < less than
# != not equal to

# equal to ==
# = --> assignment operator
age=30; name='sriram'; status='complete'
flag=T

# == -> check for equal
# check if the customer's product has been dispatched or not

shipped = "awaiting"
print(shipped)

if(shipped == "yes")
  print("product has been dispatched") else
    print("product not dispatched")

# A1)
# check if a positive integer number is divisible by 6
num=36
if(num%%6==0)
  print('divisible by 6') else
    print('not divisible by 6')

# the message should be 'product dispatched'
library(stringr)
shipped = "YEs  "

# convert the value into lowercase and remove the spaces
shipped = (tolower(str_trim(shipped)))

print(shipped)

if(shipped == "yes")
  print("product has been dispatched") else
    print("product not dispatched")


# greater than
# s1) A good quality product is one where the quality index score is more than 95 
score=78

if(score > 95)
  print('good quality product') else
    print('not a good quality product')

# s2) a good quality product is one where the quality index score is at least 95
# condition: greater than or equal to
score=95
if(score >= 95)
  print('good quality product') else
    print('not a good quality product')


# A1)
# create a vector of day temperatures for the month of october between 25-35 with a 1 decimal precision
# print message 'warm month' if the average temperature is atleast 28degress. else print 'pleasant month'

# less than < 
# less than or equal to <=
# if the quality index score is below 95; then it is a bad quality product; else good
score = 98.4

if(score < 95)
  print('bad quality') else
    print('good quality')

# if the quality index score is 95 or less; then it is a bad quality product; else good
score = 99

if(score <=95)
  print('bad quality') else
    print('good quality')

# not equal to !=
# check if a job has been completed or not

status = 'in-progress'
status = 'complete'

if (status != 'complete')
  print('job not done') else
    print('job is complete')
##########################################################







##################################################
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
ctotal = calcTotal(69,75,72,90)
print(paste('total = ',ctotal))


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
ret = calctotal4(60,60,80,80)
ret = calctotal4(30,35,30,35) 

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
aa=apply(mx_papers[5:20,3:4],2,mean)
aa
ab=aa[1]
ab

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
##############################################

# ch9: Dataframes

# dataframes can be 
# i) created and saved as .CSV (or any other format)
# ii) read a CSV (or any other format) and convert to DF

# problem: create 200 telecom customers
# to create a dataframe with the following schema:

# 1) customer ID (integer, random, [6 digits])
# 2) customer name (string, random)
# 3) age (integer, [18-80])
# 4) gender (string, ['M','F'])
# 5) email (string, [conditional])
# 6) phone (integer, random, [10 digits])
# 7) mobileplan (string, [lov])
# 8) call duration (integer, [1,3600])
# 9) net usage (float, [1,10])
# 10) bill amount (float, [calculated])
# 11) itemised billing (string, ['Y','N'])
# 12) complaints (integer, [0,-10])


# generate the data

generateData = function(n)
{
  # numeric data
  custid = sample(seq(100000,999999),n,replace=F)
  age = sample(seq(18,80),n,replace=T)
  phone = runif(n,6000000000,9999999999)
  duration = sample(seq(1,3600),n,replace=T)
  netuse = round(runif(n,1,10),1)
  billamt = round((duration*50 + netuse*25)/100,2)
  compl = sample(seq(0,10),n,replace=T)
  
  # string data
  name = stringi::stri_rand_strings(n,5,"[A-Za-z]")
  
  # email - customername + domain
  # plan - [list of plans; select any 1]
  # gender - ['M', 'F'; select any 1]
  # itembill - ['Y', 'N' : select any 1]
  
  # email domain
  domain=c('@yahoo.com','@gmail.com','@hotmail.com', '@mycompany.in',
           '@myoffice.co.in','@office.com','@mycollege.edu.in','@college.com')
  
  # mobile plans
  mobileplans = c('WKD500','WEND250','AW1010','STPL100','TVL2500','GEN225')
  
  # placeholders
  email=c(); plan=c(); gender=c(); itembill=c()
  
  # generate the string data
  for(n in name)
  {
    # generate the email --> name + domain
    rnd = sample(seq(1,length(domain)), 1)
    dom = domain[rnd]
    email = append(email, paste(n,dom,sep=""))
    
    # mobile plan
    rnd = sample(seq(1,length(mobileplans)),1)
    plan = append(plan, mobileplans[rnd])
    
    # generate 'gender' and 'itemised billing'
    # generate a random number
    
    # gender
    rnd = sample(seq(1,10),1)
    if(rnd%%2==0)
      gender = append(gender,"F") else
        gender = append(gender,"M")
    
    # itemised billing
    rnd = sample(seq(1,25),1)
    if(rnd%%2!= 0)
      itembill = append(itembill,"N") else
        itembill = append(itembill,"Y")
  }
  
  # create the data frame
  df=data.frame(custid,name,age,phone,duration,netuse,
                billamt,compl,email,plan,gender,itembill)
  
  return(df)
}

# create the data
customer = generateData(5)

print(customer)

#####################################################################

# ch9: Dataframes

# dataframes can be 
# i) created and saved as .CSV (or any other format)
# ii) read a CSV (or any other format) and convert to DF

# problem: create 200 telecom customers
# to create a dataframe with the following schema:

# 1) customer ID (integer, random, [6 digits])
# 2) customer name (string, random)
# 3) age (integer, [18-80])
# 4) gender (string, ['M','F'])
# 5) email (string, [conditional])
# 6) phone (integer, random, [10 digits])
# 7) mobileplan (string, [lov])
# 8) call duration (integer, [1,3600])
# 9) net usage (float, [1,10])
# 10) bill amount (float, [calculated])
# 11) itemised billing (string, ['Y','N'])
# 12) complaints (integer, [0,-10])


# generate the data

set.seed(455)

generateData = function(n)
{
  # numeric data
  custid = sample(seq(100000,999999),n,replace=F)
  age = sample(seq(18,80),n,replace=T)
  phone = runif(n,6000000000,9999999999)
  duration = sample(seq(1,3600),n,replace=T)
  netuse = round(runif(n,1,10),1)
  billamt = round((duration*50 + netuse*25)/100,2)
  compl = sample(seq(0,10),n,replace=T)
  
  # string data
  name = stringi::stri_rand_strings(n,5,"[A-Za-z]")
  
  # email - customername + domain
  # plan - [list of plans; select any 1]
  # gender - ['M', 'F'; select any 1]
  # itembill - ['Y', 'N' : select any 1]
  
  # email domain
  domain=c('@yahoo.com','@gmail.com','@hotmail.com', '@mycompany.in',
           '@myoffice.co.in','@office.com','@mycollege.edu.in','@college.com')
  
  # mobile plans
  mobileplans = c('WKD500','WEND250','AW1010','STPL100','TVL2500','GEN225')
  
  # placeholders
  email=c(); plan=c(); gender=c(); itembill=c()
  
  # generate the string data
  for(n in name)
  {
    # generate the email --> name + domain
    rnd = sample(seq(1,length(domain)), 1)
    dom = domain[rnd]
    email = append(email, paste(n,dom,sep=""))
    
    # mobile plan
    rnd = sample(seq(1,length(mobileplans)),1)
    plan = append(plan, mobileplans[rnd])
    
    # generate 'gender' and 'itemised billing'
    # generate a random number
    
    # gender
    rnd = sample(seq(1,10),1)
    if(rnd%%2==0)
      gender = append(gender,"F") else
        gender = append(gender,"M")
    
    # itemised billing
    rnd = sample(seq(1,25),1)
    if(rnd%%2!= 0)
      itembill = append(itembill,"N") else
        itembill = append(itembill,"Y")
  }
  
  # create the data frame
  df=data.frame(custid,name,age,phone,duration,netuse,
                billamt,compl,email,plan,gender,itembill)
  
  return(df)
}

set.seed(455)
# create the data
customer = generateData(500)

print(customer)

#  dataframe operations

# view the data
View(customer)

# dimension of the dataframe
dim(customer)

# total rows
nrow(customer)

# get the column names
colnames(customer)

# total columns
ncol(customer)

# write the dataframe into a file (.CSV format)
write.csv(customer,"myTelecomCustomers.csv",row.names=F)

# file location - in the default working directory
getwd()

###########################################################

# read the input file (.CSV file) and convert it to dataframe

customer = read.csv("myTelecomCustomers.csv", header=T)
View(customer)

dim(customer)

nrow(customer)
ncol(customer)
colnames(customer)

# view the data
print(customer)
View(customer)

# get the top 'n' records
head(customer,3)

# get the last 'n' records
tail(customer,4)

# structure of the dataset
str(customer)

# referring to a column in DF
# use the $ after the dataframe name

# convert columns 'gender','itembill','plan' to factors/categories

customer$gender=as.factor(customer$gender)
customer$itembill=as.factor(customer$itembill)
customer$plan=as.factor(customer$plan)
str(customer)

# summarise the dataset
summary(customer)

# EDA - exploratory data analysis

# split and analyse the data types

# numeric data
# factor data

# get all the numeric cols
numc = colnames(customer)[sapply(customer,is.numeric)]
print(numc)

# get all the factor cols
factc=colnames(customer)[sapply(customer,is.factor)]
print(factc)
a=length(customer)
b=length(numc)
c=length(factc)
d=a-(b+c)
# summarise the numeric columns
summary(customer[numc])

# summarise the factor columns
summary(customer[factc])


###
# typical operations on a dataset
# i) add new rows and columns
# ii) modify data
# iii) drop/delete data
# iv) query the dataset - selecting specific records from the dataset

# add new columns to a dataset

View(customer)

# add the following columns:
# 1) customer_since -> (months)
# 2) privilege customer -> (Y or N)

# get the total number of records
totalrows = nrow(customer)

# generate sample data for 'cust since'
since=sample(seq(1,300),totalrows,replace = T)
customer$cust_since = since

# privilege 
customer$priv = ''

# A1) create a new column 'credit limit'
# formula to calculate credit_limit is:
# cr_limit = billamt + 20% of billamt

customer$cr_limit=customer$billamt + (0.2*customer$billamt)

# by default, a new column is always added at the end.

# cols can be rearranged later in the appropriate sequence, if required

# print all the column names to check
colnames(customer)

# to remove columns from a dataframe
# create 2 dummy columns
customer$alpha=1
customer$beta=2
colnames(customer)

customer$alpha=NULL
customer$beta=NULL
colnames(customer)

# rearrange the column names

# create the sequence of columns in the right order
cols = c('custid','name','age','gender','phone','email',
         'plan','duration','netuse','billamt','itembill','cr_limit',
         'compl','cust_since','priv')

# rearrange the columns
customer = customer[cols]
colnames(customer)

# query the dataset

# 1) get all rows and columns
print(customer)
View(customer)

# 2) get all the customer's personal info..
# custid, name, gender,age,email,phone

customer[,c('custid','name','gender','age','email','phone')]

# to get an XL-like view
View(customer[,c('custid','name','gender','age','email','phone')])

# 2nd way of writing a query
cols=c('custid','name','gender','age','email','phone')
customer[cols]
View(customer[cols])

# 3) get the plan and billing details of all customers
colnames(customer)

cols=c('plan','duration','netuse','billamt','cr_limit','itembill')
View(customer[cols])


# 4) select customer ID and cust_since columns only
cols=c('custid','cust_since')
View(customer[cols])

# 5) fetch all customer id, cust_since along with the gender
cols=c('custid','gender','cust_since')
View(customer[,cols])

# 6) get all customers, gender and the number of complaints they have registered

cols=c('custid','gender','compl')
View(customer[cols])

# II) conditional statements
# 1) get all senior citizen customer information
# age > 60

cols=c('custid','age','plan','billamt')
# method 1
View(customer[cols][customer$age>=60,])

# method 2
View(customer[customer$age>=60,cols])

# 2) get customers who have opted for itemised billing
cols=c('custid','name','itembill')
View(customer[customer$itembill=="Y", cols])


# III) Multiple conditions
# 1) find out all male customers who have a high billing
# high billing = amount > 1500
cols=c('custid','name','gender','billamt')
View(customer[(customer$gender=="M") & (customer$billamt>1500), cols])

# 2) get customer info who are with the company for more than 200 days and have complaints more than 5
cols=c('custid','name','gender','cust_since','compl')
View(customer[(customer$cust_since>200) & (customer$compl>5), cols])

# 3) get customer info who have the plan 'wkd500' and have not opted for itemised billing
cols=c('custid','name','plan','itembill')
View(customer[(customer$plan=="WKD500") & (customer$itembill=="N"),cols ])

# III) OR
View(customer)

# get all customers who have either bill amount more than 1500 or net usage more than 5 GB
cols=c('custid','name','billamt','netuse','gender')
View(customer[(customer$billamt>1500) | (customer$netuse>5),cols])

# IV) NOT operator !=
# get all info of customers who have a plan which is not 'tvl2500'
cols=c('custid','name','plan')
View(customer[customer$plan!='TVL2500', cols])

# making subsets / slicing of datasets
tvl2500 = customer[customer$plan=='TVL2500', ]
View(tvl2500)
nrow(tvl2500)
colnames(tvl2500)
dim(tvl2500)

# sort the dataset
# ascending sort (default sort order)
View(tvl2500[order(tvl2500$custid),])

# descending sort
View(tvl2500[order(tvl2500$custid,decreasing = T),])

# sort on multiple columns eg: gender+age
View(tvl2500[order(tvl2500$gender,tvl2500$age),])


# IV) modify the data
# change the customer name to an appropriate name
customer$name[customer$custid==339622] = 'sriraman'
# verify the change
customer$name[customer$custid==339622]
customer$name[customer$custid==933024] = 'Rajesh'

# to fill the column 'privilege customer' with "Y" / "N"
# priv cust -> 
# i) with the company for more than 250
# ii) complaints made are between 0-3

# find how many records match the above condition
length(customer$custid[(customer$cust_since>250) & (customer$compl<4)])

# update the privilege column
customer$priv[(customer$cust_since>250) & (customer$compl<4)] = "Y"

# query to get all priv customers
View(customer[customer$priv=="Y",])

# update all the non-privilege-customers to "N"
customer$priv[customer$priv!="Y"] = "N"
View(customer)

# write the dataframe into a file (.CSV format)
write.csv(customer,"myTelecomCustomers.csv",row.names=F)

# file location - in the default working directory
getwd()


# A4)
# 1) change the first 20 customer names with a proper name

# For each of the changed names, also change the corresponding email ID

customer[1:2,c('name','email')]

# IN operator
# out of 500, 5 customers have defaulted on the payment
# select the details of these 5 customers

cols=c('custid','name','phone','billamt')
custids = c(580380, 475579, 461619,837652,923199)
customer[customer$custid%in%custids,cols]

# if a given ID does not exist, the query returns those records where there is a match
custids = c(580380, 475579, 461619,837652,923199,999999)
customer[customer$custid%in%custids,cols]

# selective filtering
# eg: get all the records of customers who have a "yahoo" mail id
cols=c('custid','name','age','email')

customer[grep("yahoo",customer$email),cols]

# get all customers who have "HOTMAIL" as the domain
# PS: domain specified is in UPPER CASE
domain="HOTMAIL"
domain

# 1) convert to lower case

# 2) specify the CASE parameter in the 'grep'
customer[grep(domain,customer$email,ignore.case=T),cols]

#####
# to find proportions of factor variables

# i) get the count of male/female customers
# method 1
length(customer$gender[customer$gender=="M"])
length(customer$gender[customer$gender=="F"])

# method 2
table(customer$gender)

# store the results of table output in a variable
tab =  table(customer$gender)
f = tab[1]
m = tab[2]
print(paste('There are',f,'female customers and',m,'male customers'))

# ii) get the proportion of male/female customers
# method 1
264/500
236/500

# method 2
prop.table(table(customer$gender))

# store proportions in a variable
tab = prop.table(tab)
f = tab[1]*100
m = tab[2]*100
print(paste(f,"% of customers are women and ",m,"% of customers are men",sep=""))

# Assignments/CW
# ---------------

# 1) get the count and proportions of customer plans, itemised billing
table(customer$plan)
prop.table(table(customer$plan))

# 2) create a new column 'senior_citizen' and assign value 'Y' or 'N' (hint: age >=60 is a senior citizen)
customer$sc = "N"
customer$sc[customer$age>=60] = "Y"
table(customer$sc)

# 3) Get the top 10 customers who have the highest billing amount
cols=c('custid','name','gender','billamt')
View(head(customer[order(customer$billamt,decreasing=T),cols],10))

# 4) get the top 10 customers who have the least billing amount
# same as (q3)

# 5) get the customer details whose net usage is more than 5
cols=c('custid','name','gender','netuse')
customer[customer$netuse>5,cols]

# 6) Get the customer details whose phone number begins with the number series "95"
cols=c('custid','name','gender','age','phone')
customer[ substr(as.character(customer$phone),1,2)=="95", cols]


# some statistical operations on the dataframe columns

# 1) average monthly billing
mean(customer$billamt)

# 2) median billing amount
median(customer$billamt)

# 3) find the average billing amount based on 'plan'
unique(customer$plan)
# average of billamt, group by 'plan'
tapply(customer$billamt, customer$plan, mean)

# 4) get a count of customers who are with the service provider for over 200 (days)
length(customer$custid[customer$cust_since>200])
nrow(customer[customer$cust_since>200,])
View(customer[customer$cust_since>200,])

# 5) slice the 'customer' dataset (to create a subset of records) containing data of customers having the plan 'WEND250' and 'WKD500' (give a suitable name for the subset)
p=c('WEND250','WKD500')

wkwend = customer[customer$plan%in%p,]
nrow(wkwend)
View(wkwend)

# 6) painters / college
/drive/dataset/school.csv

#####################################################

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
# EDA + Visualisation

######################################################
# ch11: EDA

path = "C:/Users/mayur/Desktop/data analyst vedios/r language/absentism.csv"
dataset = read.csv(path,header=T)
dataset

# dimension of the dataset
dim(dataset)

# column names
colnames(dataset)

# rename the columns to a shorter name
colnames(dataset) = c('id', 'abs_reason', 'abs_month', 'day',
                      'season', 'tr_exp', 'dist', 'svc_time',
                      'age', 'sex', 'work_load', 'hit_tgt',
                      'disp_fail', 'educ','soc_drink', 'children',
                      'soc_smoker', 'pet', 'wt','ht','bmi',
                      'absentism')

colnames(dataset)

# structure of the dataset
str(dataset)



# count the NULLs
# write a function that gives a count of all the NULL values of all columns

# checkNull = function(x) return(any(is.na(x)))
# checkZero = function(x) return(any(x==0))

data.frame(colSums(is.na(dataset)))

# identify the rows that have NULL values for abs_month
nullrow= as.integer(rownames(dataset[is.na(dataset['abs_month']),]))
print(nullrow)

mean_absmonth = floor(mean(dataset$abs_month,na.rm=T))
print(mean_absmonth)

# update the NULL values with the mean value
dataset$abs_month[nullrow] = mean_absmonth

# verify the update
dataset$abs_month[nullrow]

str(dataset$abs_month)

str(dataset)



# check if the dataset has any special characters
table(dataset$day)

# ? has to be converted to a valid number
# replace ? with 4 (since 4 is the mode f the column 'day')
nullrow=as.integer(rownames(dataset[dataset$day=="?",]))

print(nullrow)

dataset$day[nullrow] = 4
dataset$day[nullrow]

# convert the column back to integer
dataset$day=as.integer(dataset$day)

str(dataset)


# season
table(dataset$season)

# transport expenses
summary(dataset$tr_exp)
# transport expenses cannot be 0. 

rows = which(dataset$tr_exp==0)
print(rows)

View(dataset[dataset$tr_exp==0,])

# mean value of tr_exp
mean(dataset$tr_exp)
mean_tr_exp = mean(dataset$tr_exp[dataset$tr_exp>0])

dataset$tr_exp[rows]=mean_tr_exp

# assignment: try to impute the tr_exp with values based on the 'dist' (use the binning technique)

summary(dataset$dist)

str(dataset)

# sex
table(dataset$sex)

# replace all instances of "female" / "Female" -> F
dataset$sex[dataset$sex%in%c('female','Female')] = "F"

# replace all instances of "male" / "Male" -> M
dataset$sex[dataset$sex%in%c('male','Male')] = "M"

# change the datatype to factor
dataset$sex = as.factor(dataset$sex)
str(dataset)

# height-weight-bmi
# since BMI is a calculated column using height and weight, we can drop the BMI from the dataset
# before dropping, ensure that height/weight dont have 0


# identify the columns that need to be converted to factors

############################################################

# Ch12: Visualisation
# dataset: bank customers

# install.packages("ggplot2")

# load the library
library(ggplot2)

# read the file into dataset
path="C:/Users/mayur/Desktop/data analyst vedios/r language/mybankcustomers.csv"
customer=read.csv(path,header=T)

# count between 2 categorical features
# 1) Cross Table
# --------------
# i) count of privilege customers - gender-wise
xtabs(~gender+privcust,customer)

# ii) gender vs Account types
xtabs(~gender+acc_type,customer)

str(customer)

# 2) Histograms
# --------------
hist(customer$age,col='blue',main='distribution of age')

# statistical tests to determine normality of data
# i) Shapiro test for normality
# works only when dataset has <=5000 records

# H0: data is normally distributed
# H1: data is not normally distributed

# the normality test will return a p-value
# if p-value is < 0.05, reject H0
# else                  FTR H0

res = shapiro.test(customer$age)
pvalue = res$p.value
alpha = 0.05

# ii) Agostino-Pearson test for normality
library(moments)
res = agostino.test(customer$age)
res$p.value

# 3) Boxplot
# -----------
boxplot(customer$balance,horizontal = T,col='yellow')

# 4) Correlation chart
# --------------------
# correlation - a bi-variate analysis that determines the relationship between 2 variables/features
# -1 to 0 to 1

# correlation only on the numeric data
# numeric columns of the dataset

numc=colnames(customer)[sapply(customer,is.numeric)]
numc

# install.packages("corrplot")
library(corrplot)

# i) find the correlation of the numeric data
corr = cor(customer[numc])

# ii) plot the matrix
corrplot(corr,method="number",type="lower")


# 5) bar plot
# -----------
# count plot - count the number of customers based on gender

ggplot(customer,aes(x=gender,fill=gender)) + 
  geom_bar(position="stack") +
  ggtitle("Customer counts based on gender") +
  labs(y="count", x="gender")

# account type based on gender
# plot side by side
ggplot(customer,aes(x=acc_type,fill=gender)) +
  geom_bar(position="dodge") + 
  ggtitle("Account Types based on gender") +
  labs(y="count", x="acct type")

# plot one on top of the other (Stack)
ggplot(customer,aes(x=acc_type,fill=gender)) +
  geom_bar(position="stack") + 
  ggtitle("Account Types based on gender") +
  labs(y="count", x="acct type")

# 6) Pie chart
# ------------
# use when you want to show distribution of factor variables

# distribution of account types
ggplot(customer,aes(x="",fill=acc_type)) +
  geom_bar() + 
  coord_polar(theta="y")

# 7) Density plot
# distribution of 'credit score'
ggplot(customer,aes(x=credit_score)) +
  geom_density(adjust=0.13)

# distribution of 'credit score' based on 'gender'
ggplot(customer,aes(x=credit_score,fill=gender)) +
  geom_density(adjust=0.61)

# 8) Box-plot
ggplot(customer,aes(x="", y=balance)) + 
  geom_boxplot() +
  coord_flip()

# box plot of "balance" based on "gender"
ggplot(customer,aes(x=gender, y=balance)) +
  geom_boxplot() +
  coord_flip()

# 9) plot categories with numbers
# histogram of 'ages' based on 'gender'

ggplot(customer,aes(x=age)) +
  geom_histogram(bins=10,fill='yellow',
                 col='black') +
  facet_grid(~gender)

# 10) Other analysis 
# --------------------
# apply()
# stats()















































































































































































































































