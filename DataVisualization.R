# Importing the library
library(ggplot2)


# Reading the file
migraine <- read.csv(file = 'G15dataset_KosteckiDillon.csv')

# Printing the data
head(migraine)

# Use dplyr
library(dplyr)

viz1_pre <- migraine %>%
  count(headache, sex, sort = TRUE) 

head(viz1_pre)

library(tidyr)

viz1_final <-viz1_pre %>% spread(sex,n)
head(viz1_final)

bp<- ggplot(viz1_final, aes(x="", y=female, fill=headache))+
  geom_bar(width = 1, stat = "identity")
pie <- bp + coord_polar("y", start=0)
pie <- pie + ggtitle("Headache for Female") # Adds titles

pie

bp2<- ggplot(viz1_final, aes(x="", y=male, fill=headache))+
  geom_bar(width = 1, stat = "identity")
pie2 <- bp2 + coord_polar("y", start=0)
pie2 <- pie2 + ggtitle("Headache for Male") 
pie2

p = ggplot(viz1_pre, aes(x = factor(1), y = n, fill = factor(headache))) + 
  geom_bar(stat = "identity", width = 1) + 
  theme(legend.position = "none") +
  scale_x_discrete(NULL, expand = c(0,0)) +
  scale_y_continuous(NULL, expand = c(0,0)) + 
  coord_polar(theta = "y") +
  facet_wrap(~sex)
p
p <- p + ggtitle("Headache by Sex for Migraine Patients") + xlab("") + ylab("Sex") # Adds titles

p <- p + facet_grid(facets=. ~ sex) # Side by side bar chart

p <- p + coord_polar("y") # side by side pie chart
p

