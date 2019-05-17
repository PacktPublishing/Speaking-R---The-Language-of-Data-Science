library(XML)

page="http://www.bbc.com/sport/football/premier-league/results"

my_page=readHTMLTable(page, header=T,stringsAsFactors=F)
my_page
View(my_page)
#can see that it's A MESS!!!

my_page[1]
my_page[50]

tmp=my_page

df_tmp=as.data.frame(unlist(tmp))
View(df_tmp)
head_df=head(df_tmp,n=1406)
head_df

tmp1=tmp[1]
unlist_tmp1=unlist(tmp1)
unlist_tmp1[2]

x=unname(tmp)
y=unlist(x)
z=y[6]
z
string_z=as.character(z)
a=strsplit(z,"\n")

#remove spaces
a$Fixture[2] <- gsub("^\\s+|\\s+$", "", a$Fixture[2])
a$Fixture[2]
a$Fixture[1] <- gsub("^\\s+|\\s+$", "", a$Fixture[1])
a$Fixture[1]

a1=a$Fixture[2]
#check to see whether "-" is in a1
grepl(a1,pattern = "-")


#so loop through y
str(y) # there are 1520 items

for(i in 1:1500){
  z=y[i]
  string_z=as.character(z)
  a=strsplit(z,"\n")

  a$Fixture[1] <- gsub("^\\s+|\\s+$", "", a$Fixture[1])
  a$Fixture[2] <- gsub("^\\s+|\\s+$", "", a$Fixture[2])
  a$Fixture[3] <- gsub("^\\s+|\\s+$", "", a$Fixture[3])

  #print(i)
  for(j in 1:3){
    a1=a$Fixture[j]
    if(length(a1)>0){
      if(grepl(a1,pattern = "-")){
        cat(a$Fixture[1],"\t",a1,"\t",a$Fixture[3],"\n")
        #print(a1)
        #print(a$Fixture[3])
        #print(j)
      }
    }
  }
}

#Put these into a data frame and process?
