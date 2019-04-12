#charleston DO data
#count the nuber of records above water (NA) values
#install.packages("stringr")
#spilt the date/time column
#add the library with string manipulation functions
library(stringr)


# for CHDOdata_02_07
DateTimeStamp <- data.frame(str_split_fixed(CHDOdata_02_07$DateTimeStamp, " ", 2))
#OR witht the date into 3 columns for day month and year (how do we set the col name?)
date_time <- data.frame(str_split_fixed(DateTimeStamp$X1, "/", 3))
colnames(date_time) <- c("month", "day", "year")
#set up a new data.frame to hold the DO and date
DO <- data.frame(CHDOdata_02_07$DO_mgl)
CHDOdata_02_07_date_time <- cbind(DO, date_time, deparse.level = 0)
colnames(CHDOdata_02_07_date_time) <- c("DO", "month", "day", "year")

# for CHDOdata_07_12
DateTimeStamp <- data.frame(str_split_fixed(CHDOdata_07_12$DateTimeStamp, " ", 2))
#OR witht the date into 3 columns for day month and year (how do we set the col name?)
date_time <- data.frame(str_split_fixed(DateTimeStamp$X1, "/", 3))
colnames(date_time) <- c("month", "day", "year")
#set up a new data.frame to hold the DO and date
DO <- data.frame(CHDOdata_07_12$DO_mgl)
CHDOdata_07_12_date_time <- cbind(DO, date_time, deparse.level = 0)
colnames(CHDOdata_07_12_date_time) <- c("DO", "month", "day", "year")

# for CHDOdata_12_16
DateTimeStamp <- data.frame(str_split_fixed(CHDOdata_12_16$DateTimeStamp, " ", 2))
#OR witht the date into 3 columns for day month and year (how do we set the col name?)
date_time <- data.frame(str_split_fixed(DateTimeStamp$X1, "/", 3))
colnames(date_time) <- c("month", "day", "year")
#set up a new data.frame to hold the DO and date
DO <- data.frame(CHDOdata_12_16$DO_mgl)
CHDOdata_12_16_date_time <- cbind(DO, date_time, deparse.level = 0)
colnames(CHDOdata_12_16_date_time) <- c("DO", "month", "day", "year")

#combine all the files into dataframes,
#reduced columns
DO_date_time <- rbind.data.frame(CHDOdata_02_07_date_time, CHDOdata_07_12_date_time, CHDOdata_12_16_date_time)



#now trying to add up the time under some DO threshold
#set up a list of all years in the dataset
yrs_02_15 <- c(2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010,2011,2012,2013,2014, 2015)
#pick a DO threshold to count under

threshold <- 1
#create a list to hold output
below <- list()
#loop through each year and count up the records
for (i in yrs_02_15[1:13]) {
  below <- append(below, nrow(subset(DO_date_time, DO <= threshold & year == i)))
}  
below
# turn the lists into data elements
CH_DO_below1 <- matrix(unlist(below, recursive = TRUE, use.names = TRUE))

threshold <- 2
#create a list to hold output
below <- list()
#loop through each year and count up the records
for (i in yrs_02_15[1:13]) {
  below <- append(below, nrow(subset(DO_date_time, DO <= threshold & year == i)))
}  
below
# turn the lists into data elements
CH_DO_below2 <- matrix(unlist(below, recursive = TRUE, use.names = TRUE))

threshold <- 3
#create a list to hold output
below <- list()
#loop through each year and count up the records
for (i in yrs_02_15[1:13]) {
  below <- append(below, nrow(subset(DO_date_time, DO <= threshold & year == i)))
}  
below
# turn the lists into data elements
CH_DO_below3 <- matrix(unlist(below, recursive = TRUE, use.names = TRUE))

threshold <- 4
#create a list to hold output
below <- list()
#loop through each year and count up the records
for (i in yrs_02_15[1:13]) {
  below <- append(below, nrow(subset(DO_date_time, DO <= threshold & year == i)))
}  
below
# turn the lists into data elements
CH_DO_below4 <- matrix(unlist(below, recursive = TRUE, use.names = TRUE))

threshold <- 5
#create a list to hold output
below <- list()
#loop through each year and count up the records
for (i in yrs_02_15[1:13]) {
  below <- append(below, nrow(subset(DO_date_time, DO <= threshold & year == i)))
}  
below
# turn the lists into data elements
CH_DO_below5 <- matrix(unlist(below, recursive = TRUE, use.names = TRUE))


years_02_15 <- matrix(unlist(yrs_02_15, recursive = TRUE, use.names = TRUE))
#plot it
plot(years_02_15[1:13], CH_DO_below5)

