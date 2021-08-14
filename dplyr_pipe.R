library(tidyverse)

starwars %>%                                            # Start with the starwars dataset
  filter(homeworld == 'Tatooine') %>%                   # THEN retrieve the rows where homeworld == 'Tatooine'
  select(name, species, height, mass, birth_year) %>%   # THEN retrieve the name, species, height, mass, and birth_year variables
  arrange(desc(birth_year))                             # THEN sort the data in descending order, by birth year