#physical properties of COO6, including color, 
#age depth relationship and sedimentation rate,
#bulk density and organic fraction from LOI

def.par <- par(no.readonly = TRUE) # save default, for resetting...
#stratigraphic plot colors
col_a <- 'chocolate4'
col_b <- 'grey27'
col_c <- 'grey40'
col_d <- 'black'
col_e <- 'burlywood4'

xl <- c(0,1)
yl <- c(1800,0)

yaxis <- seq(0, 1800, 200)
labs <- seq(0,180,20)

coo6_pb_dates <- c(2,6,10,15,23,31,40,45,60,80)
coo6_c_dates <- c(165,180)
coo6_pb_depth <- agemodel_coo6[agemodel_coo6$depth %in% coo6_pb_dates, ]
coo6_c_depth <- agemodel_coo6[agemodel_coo6$depth %in% coo6_c_dates, ]

#plotting layout for multipanel plots
layout(
  matrix(c(1,1,2,2,2,2,3,3,4,4,1,1,2,2,2,2,3,3,4,4,1,1,2,2,2,2,3,3,4,4), 
         nc=10, byrow = TRUE))

par(mar=c(5, 11, 5, 1), xpd=TRUE, cex = .75)
plot(0, type="n", axes=FALSE, xlab="", ylab="", xlim=xl, ylim=yl)
axis(2, at = yaxis, labels = labs, tick = TRUE, line = NA,
     pos = NA, outer = FALSE, font = NA, lty = "solid", col = NULL, col.ticks = NULL,
     hadj = NA, padj = NA)
mtext(side = 2, line = 3, "Depth (cm)", cex= 1)

#color rectangles for stratigraphic plot
rect(0,0,1,14, density = NULL, angle = 45,
     col = col_a , border = NA)
rect(0,14,1,88, density = NULL, angle = 45,
     col = col_b , border = NA)
rect(0,88,1,118, density = NULL, angle = 45,
     col = col_a , border = NA)
rect(0,118,1,178, density = NULL, angle = 45,
     col = col_b , border = NA)
rect(0,178,1,188, density = NULL, angle = 45,
     col = col_a , border = NA)
rect(0,188,1,208, density = NULL, angle = 45,
     col = col_b , border = NA)
rect(0,208,1,238, density = NULL, angle = 45,
     col = col_a , border = NA)
rect(0,238,1,428, density = NULL, angle = 45,
     col = col_b , border = NA)
rect(0,428,1,498, density = NULL, angle = 45,
     col = col_a , border = NA)
rect(0,498,1,870, density = NULL, angle = 45,
     col = col_b , border = NA)
rect(0,870,1,948, density = NULL, angle = 45,
     col = col_a , border = NA)
rect(0,948,1,968, density = NULL, angle = 45,
     col = col_c , border = NA)
rect(0,968,1,1038, density = NULL, angle = 45,
     col = col_a , border = NA)
rect(0,1038,1,1108, density = NULL, angle = 45,
     col = col_d , border = NA)
rect(0,1108,1,1138, density = NULL, angle = 45,
     col = col_a , border = NA)
rect(0,1138,1,1148, density = NULL, angle = 45,
     col = col_e , border = NA)
rect(0,1148,1,1188, density = NULL, angle = 45,
     col = col_d , border = NA)
rect(0,1188,1,1778, density = NULL, angle = 45,
     col = col_a , border = NA)
rect(0,1778,1,1794, density = NULL, angle = 45,
     col = col_b , border = NA)
rect(0,1794,1,1804, density = NULL, angle = 45,
     col = col_a , border = NA)


#texture rectangles
sand <-20
mixed <- 10
silt_clay <- 0

#plot.new()
#plot.window(xlim, ylim)
#yaxis <- seq(0, 1800, 1)
#axis(2, at = yaxis, labels = TRUE, tick = TRUE, line = NA,
#     pos = NA, outer = FALSE, font = NA, lty = "solid", col = NULL, col.ticks = NULL,
#     hadj = NA, padj = NA)
rect(0,0,1,430, density = silt_clay ,angle = 45,
     col = "black" , border = NA)
rect(0,430,1,500, density = sand ,angle = 45,
     col = "black" , border = NA)
rect(0,500,1,740, density = silt_clay ,angle = 45,
     col = "black" , border = NA)
rect(0,740,1,760, density = sand ,angle = 45,
     col = "black" , border = NA)
rect(0,760,1,910, density = silt_clay ,angle = 45,
     col = "black" , border = NA)
rect(0,910,1,950, density = mixed ,angle = 45,
     col = "black" , border = NA)
rect(0,950,1,970, density = sand ,angle = 45,
     col = "black" , border = NA)
rect(0,970,1,1110, density = silt_clay ,angle = 45,
     col = "black" , border = NA)
rect(0,1110,1,1140, density = sand ,angle = 45,
     col = "black" , border = NA)
rect(0,1140,1,1206, density = silt_clay ,angle = 45,
     col = "black" , border = NA)
rect(0,1206,1,1250, density = sand ,angle = 45,
     col = "black" , border = NA)
rect(0,1250,1,1286, density = silt_clay ,angle = 45,
     col = "black" , border = NA)
rect(0,1286,1,1292, density = sand ,angle = 45,
     col = "black" , border = NA)
rect(0,1292,1,1300, density = silt_clay ,angle = 45,
     col = "black" , border = NA)
rect(0,1300,1,1308, density = sand ,angle = 45,
     col = "black" , border = NA)
rect(0,1308,1,1498, density = silt_clay ,angle = 45,
     col = "black" , border = NA)
