# ch3: Strings

gender = 'M'
subject = "computer science"
print(gender)
print(subject)
typeof(gender)
typeof(subject)

gender = "F"
subject = 'Artificial Intelligence'
typeof(gender)
typeof(subject)

# how many characters in 'subject' variable
# includes spaces
nchar(subject)

# vector of strings
days=c('sunday','monday','tuesday','wednesday','thursday','friday', 'saturday')

print(days)
length(days) # total elements in the vector
nchar(days)  # length of each element

# accessing the vector
days[1] # 1st element
days[1:3] # first three elements

# A1) 
# starting from the 1st element, get all the alternate days
# output -> sunday/tuesday/thursday/saturday

# no hardcoding

days[seq(1,length(days),2)]

# concatenate strings
str1 = "R is an easy programming language"
str2 = "It is used a lot in data science projects"
str3 = "Can also plot graphs"

# sep -> separator parameter
paste(str1,str2,str3,sep=". ")

# dealing with NULLs
days = c(days, NA,NA,NA)
days

length(days) # returns the count of the vector; including the NULLs

# count of vector excluding the NULLs
length(days[!is.na(days)])

# string operations
sentence = "India is my country. I love my country and am proud of its rich and varied heritage"

# substring function - extract a portion of a string from the original string
substr(sentence,1,5)

# checking if 2 strings are equal

# reasons why 2 strings don't match
#  i) case (uppercase/lowercase)
#  ii) when there are spaces

# install.packages("stringr")
# install.packages("stringi")
# library(stringi)

library(stringr)

word = "   R programming   "
print(word)

# i) length of the sentence
str_length(word)

# ii) remove spaces
word = str_trim(word)
print(word)

# iii) convert word to upper case
word = toupper(word)
print(word)

# iv) convert word to lower case
word = tolower(word)
print(word)

# pattern matching - match whole/partial word
lov = c('mouse','printer','desk','house','keyboard','blouse','monitor')

# method 1)
# full match
grep("keyboard", lov)
lov[5]

# partial match - returns the index of words containing the match
grep("use",lov)

# returns the exact word containing the match
lov[grep("use",lov)]

# method 2)
which(lov == "mouse")
lov[1]

###
# A1)
s11="India is a big country."
s12="It is the 7th largest in the world."
s13="It is also the largest PeninsulA in the world"

# join these 3 sentences to form a single paragraph. 

para=paste(s11,s12,s13,sep="")
para

# to find a word in a paragraph
# check if the word 'peninsula' exists

word = 'peninsula'
# grep -> returns 1 if found; else 0
grep(word,para)

# returns 0 since word does not exist (case-sensitive)
# returns 1 if word is present
word = 'PeninSula'
grep(word,para)

# A2) return True irrespective of the case of the word
# PeninSULA, peNiNSula, peninSulA,PEninSula - any combination shd return TRUE
word = 'PEninSuLa'
word = tolower(word)
grep(word,para)

# when actual data contains mixed case and word to be searched is also different case, convert both to upper/lower case
para = tolower(para)
word = tolower(word)
grep(word,para)

library(stringr)
word = 'PENINSUla   '
para = tolower(para)
word = str_trim(tolower(word))
grep(word,para)

# word count
para1='python is a programming language. python is also a snake. python is dangerous. python is easy to learn.'

print(para1)
word = "python"
count = str_count(para1,word)
print(paste(word,"occurs",count,"times"))

# check if a sentence begins / ends with a pattern
# i) begins - checks if para1 starts with the text 'train'
# returns TRUE if yes, FALSE if no

startsWith(para1,"train") # FALSE
startsWith(para1,"python") # TRUE

# ii) ends - checks if para1 ends with text <>
# returns TRUE if yes, FALSE if no

endsWith(para1,"python") # FALSE
endsWith(para1,"learn.") # TRUE

para1

# get the index positions of the matched word
ndx=grepRaw(word,para1,all=T)
ndx

# A4) extract the words from the index positions
substring(para1,ndx[1], ndx[1]+nchar(word)-1)
substring(para1,ndx[2], ndx[2]+nchar(word)-1)

# character translation - changes a single character from old to new
sent1 = "An Apple A Day keeps the Doctor Away"

# change "A" to "X"
sent1 = chartr("A","X",sent1)
sent1

# find and replace word in a sentence
sent1 = gsub('Xpple','Apple',sent1)
sent1

# split a sentence into words
# .. based on any delimiter

# student data
# studentid studname gender age course enrolldate

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

# generate 10 password of length 7
# password must contain uppercase, lowercase and numbers
pwd = stri_rand_strings(10, 7, "[A-Z0-9a-z]")
print(pwd)

##############################################

# logical vector
lv = c(TRUE,FALSE)
print(lv)
lv[1]
lv[2]
lv[1] = FALSE
lv
########################

# vector arithmetic
# when dimensions match
v1=c(10,15,20)
v2=c(3,4,5)
v1+v2

# when dimensions don't match
v1=c(10,15,20)
v2=c(3,4)
v1+v2
#######

# can a vector contain both numeric and string data? 
v1=c(10,15,19,'sriram','trainer')
print(v1)






