#Plots are a key tool to analyse data
my_norm=rnorm(1000,0,1)
plot(my_norm)
hist(my_norm)
qqnorm(my_norm)
qqline(my_norm)

my_exp=rexp(1000,1)
hist(my_exp)
qqnorm(my_exp)
qqline(my_exp)

boxplot(my_norm)
boxplot(my_exp)

pairs(mtcars)

barplot(Titanic[1,,2,], col=c("red","darkblue"), legend=c("Male","Female"),main="Titanic Survived 1st class")
library("RColorBrewer", lib.loc="~/R/win-library/3.3")
#sequential
mypalette<-brewer.pal(3,"Greens")
barplot(Titanic[1,,2,], col=mypalette, legend=c("Male","Female"),main="Titanic Survived 1st class")
#qualitative..best for categorical?
mypalette<-brewer.pal(3,"Set1")
barplot(Titanic[1,,2,], col=mypalette, legend=c("Male","Female"),main="Titanic Survived 1st class")
mypalette<-brewer.pal(3,"Set2")
barplot(Titanic[1,,2,], col=mypalette, legend=c("Male","Female"),main="Titanic Survived 1st class")
mypalette<-brewer.pal(3,"Set3")
barplot(Titanic[1,,2,], col=mypalette, legend=c("Male","Female"),main="Titanic Survived 1st class")
#divergent
mypalette<-brewer.pal(3,"Spectral")
barplot(Titanic[1,,2,], col=mypalette, legend=c("Male","Female"),main="Titanic Survived 1st class")
barplot(Titanic[1,,2,], col=mypalette, legend=c("Male","Female"),main="Titanic Survived 1st class", args.legend = list(x="topleft"))

#the palette type doesn't make that much difference since only talking about 2 colours?
