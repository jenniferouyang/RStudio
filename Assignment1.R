#install.packages('openintro')
install.packages("ggplot2")
library(openintro)
library(ggplot2)

mariokart

?min

#1 Least Expensive Mario Kart Game with at least 1 steering wheel in Ebay auction
mariokart %>%
  filter(wheels > 0) %>%
  group_by(total_pr, wheels) %>%
  summarize(min(total_pr))
#or
mariokart %>%
  filter(wheels >= 1) %>% select(total_pr, wheels) %>% arrange(total_pr)


#2  Calculate the value of the range of shipping prices for each shipping speed/method.
#Which shipping speed/method had the largest range of shipping prices, and which
#had the smallest range?
mariokart %>%
  group_by(ship_sp, ship_pr) %>%
  summarize(diff = max(ship_pr)- min(ship_pr))


#3 Calculate the mean and median total prices of new Mario Kart games and used
#Mario Kart games. Explain your findings.
mariokart %>%
  filter(cond == "new") %>%
  summarize(mean.price = mean(total_pr),
            median.price = median(total_pr))
mariokart %>%
  filter(cond == "used") %>%
  summarize(mean.price = mean(total_pr),
            median.price = median(total_pr))
#By comparing the median and mean total prices, I found out that the used mariokart's median and mean 
# is lower than new mariokarts' price. 
#The median price of new mariokart is higher than its mean whereas it is the opposite for used mariokarts


##4  Investigate-using whatever method you see fit-why you obtained the results in
#3). (i.e., why are certain mean and median prices not equal.)
mariokart %>%
  filter(cond %in% c("new","used")) %>%
  ggplot() + geom_point(mapping = (aes(x = title, y = total_pr, color = cond))) +
  scale_color_manual(values = c("blue", "Red"))
#The trend for the sales of used and new mariokarts are drastically different: whereas used mariokarts
#sell in a less fluctuated trend, new mariokarts sell at a much larger price range, which explains the
#higher median.


##5 Remove any 'problem points' and/or severe outliers from your data set, if they
#exist. If you choose to remove any, justify why you made this decision. If there
#were no data values to remove, explain how you knew this.

mariokart %>%
  filter(total_pr < 100) %>%
  filter(cond %in% c("new","used")) %>%
  ggplot() + geom_point(mapping = (aes(x = title, y = total_pr, color = cond))) +
  scale_color_manual(values = c("blue", "Red"))
#By removing the 2 points of used kart above 100, this creates a graph that better represents
# the other points


##6 Calculate the median total price for each combination of game condition and
#whether or not the auction contained any number of steering wheels. Report
#these values.
mariokart %>%
  filter(cond %in% c("new","used")) %>%
  group_by(cond) %>%
  filter(wheels %in% c(0,1,2,3,4)) %>%
  group_by(cond, wheels) %>%
  summarize(median.pr = median(total_pr))

##7Suppose you only have $50 to spend. Without manually counting, determine the
#proportion of games new and used Mario Kart games you would be able to purchase

 #Suppose I am taking the median price of mario karts with 0 wheels, I will be able to purchase
 # either 1.05 new mariokarts or 1.31 used mariokart.
 #or
mariokart %>%
  filter(total_pr < 50) %>%
  filter(cond %in% c("new","used")) %>%
  ggplot() + geom_point(mapping = (aes(x = title, y = total_pr, color = cond))) +
  scale_color_manual(values = c("blue", "Red"))
#Given how there is no mariokart lower than 25$ it will be impossible to buy more than 1 mariokart
#with 50 dollars

##8 Finally, if you were to sell your copy of Mario Kart Wii on ebay (and assuming
#you could magically control all possible variables), determine the optimal set of
#variables to maximize the total selling price of your game. Be sure to justify your
#answer based on your findings in 1)-7).

mariokart %>%
  arrange(-total_pr)
#Based on the highest sold price, I should sell id 10e11 mariokart.


            