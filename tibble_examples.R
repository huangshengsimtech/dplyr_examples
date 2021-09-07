library(tidyverse)

# Override column types when importing data using readr::read_csv() when there are many columns
# https://stackoverflow.com/questions/31568409/override-column-types-when-importing-data-using-readrread-csv-when-there-are
# 
# It is less advisable to use "skip" to jump columns as this will fail to work 
# if the imported data source structure is changed.
# Set a default column type, and then define any columns that differ from the default.
# The use of "default" is powerful if you have multiple columns and only specific exceptions 
# (such as X and diagnosis).
# E.g., if all columns typically are double, but only 2 columns should be factors

EF_Data_x4 <- read_csv("EF_Data_x4.csv", col_types = cols(
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

# read selected columns only.
EF_Data_x4_subset <- read_csv("EF_Data_x4.csv", col_types = cols_only(
  X = col_integer(),
  data_id = col_character(),
  site_id = col_character(),
  patient_label = col_character(),
  site_label = col_integer(),
  site_name = col_character(),
  risk = col_factor(c("HIGH", "LOW")),
  diagnosis = col_factor(c("CANCER", "HIGH_GRADE_DYSPLASIA", "LOW_GRADE_DYSPLASIA",
                           "METAPLASIA","GASTRITIS","NORMAL"))
  )
)

# four primary types of atomic vectors: logical, integer, double, and character. 
laser_power_75 <- EF_Data_x4$laser_power>75
index <- EF_Data_x4$X
patient <- EF_Data_x4$patient_label
wave_number_800 <- EF_Data_x4$X_800

typeof(index)
typeof(wave_number_800)
typeof(patient)
typeof(laser_power_75)

str(index)
str(wave_number_800)
str(patient)
str(laser_power_75)
head(laser_power_75,100)
tail(laser_power_75,100)

length(index)
length(wave_number_800)
length(patient)
length(laser_power_75)

# factor
typeof(EF_Data_x4$diagnosis)
attributes(EF_Data_x4$diagnosis)

EF_Data_x4 %>%
  count(diagnosis)

ggplot(EF_Data_x4, aes(diagnosis)) +
  geom_bar()

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

