#From http://www.tennis-data.co.uk/alldata.php
#Loaded in excel and saved as csv

tennis_data<-read.csv("2016.csv",header=TRUE,fill=TRUE,sep=",")

which(tennis_data$WRank>10)

tennis_data$WRank=as.integer(tennis_data$WRank)
tennis_data$LRank=as.integer(tennis_data$LRank)

str(tennis_data)
which(tennis_data$WRank>10)
which(tennis_data$WRank>tennis_data$LRank) #lower rank means better



nrow(subset(tennis_data,tennis_data$WRank<tennis_data$LRank))
nrow(subset(tennis_data,tennis_data$WRank>tennis_data$LRank))

better_wins=rep(0,200)
better_total=rep(0,200)
wins=rep(0,200)
for(i in 1:200){
  i_wins=nrow(subset(tennis_data,tennis_data$WRank==i))
  i_loses=nrow(subset(tennis_data,tennis_data$LRank==i))
  better_wins[i]=nrow(subset(tennis_data,tennis_data$WRank<tennis_data$LRank & tennis_data$WRank==i))
  better_total[i]=nrow(subset(tennis_data,tennis_data$WRank==i))

  better_wins[i]/better_total[i]
  wins[i]=i_wins/(i_wins+i_loses)
}
plot(better_wins,type="l",col="blue",ylim=c(0,1))
#upto rank 100 it is very rare that better player
#doesn't win...
plot(wins,type="l",col="blue",ylim=c(0,1))

players=unique(tennis_data$Winner)

#certain players take time to warm up, so can lose first set and win
#we have every game played so produce a league table for each player
#and see if find anything interesting?
#
#Will only look at 3 set games to begin with though the process
#can be applied to 5 set, and different court types?

#1 means better players wins, 2 worse one. can have 6 cases.
my_table=data.frame(players=players, "11"=0,"211"=0,"121"=0,"22"=0,"212"=0,"122"=0)

my_tennis_data=subset(tennis_data,tennis_data$Best.of==3)
#using my_tennis_data which is only 3 set games
nos_of_3set_games=nrow(my_tennis_data)

my_table=blank_table
for(i in 1:nos_of_3set_games){
  #look at game by game and update the table...

  #we are only lookin at 3 set matches so the 5 set ones
  #are not there but the i index is from the complete set
  #and so this has the next 3 set match and avoids missing errors!
  my_next_3set_game=my_tennis_data[i,]
  #print(i) #printed for debugging purposes

  player1=as.character(my_next_3set_game$Winner)
  player2=as.character(my_next_3set_game$Loser)

  wsets=my_next_3set_game$Wsets #number of sets the winner won
  lsets=my_next_3set_game$Lsets #number of sets the loser won

  if(is.na(lsets)){
    print("NA")
    next #if an NA comes around we just skip the match
  }
  if(lsets==0) #then 11 or 22 depending on which player
  {
    my_table[my_table$players==player1,2]=my_table[my_table$players==player1,2]+1
    my_table[my_table$players==player2,5]=my_table[my_table$players==player2,5]+1
  }else{

    if(my_next_3set_game$W1>my_next_3set_game$L1){
      set1=1

      #either 11 or 121 but know that not lsets is not equal to zero in this branch...
      my_table[my_table$players==player1,4]=my_table[my_table$players==player1,4]+1
      my_table[my_table$players==player2,6]=my_table[my_table$players==player2,6]+1

    }

    if(my_next_3set_game$W2>my_next_3set_game$L2){
      set2=1
      #set2=1 and lsets=1 means set1 was won by 2 so 211 or 122
      my_table[my_table$players==player1,3]=my_table[my_table$players==player1,3]+1
      my_table[my_table$players==player2,7]=my_table[my_table$players==player2,7]+1
    }


#  if 2 set match then 11
#  if 21 then 211
#  if 11 then 11
#  if 12 then 121
#  so only 2 outcomes...
#  but for loser...flipped
#  so losing player 11 is 22 so need all 6 fields!

  } #close if else

}#close for


