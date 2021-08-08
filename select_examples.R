library(tidyverse)

# For better printing
iris <- as_tibble(iris)
starwars <- as_tibble(starwars)

# Select variables by name
starwars %>% select(height)

# Select multiple variables by separating them with commas. 
#Note how the order of columns is determined by the order of inputs.
starwars %>% select(homeworld, height, mass)

# Select variables by name
starwars %>% select(mass)

