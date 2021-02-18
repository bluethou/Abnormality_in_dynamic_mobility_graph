library(tidyverse)
library(lubridate)
pop <- read_csv("SeoulFloating.csv")
# float <- pop %>% group_by(date, city) %>% summarise(fp_sum = sum(fp_num))
# float
# 
# pop %>% group_by(date) %>% 
#   filter(city =="Songpa-gu") %>% 
#   summarise(fp_sum = log(sum(fp_num))) %>% 
#   plot()

satdays = seq(from =ymd("2020-01-18"),to= ymd("2020-06-20"), by="weeks")

pop %>% filter(date %in%satdays)  %>% group_by(date) %>% 
  filter(city =="Guro-gu") %>% 
  summarise(fp_sum = (sum(fp_num))) %>% 
  plot()

patients <- read_csv("PatientInfo.csv")
patients_by_city <- patients %>% group_by(confirmed_date, city) %>% count()
patients_by_city %>% filter(city =="Nowon-gu")
patients %>% group_by(week = cut(satdays)) %>% summarise(value = count())
