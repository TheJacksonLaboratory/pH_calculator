## reads the results in the "Mean" column in the file from ImageJ
library(data.table)
data <- fread("pH_results.csv", select =c("Mean"))

## reformat the table to 3 values (R, G, and B) per row
data_list<-list(data)
pH_data<-matrix(unlist(data_list), ncol=3, byrow=TRUE)

## create matrix with the data from the 6 buffers
buffer_data<-head(pH_data,6)