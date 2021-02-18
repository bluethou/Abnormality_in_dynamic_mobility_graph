library(tidyverse)
library("scales")
df <- read_csv("PatientInfo.csv")
df = df %>% filter(province %in% c("Seoul", "Gyeonggi-do", "Incheon"))
df %>% select(confirmed_date)

# dates <- read.csv("http://pastebin.com/raw.php?i=sDzXKFxJ", sep=",", header=T)
df$confirmed_date <- as.Date(df$confirmed_date)

hist(df$confirmed_date, "weeks", freq = TRUE)



routes <- read_csv("PatientRoute.csv")
glimpse(routes)
routes


patient<- read_csv("PatientInfo.csv")
patient %>% arrange(desc(contact_number)) %>% View()
routes %>% filter(patient_id == 2000000006)
patient %>% filter(patient_id==2000000006)

routes %>% filter(patient_id == 1000000013)
patient %>% filter(patient_id == 1000000013)

# who visted Gangnam
routes %>% filter(city %in% c("Gangnam-gu", "Songpa-gu")) %>% head()
