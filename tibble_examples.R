library(tidyverse)

ftr_LMG_Cluster <- read_csv("EF_Data_v4_LMG_cluster.csv")


as_tibble(iris)
iris_tibble <- as_tibble(iris)

new_tibble_test <- tibble(x=1:5, 
                          y=1, 
                          z=x^2+y)
new_tibble_test

new_trible_test <- tribble(
  ~x,~y,~z,
  #--|--|--
  "a", 1,2,
  "b",4,5
)

