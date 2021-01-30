# Importing the library
library(ggplot2)

# Use dplyr
library(dplyr)

# Reading the file
migraine <- read.csv(file = 'G15dataset_KosteckiDillon.csv')

# Printing the data
head(migraine)

# Feature Extraction

migraine <- migraine %>% mutate(agegroup = case_when(age <= 25 ~ 'Below 25',
                                                     age >= 25  & age <= 40 ~ '25 - 40',
                                                     age >= 40  & age <= 55 ~ '40 - 55',
                                                     age >= 55  & age <= 70 ~ '55 - 70'
                                             )) # end function

head(migraine)

migrainecount <- migraine %>%  
  group_by(agegroup, headache) %>% 
  summarise(Freq = n()) 
migrainecount  

agegroupviz <- ggplot(migrainecount, aes(x=agegroup, y=Freq, fill=headache)) + 
  geom_bar(stat="identity", position="dodge")

agegroupviz <- agegroupviz + ggtitle("Headache by Age Group") + xlab("Age Group") + ylab("Headache Cases") # Adds titles

agegroupviz
