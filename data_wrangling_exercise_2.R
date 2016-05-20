#Set wd


#Import the titanic_original dataset
titanic_original <- read.csv("~/Desktop/Data Wrangling Exercises/data-wrangling-exercise-2/titanic_original.csv")

#View the imported dataset
View(titanic_original)

#Port of Embarkation - Find the missing calues and replace them with "S"
filter(titanic_original, embarked == "")
titanic_original$embarked[titanic_original$embarked == ""] <- "S"

#Age - Calculate the mean of the Age column and use that to populate the missing values
mean_age <- mean(titanic_original$age, trim = 0, na.rm = TRUE)
titanic_original$age[is.na(titanic_original$age)] <- mean_age

#Age - mean alternatives
# Mean Age by Gender

titanic_original %>% 
  group_by(sex) %>% 
  summarise(mean_age = mean(age, na.rm=FALSE))

female_mean_age <- 28.88694
male_mean_age <-30.43072

#Age - mean age by gender v2
male_mean_age <- titanic_original %>% 
  filter(sex == "male") %>% 
  summarise(mean_age = mean(age, na.rm=FALSE))

female_mean_age <- titanic_original %>% 
  filter(sex == "female") %>% 
  summarise(mean_age = mean(age, na.rm=FALSE))

#Lifeboats - replace blank values with NA
titanic_original$boat[titanic_original$boat == ""] <- "NA"

#Cabins - 
titanic_original$has_cabin_number <- ifelse(titanic_original$cabin == "", 0,1)

