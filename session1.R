library(tidyverse)

starwars

view(starwars)

starwars_DW <- filter(starwars, species == "Droid" | species == "Wookiee")

# Select variables by name
starwars_select_height <- select(starwars, height)

# Select multiple variables by separating them with commas. 
# Note how the order of columns is determined by the order of inputs.
starwars_select <- select(starwars, name, species, height, mass)

# create a new variable called weight_lbs 
# that will be equal to the value in the mass variable, times 2.2.
starwars_mutate <- mutate(starwars, weight_lbs = mass * 2.2)

# we’ll sort by height
starwars_arrange <- arrange(starwars, height)
# We can sort in descending order by using the desc() helper function.
starwars_arrange_desc <- arrange(starwars, desc(height))

# calculate the average height
starwars_summarise <- summarise(starwars, 
                                ave_height = mean(height, na.rm = TRUE),
                                ave_weight = mean(mass, na.rm = TRUE))

starwars_pipe <- starwars %>% 
  filter(species == "Droid" | species == "Wookiee") %>%
  select(name, species, height, mass) %>%
  mutate(weight_lbs = mass * 2.2) %>%
  arrange(height)

# n() gives the current group size.
starwars_summarise_pipe <- starwars %>% 
  filter(species == "Droid" | species == "Wookiee") %>%
  select(name, species, height, mass) %>%
  mutate(weight_lbs = mass * 2.2) %>%
  group_by(species) %>%
  summarise(ave_height = mean(height, na.rm = TRUE),
            ave_weight = mean(mass, na.rm = TRUE),
            count = n())

clustering_results <- read_csv("clustering_results.csv")

clustering_counts_6 <- clustering_results %>%
  group_by(Cluster) %>%
  summarise(
    CANCER = sum(diagnosis == "CANCER", na.rm=T),
    HIGH_GRADE_DYSPLASIA = sum(diagnosis == "HIGH_GRADE_DYSPLASIA", na.rm=T),
    LOW_GRADE_DYSPLASIA = sum(diagnosis == "LOW_GRADE_DYSPLASIA", na.rm=T),
    METAPLASIA = sum(diagnosis == "METAPLASIA", na.rm=T),
    GASTRITIS = sum(diagnosis == "GASTRITIS", na.rm=T),
    NORMAL = sum(diagnosis == "NORMAL", na.rm=T)) 



read_csv("clustering_results.csv") %>%
  group_by(Cluster) %>%
  summarise(
    CANCER = sum(diagnosis == "CANCER", na.rm=T),
    HIGH_GRADE_DYSPLASIA = sum(diagnosis == "HIGH_GRADE_DYSPLASIA", na.rm=T),
    LOW_GRADE_DYSPLASIA = sum(diagnosis == "LOW_GRADE_DYSPLASIA", na.rm=T),
    METAPLASIA = sum(diagnosis == "METAPLASIA", na.rm=T),
    GASTRITIS = sum(diagnosis == "GASTRITIS", na.rm=T),
    NORMAL = sum(diagnosis == "NORMAL", na.rm=T)) %>%
  write_csv("clustering_counts_6.csv")
