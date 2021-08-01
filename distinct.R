library(tidyverse)
library(dplyr)
df <- tibble(
  x = sample(10, 100, rep = TRUE),
  y = sample(10, 100, rep = TRUE)
)
nrow(df)
nrow(distinct(df))
nrow(distinct(df,x))
nrow(distinct(df,y))
nrow(distinct(df,x,y))
distinct(df,x)
distinct(df,y)
# You can choose to keep all other variables as well
distinct(df,x,.keep_all = TRUE)
distinct(df,y,.keep_all = TRUE)
