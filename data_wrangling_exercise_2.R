#Set wd

#Import the titanic_original dataset
titanic_original <- read.csv("~/Desktop/Data Wrangling Exercises/data-wrangling-exercise-2/titanic_original.csv")

#View the imported dataset
view(titanic_original)

#Port of Embarkation - Find the missing calues and replace them with "S"
filter(titanic_original, embarked == "")
titanic_original$embarked[titanic_original$embarked == ""] <- "S"

#Age - Calculate the mean of the Age column and use that to populate the missing values
mean_age <- mean(titanic_original$age, trim = 0, na.rm = TRUE)
titanic_original$age[is.na(titanic_original$age)] <- mean_age
