n=seq(3,3.6,0.1)
n
vect=vector(mode='numeric')
for (x in n)
{
f=exp(x)*cos(x)
vect=append(vect,f)
}
vect

################################################################

  ##############################################
  Fn1=function(Xvec)
  {
    Xvec^(1:length(Xvec))
    
  }
  
  Fn1(c(1,2,3,4))
  Fn2=function(Xvec)
  {
    n=length(Xvec)
    (Xvec^(1:n)/(1:n))
  }
  Fn2(c(1,2,3,4))
##########################################################
  
  V=c(2,4,5,6,7,8)
  fn1=function(v)
    for(i in seq (1,length(v)))
   {   sq=v[i]^v[i]
       print(sq)
    }
  v=c(2,4,5,6,7,8)
  fn1(v)
##############################################################  
  #fibonacci series
  
  
  recurse_fibonacci <- function(n) {
    if(n <= 1) {
      return(n)
    } else {
      return(recurse_fibonacci(n-1) + recurse_fibonacci(n-2))
    }
  }
  
 n
  
   # take input from the user
  nterms = as.integer(readline(prompt=5))
  
  # check if the number of terms is valid
  if(nterms <= 0) {
    print("Plese enter a positive integer")
  } else {
    print("Fibonacci sequence:")
    for(i in 0:(nterms-1)) {
      print(recurse_fibonacci(i))
      
    }
  }
 #################################### 
  Fibonacci <- numeric(10)
  Fibonacci[1] <- Fibonacci[2] <- 1
  for (i in 3:10)
    Fibonacci[i] <- Fibonacci[i - 2] + Fibonacci[i - 1]
  
  print("First 10 Fibonacci numbers:")
  print(Fibonacci)
  
 ######################################################################
  
  #unsupervised
  #
  
  
  
  
  
  