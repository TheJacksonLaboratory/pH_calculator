## reads the results in the "Mean" column in the file from ImageJ
library(data.table)
data <- fread("pH_results.csv", select =c("Mean"))

## reformat the table to 3 values (R, G, and B) per row
