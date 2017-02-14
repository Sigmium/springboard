# Springboard Data Wrangling Exercise 2: Dealing with missing values
#
# load required libraries

library(tidyr)
library(dplR)
library(dplyr)
library(readr)
library(devtools)

# 0: Load the data in RStudio
titanic_original <- read_csv("c:/Users/TDP177/Documents/RFiles/titanic_original.csv")

titanic_clean <- titanic_original

# 1: Port of embarkation

titanic_clean$embarked[is.na(titanic_clean$embarked)] <- "S" 

  # Failed attempts:   
  #titanic_clean$embarked <-  mutate(embarked = replace(titanic_clean$embarked, which(titanic_clean$embarked!="C" & titanic_clean$embarked!="Q" & titanic_clean$embarked!="S"), "A1"))
  #mutate(embarked = sub('^$','S',embarked))  
  #mutate(embarked = sub(is.na(embarked),'S',embarked))

# 2: Age



  # Failed attempts: 
  #titanic_clean$age[is.na(titanic_clean$age)] <- mean(titanic_clean$age)
  #titanic_clean$age[is.na(titanic_clean$age)] <- mean(c(titanic_clean$age))

# 3: Lifeboat

# 4: Cabin

# 6: Submit the project on Github
