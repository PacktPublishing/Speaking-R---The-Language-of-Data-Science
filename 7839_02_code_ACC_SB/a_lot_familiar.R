#We can program as usual in r
#Commmenting like this
print("Hello World")

#we have the standard data types
#like integers
x_int<-0
x_int
print(x_int)

#x<- is more S syntax but we can also use = if we want
x=1
x

#we also have real numbers like 3.1415
x_real=3.1415
x_real

#we have logical variables
x_logic=TRUE
x_logic

#TRUE is 1 and FALSE is 0 (Boolean)
sum(x_logic)
x_logic=FALSE
x_logic
sum(x_logic)
#this is a handy trick since we can have data where we know something is TRUE
#or FALSE for each. Using this we can easily count how often it is TRUE

a=c(1,2,3)
a

x_vector=as.vector(c(1,2))
x_vector

1:10
a=1:10
a
sum(a)
b=a*a
sum(b)

#we can also do logical tests
test=a>3
test
sum(test)
#this is a handy trick since we can easily count
#how often the result is true

#we also have strings
z="Hello"
z=c(z,z)
z

