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

migraine_headache = filter(migraine, headache == "yes")

head(migraine_headache)

migrainecount <- migraine_headache %>%  
  group_by(agegroup, sex) %>% 
  summarise(Freq = n()) 
migrainecount  

agegroupviz <- ggplot(migrainecount, aes(x=agegroup, y=Freq, group=sex)) + 
  geom_line(aes(color=sex))+
  geom_point(aes(color=sex))

agegroupviz <- agegroupviz + ggtitle("Headache by Age Group") + xlab("Age Group") + ylab("Headache Cases") # Adds titles

agegroupviz

migrainecount$agegroup <- factor(migrainecount$agegroup, levels = c('Below 25', '25 - 40', '40 - 55','55 - 70'))

agegroupviz <- ggplot(migrainecount, aes(x=agegroup, y=Freq, group=sex)) + 
  geom_line(aes(color=sex))+
  geom_point(aes(color=sex))

agegroupviz <- agegroupviz + ggtitle("Headache by Age Group") + xlab("Age Group") + ylab("Headache Cases") # Adds titles

agegroupviz

