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



