rect(0,1498,1,1518, density = mixed ,angle = 45,
     col = "black" , border = NA)
rect(0,1518,1,1698, density = silt_clay ,angle = 45,
     col = "black" , border = NA)
rect(0,1698,1,1708, density = sand ,angle = 45,
     col = "black" , border = NA)
rect(0,1708,1,1758, density = mixed ,angle = 45,
     col = "black" , border = NA)
rect(0,1758,1,1768, density = silt_clay ,angle = 45,
     col = "black" , border = NA)
rect(0,1768,1,1778, density = sand ,angle = 45,
     col = "black" , border = NA)
rect(0,1778,1,1804, density = silt_clay ,angle = 45,
     col = "black" , border = NA)

#age model graphical transformation
min <- (agemodel_coo6$date + (agemodel_coo6$min-agemodel_coo6$median))
max <- (agemodel_coo6$date + (agemodel_coo6$max-agemodel_coo6$median))
age_min_lo <- loess(min ~ agemodel_coo6$depth, model=FALSE, span=0.5, na.action = "na.exclude")
age_max_lo <- loess(max ~ agemodel_coo6$depth, model=FALSE, span=0.5, na.action = "na.exclude")

par(mar=c(5,0,5,0))
xx <- c(age_max_lo$fitted, rev(age_min_lo$fitted))
yy <- c(rev(age_max_lo$x), age_min_lo$x)
plot(x=agemodel_coo6$date, y=rev(agemodel_coo6$depth), type = 'n', col='black', lwd = 2, xlab = "Year AD",yaxt = 'n',ylab = "Age")
polygon(xx, yy, col='grey30')
lines(agemodel_coo6$date, rev(agemodel_coo6$depth))
points(coo6_pb_depth$date, coo6_pb_depth$depth +180 - (2*coo6_pb_depth$depth), pch = 17)
points(coo6_c_depth$date,coo6_c_depth$depth +180 - (2*coo6_c_depth$depth), pch = 18, cex = 2)

#add lines to show the dats and depths of known flood events
floodYear <- 1964
floodDepth <- approx(agemodel_coo6$date, agemodel_coo6$depth, floodYear)
floodX <- c(1690, floodYear, floodYear)
floodY <- c(floodDepth$y + 180 - 2*floodDepth$y,floodDepth$y + 180 - 2*floodDepth$y, 0)            
lines(floodX,floodY, lty = 4)

floodYear <- 1887
floodDepth <- approx(agemodel_coo6$date, agemodel_coo6$depth, floodYear)
floodX <- c(1690, floodYear, floodYear)
floodY <- c(floodDepth$y + 180 - 2*floodDepth$y,floodDepth$y + 180 - 2*floodDepth$y, 0)            
lines(floodX,floodY, lty = 4)

par(new = T)

accrate <- .2/(c(agemodel_coo6$median[2:901], 303.9) - agemodel_coo6$median)
accrate_lo <- loess(accrate ~ agemodel_coo6$depth, model=FALSE, span=0.25, na.action = "na.exclude")

loiDates <- approx(agemodel_coo6$depth, agemodel_coo6$date, xout = loi_mag_coo6$mean_depth, yleft = 2015)
plot(loi_mag_coo6$sedRate, loi_mag_coo6$mean_depth, col = "blue", xlab = "", type= "n", axes = FALSE, xlim=c(0,2), ylim = c(180,0))
lines(loi_mag_coo6$sedRate, loi_mag_coo6$mean_depth, col = "black", lty = 2, lwd = 2, xlim=c(0,1.75), ylim = c(180,0))
axis(3, at = pretty(accrate, n=5), tick = TRUE, line = NA,
     pos = NA, outer = FALSE, font = NA, lty = "solid", col = NULL, col.ticks = NULL,
     hadj = NA, padj = NA)
mtext(side = 3, line = 3, "Sedimentation rate (cm/yr)", cex= 1)

legend(1.3, 100, 
       legend=c("2.5 YR 3/2", "2.5 YR 3/0", '2.5 YR 4/0', '2.5 YR 2/0', '10 YR 3/3', 'Accum.','Date', 'Pb-210', 'C-14'),
       fill = c('chocolate4','grey27', 'grey40', 'black', 'burlywood4',NA,NA,NA,NA), lty = c(NA,NA,NA,NA,NA,2,1,NA,NA),lwd = c(NA,NA,NA,NA,NA,2,1,NA,NA), border = c("black",'black', 'black', 'black', 'black',NA,NA,NA,NA),
       pch = c(NA,NA,NA,NA,NA,NA,NA,17,18),merge = FALSE, xpd = NA,  inset=c(0,0))

#bulk density
par(mar=c(5,1,5,1))
plot(loi_mag_coo6$bulkDens, loi_mag_coo6$mm, yaxt = "n", ylim = c(1800,0), xpd = FALSE, xlab = "Bulk Density (g/cm^3)")
lines(loi_mag_coo6$bulkDens, loi_mag_coo6$mm, xpd=FALSE)

#loi
par(mar=c(5,1,5,1))
plot(loi_mag_coo6$per_org, loi_mag_coo6$mm, yaxt = "n", xlim = c(0,8.3), ylim = c(1800,0), xpd = FALSE, xlab = "Organic Matter (% LOI)")
lines(loi_mag_coo6$per_org, loi_mag_coo6$mm, xpd=FALSE)

#save the plot
savePlotAsImage(file = 'FinalFigure3', format = "svg", width = 1100, height = 700)

#par(old.par)
par(def.par)  #- reset to default
