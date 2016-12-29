## reads the results in the "Mean" column in the file from ImageJ
library(data.table)
data <- fread("results.csv", select =c("Mean"))

## reformat the table to 3 values (R, G, and B) per row
data_list<-list(data)
pH_data<-matrix(unlist(data_list), ncol=3, byrow=TRUE)

## create matrix with the data from the 6 buffers
buffer_data<-head(pH_data,6)
buffers=matrix(c(4,4.63,5,6,6.8,7),nrow=6,ncol=1)
tbuffers<-cbind2(buffers,buffer_data)
colnames(tbuffers)<- c("pH","R","G","B")
tbuffersframe<-as.data.frame(tbuffers)

## multiple regression on tbuffers
fit<-lm(pH ~ R + G + B, data=tbuffersframe)
intercept<-summary(fit)$coefficients[1,1]
Rest<-summary(fit)$coefficient[2,1]
Gest<-summary(fit)$coefficient[3,1]
Best<-summary(fit)$coefficient[4,1]

## calculation of pH in matrix
pH_results<-matrix(apply(pH_data, 1, function(x) intercept+x[1]*Rest+x[2]*Gest+x[3]*Best))
colnames(pH_results)<- c("pH")

## save results to a file
write.csv(pH_results, file="pH_results.csv")