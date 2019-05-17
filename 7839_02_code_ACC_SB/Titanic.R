#Titanic is another dataset included within r
Titanic

#we can look at the data to get a sense of what it is about
#since there are multiple dimensions?

plot(Titanic) #new command

str(Titanic)
subset(my_titanic, Survived=="Yes")

my_titanic=as.data.frame(Titanic)
str(my_titanic)
subset(my_titanic, Survived=="Yes")
plot(my_titanic)
summary(my_titanic)
subset(my_titanic, Survived=="No")
pairs(my_titanic) #new command

#Once we have an idea what the data is we can start thinking
#about what it is what we want to do? What is it telling us?




str(Titanic) #4 dimensions...class has 4 possible values, other 3 have 2 so 32
#Indexing with tables
Titanic[,,,2] #data for those who survived
barplot(Titanic[1,,2,], col=c("red","darkblue"), legend=c("Male","Female"),main="Titanic Survived 1st class")
barplot(Titanic[2,,2,], col=c("red","darkblue"), legend=c("Male","Female"),main="Titanic Survived 2nd class")
barplot(Titanic[3,,2,], col=c("red","darkblue"), legend=c("Male","Female"),main="Titanic Survived 3rd class")
barplot(Titanic[4,,2,], col=c("red","darkblue"), legend=c("Male","Female"),main="Titanic Survived Crew")

pie(Titanic[1,,2,],labels =c("Male Died","Female Died","Male Live","Female Live"),main="Titanic 1st Class")
