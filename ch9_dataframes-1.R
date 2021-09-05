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













































































































