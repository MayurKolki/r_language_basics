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
apply(mxscore1,1,sum)[1]
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