library(dplyr)
library(ggplot2)
library(tidyverse)

library("nycflights13")
nycflights13::airports
nycflights13::airports
nycflights13::flights

#Graph 1
flights %>%
  filter(origin %in% c("EWR","JFK","LGA")) %>%
  ggplot() + geom_violin(mapping = aes(x = origin,
                                       y = sched_arr_time,
                                       fill = origin)) +
  scale_fill_manual(values = c("red","white","blue"))

#Graph 2  #Assume it is departure delay

flights  %>%
  mutate(was.flight.delayed = ifelse(dep_delay > 0, "delayed", "not delayed")) %>%
  na.omit(was.flights.delayed) %>%
  ggplot(aes(x = carrier, fill = was.flight.delayed)) + geom_bar(position = "stack") +
  coord_flip() +
  scale_fill_manual(values = c("green","blue"))
  
#Graph 3
flights %>% 
  filter (dep_time < 370, arr_time < 830) %>%
  filter (carrier %in% c("B6", "DL", "EV")) %>%
  ggplot() + geom_point(mapping = aes(x = dep_time, 
                                      y = arr_time, 
                                      color = carrier),
                          shape =4) +
  scale_color_manual(values = c("purple", "yellow","red"))

#Graph 4
flights %>%
  group_by(origin) %>%
  na.omit() %>%
  summarize(avg.air.time = mean(air_time)) %>%
  ggplot(aes(x = reorder(origin, c("JFK","EWR","LGA")), y= avg.air.time, fill = origin)) + 
  geom_bar(stat = "identity") +
  scale_fill_manual(values = c("purple","orange","darkgreen"))


