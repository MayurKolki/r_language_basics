# ch11: EDA

path = "F:/aegis/4 ml/dataset/7 EDA/absentism/absentism.csv"
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