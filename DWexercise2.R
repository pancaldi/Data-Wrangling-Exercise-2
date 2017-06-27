# load and install packages in R

library(readxl)
titanic_original_csv <- read_excel("C:/Users/jaqo_000/Desktop/titanic_original.csv.xls")
df <- titanic_original_csv
View(titanic_original_csv)

# port of embarkation

for(i in 1:length(df$embarked)) {
  if(is.na(df$embarked[i]) | is.null(trimws(df$embarked[i])) | trimws(df$embarked[i]) == "") {
    df$embarked[i] <- "S"
  }
}

# age of passengers

meanAge <- mean(df$age, na.rm = TRUE)
df <- mutate(titanic_original_csv, age = ifelse(is.na(age), meanAge, age)) 

# lifeboat

df <- mutate(titanic_original_csv, boat = ifelse(is.null(boat)) | is.na(boat) | trimws(boat) == "", NA, boat)

# cabin

df <- mutate(df, has_cabin_number = ifelse(is.null(cabin) | is.na(cabin) | trimws(cabin) == "", 0, 1))

# write back to csv as titanic_clean.csv

write.csv(titanic_original_csv, file = "titanic_clean_.csv")

