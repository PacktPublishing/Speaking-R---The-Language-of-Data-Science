
mydata=as.data.frame(mtcars)
str(mydata)

mydata$am=as.factor(mydata$am)
mydata$cyl=as.factor(mydata$cyl)
mydata$carb=as.factor(mydata$carb)

str(mydata)

ggplot(mydata,aes(x=mtcars$mpg,y=mtcars$gear))+geom_point()+facet_grid(~cyl)
ggplot(mydata,aes(x=mtcars$mpg,y=mtcars$gear))+geom_point()+facet_grid(~am)
ggplot(mydata,aes(x=mtcars$mpg,y=mtcars$gear))+geom_point()+facet_grid(~carb)
ggplot(mydata,aes(x=mtcars$mpg,y=mtcars$gear))+geom_point()+facet_wrap(~carb)

#cheatsheets
#Also https://cran.r-project.org/doc/contrib/Short-refcard.pdf
#Like a smartphone is good but a lot lot better with apps
#r is half the story without packages!
#packages by topic: https://cran.r-project.org/web/views/

