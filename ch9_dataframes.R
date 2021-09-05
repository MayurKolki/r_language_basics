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

# create the data
customer = generateData(5)

print(customer)
















