#count the nuber of records above water (NA) values
#install.packages("stringr")
#spilt the date/time column
#add the library with string manipulation functions
library(stringr)


# for DOdata_99_04
DateTimeStamp <- data.frame(str_split_fixed(DOdata_99_04$DateTimeStamp, " ", 2))
#OR witht the date into 3 columns for day month and year (how do we set the col name?)
date_time <- data.frame(str_split_fixed(DateTimeStamp$X1, "/", 3))
colnames(date_time) <- c("month", "day", "year")
#set up a new data.frame to hold the DO and date
DO <- data.frame(DOdata_99_04$DO_mgl)
DOdata_99_04_date_time <- cbind(DO, date_time, deparse.level = 0)
colnames(DOdata_99_04_date_time) <- c("DO", "month", "day", "year")

# for DOdata_04_09
DateTimeStamp <- data.frame(str_split_fixed(DOdata_04_09$DateTimeStamp, " ", 2))
#OR witht the date into 3 columns for day month and year (how do we set the col name?)
date_time <- data.frame(str_split_fixed(DateTimeStamp$X1, "/", 3))
colnames(date_time) <- c("month", "day", "year")
#set up a new data.frame to hold the DO and date
DO <- data.frame(DOdata_04_09$DO_mgl)
DOdata_04_09_date_time <- cbind(DO, date_time, deparse.level = 0)
colnames(DOdata_04_09_date_time) <- c("DO", "month", "day", "year")

# for DOdata_09_14
DateTimeStamp <- data.frame(str_split_fixed(DOdata_09_14$DateTimeStamp, " ", 2))
#OR witht the date into 3 columns for day month and year (how do we set the col name?)
date_time <- data.frame(str_split_fixed(DateTimeStamp$X1, "/", 3))
colnames(date_time) <- c("month", "day", "year")
#set up a new data.frame to hold the DO and date
DO <- data.frame(DOdata_09_14$DO_mgl)
DOdata_09_14_date_time <- cbind(DO, date_time, deparse.level = 0)
colnames(DOdata_09_14_date_time) <- c("DO", "month", "day", "year")

#combine all the files into a dataframe
DO_date_time <- rbind.data.frame(DOdata_99_04_date_time, DOdata_04_09_date_time, DOdata_09_14_date_time)

#now trying to add up the time under some DO threshold
#set up a list of all years in the dataset
yrs <- c(1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010,2011,2012,2013,2014)
#pick a DO threshold to count under

threshold <- 1
#create a list to hold output
below <- list()
#loop through each year and count up the records
for (i in yrs[1:16]) {
  below <- append(below, nrow(subset(DO_date_time, DO <= threshold & year == i)))
}  
below
# turn the lists into data elements
DO_below1 <- matrix(unlist(below, recursive = TRUE, use.names = TRUE))

threshold <- 2
#create a list to hold output
below <- list()
#loop through each year and count up the records
for (i in yrs[1:16]) {
  below <- append(below, nrow(subset(DO_date_time, DO <= threshold & year == i)))
}  
below
# turn the lists into data elements
DO_below2 <- matrix(unlist(below, recursive = TRUE, use.names = TRUE))

threshold <- 3
#create a list to hold output
below <- list()
#loop through each year and count up the records
for (i in yrs[1:16]) {
  below <- append(below, nrow(subset(DO_date_time, DO <= threshold & year == i)))
}  
below
# turn the lists into data elements
DO_below3 <- matrix(unlist(below, recursive = TRUE, use.names = TRUE))

threshold <- 4
#create a list to hold output
below <- list()
#loop through each year and count up the records
for (i in yrs[1:16]) {
  below <- append(below, nrow(subset(DO_date_time, DO <= threshold & year == i)))
}  
below
# turn the lists into data elements
DO_below4 <- matrix(unlist(below, recursive = TRUE, use.names = TRUE))

threshold <- 5
#create a list to hold output
below <- list()
#loop through each year and count up the records
for (i in yrs[1:16]) {
  below <- append(below, nrow(subset(DO_date_time, DO <= threshold & year == i)))
}  
below
# turn the lists into data elements
DO_below5 <- matrix(unlist(below, recursive = TRUE, use.names = TRUE))


years <- matrix(unlist(yrs, recursive = TRUE, use.names = TRUE))


plot(years,DO_below5)
