# ch2: Numbers

# i) integers
age = 40
print(age)
typeof(age)

# type cast -> convert from 1 datatype to another datatype
# convert "age" from 'double' to 'integer'

# method 1
age = as.integer(age)
typeof(age)
print(age)

# method 2
age = 40L
typeof(age)
print(age)

# count the number of digits in a number
age = 167
nchar(age) # counts the number of digits in age
nchar(13907921)

# vector of numbers
ages = c(29,21,40,33,34,41,56,78,64,66,19,39)
print(ages)

# total number of values
length(ages)

# access the vector
# 1st element
ages[1]
ages[2] # 2nd value

# access the last value
ages[12]

# try to access non-existing index returns NULL
ages[50]

# length -> returns the total number of elements present in the vector
length(ages)

# nchar -> returns the total number of digits present in a single number
nchar(ages[1])

# add some more values to ages vector
ages = c(ages,49,39,29,33,43,50)
print(ages)

# A1)
# find the last value of the vector; without hardcoding the index number
print(ages[length(ages)])

# extract a range of values from the vector
# eg: the first 5 values
ages[1:5] # starting from 1st pos till the 5th pos
ages[7:10] # from 7th - 10th pos
ages[c(1,5,10)] # 1st, 5th and 10th elements

# arithmetic ops
ages[1]; ages[2]
ages[1] + ages[2]

#### sequence and random numbers

# 1) sequence of numbers
seq1 = seq(1,10)
print(seq1)
seq1[1]
seq1[1:5]

# sequence with a step-size of 3
seq2 = seq(1,20,3)
print(seq2)
length(seq2)

# A2) generate the table of 6 (first 10 values) 
seq(6,6*10,6)

# sequence in the reverse order
seq(30,1,-5)

# sequence of numbers that are continuous
seq(1,10,0.5)
seq(5.25,1.03, -0.42)

# random numbers
# 1) random integers - with replacement
# method 1)
# generate 50 random numbers between 1 and 100
r1 = floor(runif(50,1,100))
print(r1)
# sort the data in the ascending order 
sort(r1)

# method 2) - sampling
# generate 40 random integers between 1-100; with replacement. replace=TRUE-> data can repeat
r2 = sample(seq(1,100), 40, replace=T)
print(r2)
sort(r2)

# random integers - without replacement - unique values (replace=FALSE)
r3 = sample(seq(1,100), 50, replace=F)
sort(r3)

# assignment
# A1) generate ID numbers for 50 telecomm customers (take any range)
custid=sample(seq(1000,2000),50,replace=F)
sort(custid)

# A2) generate Maths marks for 100 students (range 0-100)
maths=sample(seq(0,100),100,replace=T)
sort(maths)

# What to do If we want to know the number of values between 1000 & 2000 
s1 = seq(1000,2000)
length(s1)

# random continuous numbers
# generate 5 random continuous numbers between 0 and 1
cr1 = runif(5)

# to restrict digits after decimal
round(cr1,2)
round(cr1,3)

# generate 50 numbers between 25 and 60
cr2 = round(runif(50,25,60),1)
print(cr2)

########

# maths operators
num1 = 34.9; num2 = 20

# + -> addition
num1+num2

# -> subtraction
num1-num2

# * -> multiplication
num1 * num2

# / -> division
num1/num2

# power - 5*5*5*5
5^4

# quotient
27%/%5

# remainder
27%%5

# absolute - convert -ve to +ve number
abs(-145.64)

# exponent
exp(-2.345)
exp(1.221)

# logarithms
log(num2) # natural log
log(num2,2) # log-base2
log(num2,10) # log-base10

v1 = round(runif(10,10,50),1)
log(v1)

# square root
sqrt(1225)

# factorial
factorial(5)

# trigonometric functions
sin(num2)
cos(num2)
tan(num2)

# pre-defined constant
pi

# A3) create a vector called 'radius' and generate 10 unique integer values.
# calculate the area of circle for each of the radius. (restrict the decimals to 2)
# area of circle = pi x r-square
# no hardcoding

radius=sample(seq(1,50),10,replace=F)
round(pi*radius^2,2)

