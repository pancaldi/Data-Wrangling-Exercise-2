# load data in RStudio

library(readr)
titanic_original_csv <- read_excel("C:/Users/jaqo_000/Desktop/titanic_original.csv.xls")
View(titanic_original_csv) 
library(tidyverse)

# Port of embarkation

for(i in 1:length(df$embarked)) {
if(is.na(df$embarked[i]) | is.null(trimws(df$embarked[i])) | trimws(df$embarked[i]) == "" ) 
df$embarked[i] <- "S"
} 
  
# mean of age column

titanic_original$age[is.na(titanic_original$age)] <- mean(titanic_original$age)
titanic_original$age

# another way to determine mean of age 

meanAge <- mean(titanic_original_csv$age, na.rm = TRUE)
titanic_original <- mutate(titanic_original_csv, age = ifelse(is.na(age), meanAge, age)) 

# Lifeboat

titanic_original_csv <-mutate(titanic_original_csv, boat = ifelse(is.null(boat)) | is.na(boat) |trimws(boat) == " ", NA, boat)
              
# Cabin              

titanic_original_csv$has_cabin_number <- as.numeric(!(is.na(titanic_original_csv$cabin))) 

# Write back to csv

write.csv(titanic_original_csv, file = "titanic_clean.csv") 

