library(tidyverse)
library(nycflights13)

# page 59
summarize(flights, 
          n_cases  = n(), 
          delay = mean(dep_delay, na.rm = TRUE),
          n_UA    = sum(carrier == "UA", na.rm = TRUE))

sum_delay <- flights %>% 
  group_by(year, month) %>% 
  summarise(
    n_cases  = n(),
    mean_delay = mean(dep_delay, na.rm = TRUE),
    max_delay  = max(dep_delay, na.rm = TRUE),
    min_delay  = min(dep_delay, na.rm = TRUE),
    n_UA    = sum(carrier == "UA", na.rm = TRUE))

# Page 61
delays <- flights %>%
  group_by(dest) %>%
  summarize(
    count = n(),
    dist = mean(distance, na.rm = TRUE),
    delay = mean(arr_delay, na.rm = TRUE)
  ) %>%
  filter(count > 20, dest != "HNL")

