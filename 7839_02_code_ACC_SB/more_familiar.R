#R has conditional tests
if(2>1){
  print("greater")
  }

result=TRUE
if(result){
  print("True")
}

if(FALSE){
  print("False")
}


#we also have if else
if(FALSE){
  print("False")
}else{
  print("Not True")
}

#and else if
if(FALSE){
  print("False")
} else if(TRUE){
  print("TRUE")
}

if(4<10){
  print(TRUE)
}

#equality test is ==
if(4==8/2){
  print(TRUE)
}

#We also have for
for(x in 1:10){
  print(x)
}

#folding the code!
for(x in 1:10){
  print(x)
}

#while
x=1
while(x<5){
  print(x)
  x=x+1
}

myconvert_celsius_to_fahrenheit <- function(x){
  temp_in_fahrenheit=x*1.8+32
  return(temp_in_fahrenheit)
}


myconvert_celsius_to_fahrenheit(0)
myconvert_celsius_to_fahrenheit(100)
