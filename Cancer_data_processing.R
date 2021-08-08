library(tidyverse)

# Default options
if(file.exists("config.txt")){
  source("config.txt")
} else {
  stop("ERROR! config.txt not found")
}

###########################################################
OD <- read_csv(infile_OD) %>%
  select(x)%>% 
  rename(OD = x)

SD <- read_csv(infile_SD) %>%
  select(x)%>% 
  rename(SD = x)

read_csv(infile_data) %>%
  bind_cols(OD, SD) %>%
  write_csv(outfile)
##############################################################



OD <- read_csv("OD1.csv") %>%
  select(x)%>% 
  rename(OD = x)

SD <- read_csv("SD1.csv") %>%
  select(x)%>% 
  rename(SD = x)

Data_cancer <- read_csv("EF_Data_v4_Cancer.csv") %>%
  bind_cols(OD, SD)

Data_cancer_outlier_OD <- Data_cancer %>% 
  mutate(outlier_OD = case_when(OD >= 70 ~ 'Yes'
                                     ,(test_score_vector >= 60) & (major != 'statistics') ~ 'Pass'
                                     ,TRUE ~ 'No'))

Data_cancer_outlier_OD_SD <- Data_cancer %>% 
  mutate(outlier_OD = case_when(OD >= 70 ~ 'Yes'
                                ,(test_score_vector >= 60) & (major != 'statistics') ~ 'Pass'
                                ,TRUE ~ 'No'))


#####################################################
OD1 <- read_csv("OD1.csv")
OD2 <- select(OD1, x)
OD3 <- rename(OD2, OD = x)

OD4 <- read_csv("OD1.csv") %>%
  select(x)%>% 
  rename(OD = x)
######################################################
SD1 <- read_csv("SD1.csv")
SD2 <- select(SD1, x)
SD3 <- rename(SD2, SD = x)

SD4 <- read_csv("SD1.csv") %>%
  select(x)%>% 
  rename(SD = x)
######################################################
Data_cancer1 <- read_csv("EF_Data_v4_Cancer.csv")
Data_cancer2 <- bind_cols(Data_cancer1,OD3,SD3)
write_csv(Data_cancer2, "EF_Data_v4_Cancer_OD_SD.csv")

Data_cancer3 <- read_csv("EF_Data_v4_Cancer.csv") %>%
  bind_cols(OD4, SD4)
write_csv(Data_cancer3, "EF_Data_v4_Cancer_OD_SD.csv")


