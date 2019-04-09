
#setwd("/media/geoffrey/BUG/COO4_R/COO4")
#setwd("F:/COO4")

#agemodel <- read.csv("COO4_Bindord_0_32.csv")
# or 
agemodel <- read.csv("COO4_age.csv")
agemodel_all <- read.csv("coo4_17_ages.csv")

#DO data
#Valino Island 
DOdata_94_99 <- read.csv("C:/Users/gmj/Documents/R/COO/COO4/DO/SOSVAWQ.csv")
DOdata_99_04 <- read.csv("/media/geoffrey/BUG/COO4_R/COO4/DO/99_04.csv", skip=2)
DOdata_04_09 <- read.csv("/media/geoffrey/BUG/COO4_R/COO4/DO/04_09.csv", skip=2)
DOdata_09_14 <- read.csv("/media/geoffrey/BUG/COO4_R/COO4/DO/09_14.csv", skip=2)

#charleston Bridge
CHDOdata_02_07 <- read.csv("DO/char02_07.csv", skip=2)
CHDOdata_07_12 <- read.csv("DO/char07_12.csv", skip=2)
CHDOdata_12_16 <- read.csv("DO/char12_16.csv", skip=2)


xrf <- read.csv("COO4_xrf.csv")

loi_mag <- read.csv("COO4_LOI_MAGSUS.csv")

timber <- read.csv("coos_timber_harvest.csv")

pop <- read.csv("census_data.csv")

pdo <- read.csv("pdo1900_2015.csv")

discharge <- read.csv("sfk_03_15.csv")
dis_stats <- read.csv("sfk_03_15_stats.csv")

coo6_ss <- read.csv("coo6_ss.csv")

#coo6 data files
#for comparison to coo4
agemodel_coo6 <- read.csv("coo6_ages_cm.csv")

coo6_xrf <- read.csv("coo6_ITRAX_0_1804_composite_final.csv")

ages_coo6_ss <- approx(agemodel_coo6$depth, agemodel_coo6$date, coo6_ss$depth)

loi_mag_coo6 <- read.csv("COO6_LOI.csv")


