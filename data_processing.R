library(tidyverse)

EF_Data_v4 <- read_csv("EF_Data_v4.csv", col_types = cols(
  X = col_integer(),
  data_id = col_character(),
  site_id = col_character(),
  patient_label = col_character(),
  site_label = col_integer(),
  site_name = col_character(),
  risk = col_factor(c("HIGH", "LOW")),
  diagnosis = col_factor(c("CANCER", "HIGH_GRADE_DYSPLASIA", "LOW_GRADE_DYSPLASIA",
                           "METAPLASIA","GASTRITIS","NORMAL")),
  .default = col_double())
)

# Filter rows
EF_Data_v4_CANCER <- EF_Data_v4 %>%
  filter(diagnosis == "CANCER") 

EF_Data_v4_CANCER %>%
  write_csv("EF_Data_v4_CANCER.csv")

# Search and replace using across()
# Detailed across notes see notes on 5-Aug-2021.
EF_Data_v4_CDMG <- EF_Data_v4 %>%
  filter(diagnosis != "NORMAL") %>% 
  mutate(across(diagnosis, str_replace, "HIGH_GRADE_DYSPLASIA", "DYSPLASIA")) %>% 
  mutate(across(diagnosis, str_replace, "LOW_GRADE_DYSPLASIA", "DYSPLASIA")) 

EF_Data_v4_CDMG %>%
  write_csv("EF_Data_v4_CDMG.csv")

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




