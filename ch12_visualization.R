# Ch12: Visualisation
# dataset: bank customers

# install.packages("ggplot2")

# load the library
library(ggplot2)

# read the file into dataset
path="F:/aegis/4 ml/dataset/7 EDA/mydata/mybankcustomers.csv"
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





