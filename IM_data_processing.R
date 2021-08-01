library(dplyr)
#Read data
ftr_LMG_Cluster <- read.csv("EF_Data_v4_LMG_cluster.csv")

IM_Antrum <- filter(ftr_LMG_Cluster, diagnosis == "METAPLASIA" & site_name == "Antrum")

IM_Antrum_patient <- IM_Antrum %>%
  group_by(patient_label) %>%
  summarise(length(unique(data_id)))

write.csv(IM_Antrum_patient, file = "IM_Antrum_patient.csv")