# other operations on a vector
sum(maths) # summation of all values
mean(maths) # average value
median(maths) # median

# add 5% to all the values
maths = maths + (maths*0.05)
print(maths[1:10])

# A4) create a price list of 30 items (range 100-10000) with a 1-digit precision.
prices=round(runif(30,100,10000),1)
prices

# apply a discount of 10% on all items
newprices = prices*0.9

# display the old and the new values
prices[1:10]
newprices[1:10]

###
# dealing with Null values
total = sample(seq(1,100),5)
total
# add some Null values to 'total'
total = c(total, NA,NA,NA)
print(total)

length(total)

# data having NA will return NA
sum(total)
mean(total)

# na.rm = T does not consider the null values for calculations
sum(total, na.rm=T)
mean(total, na.rm=T)

# how many Nulls in the vector ?
sum(is.na(total))

# changing a value of an index
total[1] = 50 # changing 1 value
total

# change Nulls to 0
total[is.na(total)] = 0
total

# A5) replace the 0 with the mean value of total
meantotal = mean(total)
meantotal
total[total==0] = meantotal
print(total)
# the == sign is used to check a condition

# 'which' function
# returns the index position of the vector, matching a given condition
age = sample(seq(18,60),5)
age

# returns the index position where the age=34
which(age==34)

# index pos of ages>40
which(age>40)

# how to get the actual values that are >40
age[which(age>40)]

# A6)
# create a vector 'ages' with 30 random integers
# extract all the even numbers from it
age = sample(seq(18,60),30)
age[which(age%%2==0)]

# A7)
# create a vector of numbers having 1,2 and 3 digit numbers. 
# extract only the 3 digit numbers
num = sample(seq(1,150),25)
num[which(nchar(num)==3)]

# appending vectors
newage = append(ages,num)
print(newage)

length(ages)
length(num)
length(newage)

# print only the unique values of a vector
marks=sample(seq(1,5),50,replace=T)
sort(marks)
sort(unique(marks))

# identify the duplicated entries
rating=sample(seq(1,20),25,replace=T)
sort(rating)
print(rating)

duplicated(rating)

# index pos of numbers that are duplicates
which(duplicated(rating))

# actual values that are duplicates
unique(rating[which(duplicated(rating))])

## 1/10/2020

# There are two bags - blue and red; each containing 6 boxes of items between 10-30.
# The cost of an item in the blue and reg bag is 150 and 175 respectively.
# Find the total cost of the items

bluebag = sample(seq(10,30),6)
redbag = sample(seq(10,30),6)
bluebag; redbag
sum(sum(150*bluebag), sum(175*redbag))

# rank / order

# rank -> to rank a set of values
marks=c(56,99,78,42,64,78)
print(marks)

# by default, the lowest value gets the highest rank
rank(marks) 

# to make the highest value get the top rank
rank(-marks)

# order -> to find the position of the values from lowest->highest
print(marks)
order(marks)

# repeating a value
rep(5109, 4) # 5109 is repeated 4 times
rep(1:5,3) # repeats a sequence 3 times
rep(c(100,200), 2) 

# repeat the days in months
days = rep(c(31,30,28),c(7,4,1))
print(days)

# repeat string values
rep(c('M','F'),c(4,4))

marks = sample(seq(1,100),75,replace=T)
print(marks)

# get all the marks that are more than 75
marks[marks>75]

# to get a distinction, the marks >= 95
marks[marks>=95]

# any() - returns True/False based on the condition
any(marks>=95)

# to pass the quality check, the minimum % is 97
# from a set of 30 samples, check if they all pass the quality check. 
# Reject the whole sample if they don't pass the quality check

scores=round(runif(30,96,100),2)
scores
any(scores<97)

# type conversion - convert data from 1 datatype to another data type

# i) float to integer
area = 45.674
print(area)
as.integer(area)
floor(area)

# ii) integer to float
len = 24
as.double(len)

# iii) string to number
len = "24"
as.integer(len) + 10

# iv) cannot convert string (name) to number
name = "sriram"
as.numeric(name)

# coercion -> converting values between datatypes

# v) number to character
len
as.character(len)








































  
  













































