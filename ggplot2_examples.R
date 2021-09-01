library(tidyverse)

ggplot(mpg, aes(manufacturer)) +
  geom_bar()

mpg
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))


