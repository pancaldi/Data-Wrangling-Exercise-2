#load data in RStudio

library(dplyr)
library(tidyr) 
library("dummies")
readr::readr_csv(titanic_original_csv)
df <- dfOriginal

#Port of embarkation

for(i in 1:length(df$embarked)) {
if(is.na(df$embarked[i]) | is.null(trimws(df$embarked[i])) | trimws(df$embarked[i]) == "" ) 
df$embarked[i] <- "S"
} 
  
  #Age

meanAge <- mean(df$age, na.rm = TRUE)
df <- mutate(df, age = ifelse(is.na(age), meanAge, age))
    }  
  

#Lifeboat

  df <-mutate(df, boat = ifelse(is.null(boat)) | is.na(boat) |trimws(boat) == " ", NA, boat)
              
# Cabin              

df <- mutate(df, has_cabin_number = ifelse(is.null(cabin)) | trimws(cabin) == " ", 0, 1) 

#Write back to csv

write.csv(df, file = "titanic_clean.csv") 