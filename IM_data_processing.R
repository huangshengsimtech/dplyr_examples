library(tidyverse)
#Read data
ftr_LMG_Cluster <- read.csv("EF_Data_v4_LMG_cluster.csv")

ftr_LMG_Cluster_tibble <- as_tibble(ftr_LMG_Cluster)

IM_Antrum <- filter(ftr_LMG_Cluster, diagnosis == "METAPLASIA" & site_name == "Antrum")

IM_Antrum_patient <- IM_Antrum %>%
  group_by(patient_label) %>%
  summarise(length(unique(data_id)))

IM_Antrum_patient_count <- rename(IM_Antrum_patient, count = "length(unique(data_id))")


IM_Antrum_patient <- IM_Antrum %>%
  group_by(patient_label) %>%
  summarise(count = length(unique(data_id)))


write.csv(IM_Antrum_patient, file = "IM_Antrum_patient.csv")

# Search and replace using across()
EF_Data_v4_IM <- EF_Data_v4 %>%
  filter(diagnosis == "METAPLASIA") %>% 
  mutate(across(diagnosis, str_replace, "METAPLASIA", "IM")) 

EF_Data_v4_IM %>%
  write_csv("EF_Data_v4_IM.csv")
