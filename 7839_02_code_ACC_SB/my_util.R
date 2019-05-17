#We are not limited to using r commands since can
#write our own functions to do whatever we want

#survived has "Yes" and "No" while I'd prefer if it was logical 1 and 0
#or logical TRUE/FALSE?

#start looking at some group of passengers..say "Male"
x=subset(my_titanic,Sex=="Male")

for(i in 1:16){
  if(x$Survived[i]=="Yes"){
    x$Survived[i]=1
  }else{
    x$Survived[i]=0
  }
}

#we can get some figures, counting how many in category using nrow?
nrow(subset(my_titanic,Survived=="Yes" & Sex=="Male"))
x=subset(my_titanic,Sex=="Male")
str(x)
print(x$Survived)
x$Survived=as.integer(x$Survived)
print(x$Survived)
x$Survived=x$Survived-1 #so now we have



