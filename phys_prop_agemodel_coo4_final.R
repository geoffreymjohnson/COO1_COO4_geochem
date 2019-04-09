library(rstudioapi)
#physical properties of COO4 at south slough including
#accumulation rates, magnetic susceptibility, organic fraction,
#and CT scan

def.par <- par(no.readonly = TRUE) # save default, for resetting...

xl <- c(0,1)
yl <- c(82,0)

yaxis <- seq(0, 80, 20)
labs <- seq(0,80,20)

#Data extracted from the age model at the depths used to build
#the age model
coo4_pb_dates <- c(1,2,3,4,6,7,8,9,11,13,16,17,18,22,26,29,31)
coo4_c_dates <- 81
coo6_pb_dates <- c(2,6,10,15,23,31,40,45,60,80)
coo6_c_dates <- c(165,180)
coo4_pb_depth <- agemodel_all[agemodel_all$depth %in% coo4_pb_dates, ]
coo6_pb_depth <- agemodel_coo6[agemodel_coo6$depth %in% coo6_pb_dates, ]
coo4_c_depth <- agemodel_all[agemodel_all$depth %in% coo4_c_dates, ]
coo6_c_depth <- agemodel_coo6[agemodel_coo6$depth %in% coo6_c_dates, ]

#Set up plotting scheme
layout(matrix(c(1,1,2,2,2,2,3,3,4,4,5,5,1,1,2,2,2,2,3,3,4,4,5,5,1,1,2,2,2,2,3,3,4,4,5,5), 
         nc=12, byrow = TRUE))

#plot window to hold CT image
par(mar=c(5, 4, 5, 1), xpd=TRUE, cex = .75)
plot(xl, yl, type = 'n', axes=FALSE, xlab="", ylab="", xlim=xl, ylim=yl)
axis(2, at = yaxis, labels = labs, tick = TRUE, line = NA,
     pos = NA, outer = FALSE, font = NA, lty = "solid", col = NULL, col.ticks = NULL,
     hadj = NA, padj = NA)
mtext(side = 2, line = 3, "Depth (cm)", cex= 1)

#Plot of age model (age-depth), accumation rate and 
par(mar=c(5,0,5,0))
min <- (agemodel_all$date + (agemodel_all$min-agemodel_all$median))
max <- (agemodel_all$date + (agemodel_all$max-agemodel_all$median))

age_min_lo <- loess(min ~ agemodel_all$depth, model=FALSE, span=0.5, na.action = "na.exclude")
age_max_lo <- loess(max ~ agemodel_all$depth, model=FALSE, span=0.5, na.action = "na.exclude")

xx <- c(age_max_lo$fitted, rev(age_min_lo$fitted))
yy <- c(rev(age_max_lo$x), age_min_lo$x)
plot(x=agemodel_all$date, y=rev(agemodel_all$depth), type = 'n', col='black', lwd = 2, xlab = "Year AD",yaxt = 'n',ylab = "Age")
polygon(xx, yy, col='grey20')
lines(agemodel_all$date, rev(agemodel_all$depth))
points(coo4_pb_depth$date, coo4_pb_depth$depth +81 - (2*coo4_pb_depth$depth), pch = 17)
points(agemodel_all$date[81],1, pch = 18, cex = 1.5)

par(new = T)

#coo4 accumulation rate calc
accrate <- 1/(c(agemodel_all$median[2:81], 370.8) - agemodel_all$median)
accrate_lo <- loess(accrate ~ agemodel_all$depth, model=FALSE, span=0.25, na.action = "na.exclude")
accrate_mass <- accrate*(loi_mag$bulkDens[1:81])
accrate_lo_mass <- loess(accrate_mass ~ agemodel_all$depth, model=FALSE, span=0.25, na.action = "na.exclude")



#coo6 accumulation rate calc
accrate_coo6 <- 1/(c(agemodel_coo6$median[2:901], 304.6) - agemodel_coo6$median)
accrate_lo_coo6 <- loess(accrate_coo6 ~ agemodel_coo6$depth, model=FALSE, span=0.25, na.action = "na.exclude")
interp_coo6_mass <- approx(loi_mag_coo6$mean_depth, loi_mag_coo6$bulkDens, agemodel_coo6$depth, yleft = .94, yright = .98) 
accrate_coo6_mass <- accrate_coo6*interp_coo6_mass$y
accrate_lo_coo6_mass <- loess(accrate_coo6_mass ~ agemodel_coo6$depth, model=FALSE, span=0.25, na.action = "na.exclude")


#accumulation rate lines
plot(loi_mag$sedRate[1:81], rev(agemodel_all$depth), col = "blue", xlab = "", type= "n", axes = FALSE)
lines(loi_mag$sedRate[1:81], rev(agemodel_all$depth), col = "black", lty = 2)
axis(3, at = pretty(loi_mag$sedRate, n=5), tick = TRUE, line = NA,
     pos = NA, outer = FALSE, font = NA, lty = "solid", col = NULL, col.ticks = NULL,
     hadj = NA, padj = NA)
mtext(side = 3, line = 3, "Sedimentation rate (cm/yr)", cex= 1)

legend(.6,17, legend=c("Sed. rate","Age", "Pb-210", "C-14"), lty = c(2,1,NA,NA), border = c(NA,NA,NA,NA), pch = c(NA,NA,17,18), col = "black", merge = FALSE, xpd = NA)


# Bulk Density, Loss-on-ignition, and Mag. Susc. plots
par(mar=c(5,1,5,1))
plot(loi_mag$bulkDens, loi_mag$depth, ylim = yl, yaxt = 'n', ylab = '', xlab = "Bulk Density (g/cm^3)")
lines(loi_mag$bulkDens, loi_mag$depth)

par(mar=c(5,1,5,1))
plot(loi_mag$orgPer*100, loi_mag$depth, xlim = c(0,10.5),ylim = yl, yaxt = 'n', ylab = '', xlab = "Organic Matter (%)")
lines(loi_mag$orgPer*100, loi_mag$depth)

par(mar=c(5,1,5,1))
plot(loi_mag$X*1000000, loi_mag$depth, yaxt = 'n', ylim = yl, xlab = "MS (10^6-m^3/kg)")
lines(loi_mag$X*1000000, loi_mag$depth)

#Save plot
savePlotAsImage(file = 'FinalFigure2', format = "svg", width = 1100, height = 700)

#Reset par()
par(def.par)  

