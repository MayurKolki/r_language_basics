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



















































