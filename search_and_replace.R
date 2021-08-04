library(tidyverse)

strings_subs   <- c("subject_a 003", "subject_b 003", "subject_c 003")
strings_treats <- c("treatment x", "treatment y", "treatment z")

set.seed(123)
data <- 
  tibble::tibble(subject   = sample(strings_subs,   100, replace = TRUE),
                 treatment = sample(strings_treats, 100, replace = TRUE),
                 var1 = rnorm(100, 0, 1),
                 var2 = runif(100, 0, 1),
                 var3 = rbeta(100, 1, 1))

renamed_data_across <- 
  data %>% 
  mutate(across("subject", str_replace, " 003", ""))


# The authors of dplyr recommend we use dplyr::across() to target our 
# column(s) of interest. 
# We are specifiying that str_replace() should target the subject column only 
# and take all instances of 003 and replace them with nothing ("").