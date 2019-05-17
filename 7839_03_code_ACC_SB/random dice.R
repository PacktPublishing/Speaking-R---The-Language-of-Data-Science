#We can also use R for simulation and modelling!
#We can generate random numbers, when have parameter and want data
runif(5)
rnorm(5,5,1)
rgamma(5,1,2)
rweibull(5,2,1)




#We also have density, distribution and quantiles
pnorm(0,1,1) #distribution function mean 1, sd 1



#parameter estimate for reverse process when have data and want parameters
library(stats4)

x=rnorm(10000,2,3) #generate normal dist with mean 2 and sd 3

LL <- function(mu, sigma) {
       R = suppressWarnings(dnorm(x, mu, sigma)) #ignore the error messages...
       -sum(log(R)) #we want min of negative log-likelihood
  }

mle(LL, start = list(mu = 1, sigma=1)) #max likelihood estimate of parameters

#can of course just get the sample mean/sd as in the method of moments
mean(x)
sd(x)





#chi squared when want to see if data comes from a distribution
dice_rolls=sample(c(1:6),600,replace=TRUE)
dice_rolls
table(dice_rolls)

p=rep(1/6,6)

chisq.test(x=table(dice_rolls),p=p)

check=sample(c(1:6),100,replace=TRUE)
tmp=sample(c(1:3),500,replace=TRUE)
check=c(check,tmp)
table(check)
chisq.test(x=table(check),p=p) #<0.05 so different

#F-test
norm1=rnorm(500,5,1)
norm2=rnorm(500,5,3)

var.test(norm1,norm2) # more F deviates from one, more likely that different variances

norm3=rnorm(500,5,1)
var.test(norm1,norm3) # want p>0.05
#note that this assumes that both are normally distributed!

#poisson football sim
#' Goals scored in football follow a poisson distribution
#'
#' This means that:
#' we can tell how often we will get 1,2,3...goals in a game
#' we can estimate how many goals both sides will score?
#' whether both sides will score?
#' anything score related!
#'
#' This kind of thing is what bookies use, with minor tweaks!
#'
