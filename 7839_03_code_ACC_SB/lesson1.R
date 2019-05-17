#We'll need some data to look at so we'll create some?
#Using sample we pick numbers from 1-10000 with replacement
my_nos=sample(c(1:10000),100,replace=TRUE)
my_nos
constant_nos=rep(5000,100)
constant_nos





mean(my_nos)
mean(constant_nos)
median(my_nos)
median(constant_nos)
mode(my_nos)
mode(constant_nos)

#mode function tells us what type of data something is not a stats function
x=c("a","b","a")
#we can write our own function
Mode <- function(x) {
  tmp <- unique(x)
  tmp[which.max(tabulate(match(x, tmp)))]
}
Mode(x)

range(my_nos)
range(constant_nos)
quantile(my_nos)
quantile(constant_nos)
var(my_nos)
var(constant_nos)
sd(my_nos)
sd(constant_nos)



#we also have standard stats functions
#euromillion is 5 numbers from 1-50 at most once, and 2 lucky stars from 1-12

main_nos=sample(c(1:50),5,replace=FALSE)
lucky_stars=sample(c(1:12),2)
cat(main_nos," ",lucky_stars)

choose(50,5)*choose(12,2) #the possible outcomes of two independent events is the product....





#We also have access to real data and since R the leader
#most sites are compatible
library(Quandl) #need to install this first
temperatures=Quandl("EPI/74")
plot(temperatures)
y=temperatures$`Temperature (Degrees Celsius)`
x=131:1 #using this x means we can fit numbers 1-131 to temp as opposed to dates
plot(x,y)
warming_model=lm(y~x) #we can fit line to the data
abline(warming_model)

#R is now the most widely statistical package/language.....
#from Statistical Modelling in R (2009), Oxford University Press
help(package="stats")
