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
