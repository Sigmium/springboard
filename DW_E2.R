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

 # How not to do it:  
 #titanic_clean$embarked <-  mutate(embarked = replace(titanic_clean$embarked, which(titanic_clean$embarked!="C" & titanic_clean$embarked!="Q" & titanic_clean$embarked!="S"), "A1"))
 #mutate(embarked = sub('^$','S',embarked))  
 #mutate(embarked = sub(is.na(embarked),'S',embarked))

titanic_clean$embarked[is.na(titanic_clean$embarked)] <- "S" 

# 2: Age
 
 # How not to do it: 
 # titanic_clean1 <- filter(titanic_clean, !is.na(age)) %>%
 # summarise(titanic_clean1, age_avg = mean(age)) %>%
 # age1 <- age_avg
 # titanic_clean <- titanic_clean1
 # titanic_clean$age[is.na(titanic_clean$age)] <- "1000" 
 # recode(titanic_clean@age, '1000' == age_avg)
 # titanic_clean$age[is.na(titanic_clean$age)] <- "1000" 
 # age1 <- filter(titanic_clean, 'age' != "1000")
 # age1 <- mean(titanic_clean@age, na.rm=TRUE)
 # titanic_clean$age[is.na(titanic_clean$age)] <- mean(titanic_clean$age)
 # titanic_clean$age[is.na(titanic_clean$age)] <- mean(c(titanic_clean$age))

age1 <- summarise(titanic_clean, age_avg = mean(age, na.rm=TRUE))
age1 <- format(age1, digits = 4)
titanic_clean$age[is.na(titanic_clean$age)] <- age1 

# 3: Lifeboat
titanic_clean$boat[is.na(titanic_clean$boat)] <- "N/A"

# 4: Cabin

 # How not to do it: 
 # titanic_clean$has_cabin_number <- titanic_clean$cabin
 #  if (titanic_clean$has_cabin_number(is.na = TRUE)){
 #  titanic_clean$has_cabin_number = 0
 #  } else {
 #  titanic_clean$has_cabin_number = 1
 #  }
 # mutate(titanic_clean$has_cabin_number = sub('^$','1',titanic_clean$cabin))
 # titanic_clean$has_cabin_number[is.na(titanic_clean$has_cabin_number)] <- "0"

titanic_clean$has_cabin_number <- ifelse(titanic_clean$cabin =="", "0", "1")
titanic_clean$has_cabin_number[is.na(titanic_clean$cabin)] <- 0 %>%  

# 6: Submit the project on Github
# github.com/Sigmium/springboard