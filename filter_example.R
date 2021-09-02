library(tidyverse)
data(starwars)
xxx <- filter(starwars, species == "Droid")
# In original example, row.names was used. But for our case, I have to remove 
# row.names in order to run PCA. I do not know why. but I still keep an example
# of row.names here.
#data_EF <- read.csv(file="EF_Data_v4.csv", header=T, sep=",", row.names=2)
EF_Data_v4 <- read.csv(file="EF_Data_v4.csv", header=T, sep=",")
is.data.frame(EF_Data_v4)  # dplyr work on dataframe

EF_Data_v4_colnames <- colnames(EF_Data_v4)
is.list(EF_Data_v4_colnames)   # FALSE
is.array(EF_Data_v4_colnames)  # FALSE
is.vector(EF_Data_v4_colnames) # TRUE
#convert the vector to dataframe for easy to use
EF_Data_v4_colnames <- data.frame(EF_Data_v4_colnames)

EF_Data_v4_diagnosis <- distinct(EF_Data_v4, diagnosis)
is.data.frame(EF_Data_v4_diagnosis)

# The main purpose is the filter to get below dataframe.
EF_Data_v4_IM <- filter(EF_Data_v4, diagnosis == "METAPLASIA")

EF_Data_v4_IM_patient_label <- distinct(EF_Data_v4_IM, patient_label)
# use number of row function to count total number of IM patient.
EF_Data_v4_IM_patient_total_number <- nrow(EF_Data_v4_IM_patient_label)
# use number of row function to count total number of IM spectrum. 
EF_Data_v4_IM_spectrum_total_number <- nrow(EF_Data_v4_IM)

