# install.packages("tidyverse")
library(tidyverse)
df <- read_csv('COVID_merged.csv') %>% select(-X1)
df %>% glimpse() 

home <- read_csv('home.csv') %>% select(-X1)
home %>% glimpse()
home$sex %>% table()
home$province %>% table()
home$city %>% table()
home$age %>% table()

df$city %>% table() %>% sort()
