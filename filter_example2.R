# A quick and dirty guide to the dplyr filter function
# https://www.sharpsightlabs.com/blog/dplyr-filter/
# July 4, 2018 by Joshua Ebner

# dplyr is a set of tools strictly for data manipulation. In fact, there are only 5 primary functions in the dplyr toolkit:
#   
# filter() … for filtering rows
# select() … for selecting columns
# mutate() … for adding new variables
# summarise() … for calculating summary stats
# arrange() … for sorting data

#-------------
# LOAD PACKAGE: the tidyverse package is a collection of packages 
# that contains dplyr, ggplot2
# library(tidyverse) will load the core tidyverse packages: 
# ggplot2, for data visualisation. 
# dplyr, for data manipulation.
#-------------
library(tidyverse)
#------------------
# INSPECT DATAFRAME
#------------------
glimpse(txhousing)

filter(txhousing, year == 2001)

# This summary table shows that there is 522 records for the year 2001, 
# which matches the number of records when we filtered our data with 
# filter(txhousing, year == 2001). 
# So, it looked like our use of filter() worked correctly.
txhousing %>% 
  group_by(year) %>% 
  summarise(record_count = n())

# filter data using two logical conditions
txhousing_Abilene <- filter(txhousing, year == 2001 & city == "Abilene")

filter(txhousing, city == "Austin" | city == "Houston")

filter(txhousing, city %in% c("Austin", "Houston",  "Dallas"))


