seq(10,1)
seq(1,15,by=2)
rep(0,5)
subset(mtcars,mpg<15)
subset(mtcars, mpg<15 & wt<4)
which(mtcars$mpg<15)
mtcars[which(mtcars$mpg<15),]
