View(mtcars)

plot(x=mtcars$mpg,y=mtcars$wt,type="p")

ggplot(mtcars,aes(x=mtcars$mpg,y=mtcars$wt))+geom_point()

ggplot(mtcars,aes(x=mtcars$mpg,y=mtcars$wt,col=as.factor(am)))+
  geom_point()

ggplot(mtcars,aes(x=mtcars$mpg,y=mtcars$wt,col=as.factor(gear)))+
  geom_point()

