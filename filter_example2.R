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
