#We can have numeric, character and logical variables
a=1
a
b="Hello"
b
c=TRUE
c

#R has a series of more complex datatypes,
#each including the previous one
#
#Vectors (like arrays)
a=1:10
a
a=c("hello","bye","not just numbers")
is.vector(a)
a=c(TRUE,TRUE,FALSE)
a
#We can access specific elements like this
a[1]

#Matrix
mat=matrix(1:20,nrow=5,ncol=4)
mat
matb=matrix(1:16,2,8)
matb
matb[,4] #the 4th col
matb[2,] #the 2nd row

rownames(matb) <- c("a","b")
matb["a",]

#Array like matrix but not just 2 dimensional
array1 <- array(1:8,dim = c(2,2,2))
array1[1,1,1]
array1[1,,]

#data.frames
planets=data.frame(names=c("Mercury","Venus","Earth","Mars"),Distance_from_Sun=c(57.9,108.2,149.6,227.9))
planets
planets$names
names(planets)
planets[1,]
planets[,1]
planets[planets$names=="Earth",]


#datasets
mtcars

#Very flexible data type since we can have numbers, logical and character
#we can't have data.frames though!

#list Here we can also have collections of data.frames!
mylist=list(planets,planets,matb)
mylist
mylist[1]
names(mylist)=c("Planets1","Planets2","Mat")
mylist$Mat
