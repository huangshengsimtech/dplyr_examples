#--------------
# LOAD PACKAGES
#--------------
library(caret)
library(tidyverse)
#-----------------------
# LOAD 'Sacramento' DATA
#-----------------------

data("Sacramento")
#------------
# RENAME DATA
#------------
sacramento_housing <- Sacramento
sacramento_housing %>% glimpse()
#----------------------------
# ADD VARIABLE USING mutate()
#----------------------------
sacramento_housing <- mutate(sacramento_housing, price_per_sqft = price/sqft)
