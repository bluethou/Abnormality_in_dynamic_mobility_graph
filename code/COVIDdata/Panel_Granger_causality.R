# install.packages("plm")
library(plm)
library(tidyverse)
data("Grunfeld", package = "plm")
pgrangertest(inv ~ value, data = Grunfeld)
pgrangertest(inv ~ value, data = Grunfeld, order = 2L)
pgrangertest(inv ~ value, data = Grunfeld, order = 2L, test = "Zbar")

roud# varying lag order (last individual lag order 3, others lag order 2)
pgrangertest(inv ~ value, data = Grunfeld, order = c(rep(2L, 9), 3L))

df <- read_csv("paneldata.csv") %>% relocate(index)
df
individuals = df$index %>% unique() %>% length()

pgrangertest(patient ~ flopop, data = df, order = 1L) # Yes
pgrangertest(flopop ~ patient, data = df, order = 1L) # No

# We excloud index =7, as they failed to pass the stationarity test
pgrangertest(flopop ~ confirmation, data = df %>% filter(index != 7), order = 1L) #No
pgrangertest(confirmation ~ flopop, data = df %>% filter(index != 7), order = 1L) # yes

pgrangertest(confirmation ~ patient, data = df %>% filter(index != 7), order = 1L) #Yes
pgrangertest(patient ~ confirmation, data = df %>% filter(index != 7), order = 1L) #No

#################3
data("EmplUK", package="plm")
EmplUK

z2 <- pgmm(log(emp) ~ lag(log(emp), 1)+ lag(log(wage), 0:1) +
             lag(log(capital), 0:1) | lag(log(emp), 2:99) +
             lag(log(wage), 2:99) + lag(log(capital), 2:99),        
           data = EmplUK, effect = "twoways", model = "onestep", 
           transformation = "ld")

summary(z2, robust = TRUE)



E <- pdata.frame(df, index=c("index","time"), drop.index=TRUE, row.names=TRUE)
head(E)

############3
nondif = read.csv("paneldata_nondiff.csv")
nondif
E <- pdata.frame(nondif, index=c("index","time"), drop.index=TRUE, row.names=TRUE)
E

z3 <- pgmm((patient) ~ lag((flopop),1:2)  | lag(log(flopop), 3:5), data = E)
