#' poisson_football_model
#' 
#' we can get all the parameters required from http://www.soccerstats.com/latest.asp?league=england
#' which has most leagues out there? Click on Goals, the Scored/Conceded to get them.
#' 
#' This is model where we tell it the parameters from data about how
#' often a team scores/concedes goals for the home and away team 
#' as well as the averages goals scored by home and away sides.
#' We then generate 1000 numbers representing the number of goals we
#' expect to be scored by both sides, scaled by how good the 
#' defences of both sides are, and generate statistics. 
#' 
#' This lets us estimate how often we would expect the home team to
#' score more goals than the away one (in other words win), how
#' often we would expect both sides to score and so on.
#' 
#' @param home_scored This is the average goals scored at home 
#'        by the home team
#' @param home_conceded This is the average number of goals the
#'        home team concedes
#' @param average_home_scored This is the average number of goals 
#'        scored at home across the league
#' @param average_home_conceded This it the average number of goals
#'        conceded by the home team across the league
#' @param away_scored
#' @param away_conceded
#'   
#' @return
#' @export
#' 
#' @examples
#' poisson_football_model(1.86,0.71,1.48,1.13,1,1.86)
#' 
#' This generates output like below, though different
#' every time since it is randomly generated
#'  
#' home_scored: 1.86
#' Mean Goals: 2.997
#' Home wins from 1000: 749
#' Draws from 1000: 161
#' Away wins from 1000: 90
#' 3 or more goals from 1000: 563
#' Both Teams to Score: 428
#' Mean Home: 2.349
#' Mean Away: 0.648
#' Asian Home-1 515
#' Asian Away-1 24
#' Total Goals 2 or 3: 428
#' 
#' So we would expect the home team to win 75% of the time
#' and 3 goals to be scored on average with an average score
#' of 2.35:0.65
#' 
#'
 
poisson_football_model <- function(home_scored, home_conceded, average_home_scored,
                                   average_home_conceded, away_scored, away_conceded) 
  {
  average_away_conceded=average_home_scored
  average_away_scored=average_home_conceded 
  
  scaled_home=home_scored/average_home_scored
  scaled_away=away_scored/average_away_scored
  scaled_away_defence=away_conceded/average_away_conceded
  scaled_home_defence=home_conceded/average_home_conceded
  
  XteamA=rpois(100000,home_scored*scaled_away_defence)
  #correlated poisson does better since pure poisson underestimates some scores and over overcounts other
  #which is a slight effect but always looking for possible improvements?
  #pcorrelation=rpois(100000,0.2)
  #XteamA=XteamA+pcorrelation
  
  XteamB=rpois(100000,away_scored*scaled_home_defence)
  #pcorrelation=rpois(100000,0.2)
  #XteamB=XteamB+pcorrelation
  
  totalgoals=XteamA+XteamB
  meangoals=mean(totalgoals)
  cat("\nhome_scored:",home_scored)
  cat("\nMean Goals:", meangoals)
  cat("\nHome wins from 100K:",sum(XteamA>XteamB))
  cat("\nDraws from 100K:",sum(XteamA==XteamB))
  cat("\nAway wins from 100K:",sum(XteamA<XteamB))
  cat("\n3 or more goals from 100K:",sum(totalgoals>2))
  cat("\nLess than 3 goals from 100K:",sum(totalgoals<3))
  cat("\nBoth Teams to Score:",sum(XteamA>0 & XteamB>0))
  cat("\nMean Home:",mean(XteamA))
  cat("\nMean Away:",mean(XteamB))
  cat("\nAsian Home-1",sum(XteamA>XteamB+1))
  cat("\nAsian Home-2.5",sum(XteamA>XteamB+2.5))
  cat("\nAsian Away-1",sum(XteamB>XteamA+1))
  cat("\nTotal Goals 2 or 3:",sum(totalgoals==2 | totalgoals==3))
  cat("\nHome win to nil:",sum(XteamA>XteamB & XteamB==0))
  cat("\nAway win to nil:",sum(XteamB>XteamA & XteamA==0))
  
  
}

