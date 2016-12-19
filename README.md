# pee-H-calculator

We started measuring the pH in mouse urine using pH strips. Strips are photographed and the RGB-values of each strip are measured in Fiji.
This results in an Excel file which multiple columns, including a column with the 3 measurements for each sample.

The pH-calculater needs to be able to do the following:

Step 1: Read the csv file and convert the column with the RGB measurements into a matrix with 3 values in each row

Step 2: Take the first 6 rows and associate them with the 6 pH buffers

Step 3: Do a multiple regression on this data and determine the Intercept and the corrections for R, G, and B

Step 4: Calculate the pH for all the following rows. Produce a csv file as output
