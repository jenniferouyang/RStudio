#install.packages("dplyr")
#install.packages('ggplot2')
#install.packages('tidyverse')
library (dplyr)
library(ggplot2)
library(tidyverse)
install.packages("nycflights13")
library(nycflights13)


nycflights13::airlines
nycflights13::flights
nycflights13::airports
nycflights13 %>%
  filter(name == Burlington Airport | name == Logan Airport)

nycflights13::airports
nycflights13 %>%
  Filter(Burlington Airport)

filter(nycflights13, Burlington Airport)
