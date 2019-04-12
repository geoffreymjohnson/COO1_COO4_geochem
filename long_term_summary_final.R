#Set par() for 5 panels vertically
op <- par(mfrow = c(5,1))

#Color for the shaded mid-century low PDO phase
color <- rgb(190, 190, 190, alpha=80, maxColorValue=255)

#Plot the South Slough proxy data
par(mar = c(2,5,0,5))
plot(agemodel_all$date, xrf$Ni[1:81]/xrf$Ti[1:81], xaxt = 'n', xlim = c(1650,2016),xlab = "", ylab = "SS Ni/Ti", col = "indianred3", pch = 16)
lines(agemodel_all$date, predict(age_lo_ni_ti), lwd=1)
arrows(agemodel_all$date, xrf$Ni/xrf$Ti-ni_ti_err, agemodel_all$date, xrf$Ni/xrf$Ti+ni_ti_err, length=0.05, angle=90, code=3)
rect(xleft=1944, xright=1976, ybottom=.01, ytop=.03, density=100, col=color)
text(1669, .025, labels = "South Slough")

# Plot Haynes inlet core scan xrf proxy
par(mar = c(2,5,0,5))
plot(agemodel_coo6$date, coo6_xrf$Ni/coo6_xrf$Ti, xlim = c(1650,2016),ylim = c(0,25),xaxt = 'n',xlab = "", ylab = "HI Ni/Ti", col = "grey40", pch = 16)
lines(agemodel_coo6$date, predict(coo6_scan_lo_age_ni_ti), lwd = 1, lty = 2)
rect(xleft=1944, xright=1976, ybottom=0, ytop=26, density=100, col=color)
axis(side = 4)
text(1669, 20, labels = "Hayne's Inlet")

#plot accumulation rates for each core
loiDates <- approx(agemodel_coo6$depth, agemodel_coo6$date, xout = loi_mag_coo6$mean_depth, yleft = 2015)
par(mar = c(2,5,0,5))

#coo4
plot(agemodel_all$date, loi_mag$MAR[1:81], xaxt = 'n', xlim = c(1650,2016),ylim = c(0,1.4), col = 'indianred3', pch = 16, xlab = "", ylab = "MAR (g/cm^2-yr)")
lines(agemodel_all$date, loi_mag$MAR[1:81], xlim = c(1650,2016), ylim = c(0,1.4),col = 'black', lty = 1)
rect(xleft=1944, xright=1976, ybottom=0, ytop=1.4, density=100, col=color)

#Coo6
par(new = T)
plot(loiDates$y, loi_mag_coo6$MAR, xaxt = 'n', xlim = c(1650,2016),ylim = c(0,1.4), col = 'grey40', pch = 16, xlab = "", ylab = "", axes = FALSE)
lines(loiDates$y, loi_mag_coo6$MAR, xlim = c(1650,2016),ylim = c(0,1.4), col = 'black', lty = 2)

#Plot PDO
par(mar = c(2,5,0,5))
plot(pdo$YEAR, pdo$mean_summer, xaxt = 'n',xlim = c(1650,2016), ylim = c(-2,2.5), col = 'goldenrod3', pch = 16, xlab = "", ylab = "Summer PDO")
lines(pdo$YEAR, pdo$mean_summer, xlim = c(1650,2016), col = 'goldenrod3')
rect(xleft=1944, xright=1976, ybottom=-3, ytop=3, density=100, col=color)

par(new = T)
plot(pdo$YEAR, pdo$mean_winter, xaxt = 'n', xlim = c(1650,2016), ylim = c(-2,2.5),col = 'dodgerblue4', pch = 16, xlab = "", ylab = "", axes = FALSE)
lines(pdo$YEAR, pdo$mean_winter, xlim = c(1650,2016), col = 'dodgerblue4')
axis(side = 4)
mtext(side = 4, line = 3, "Winter PDO", cex = .7)
abline(0,0)

legend(1650, 2,
       legend=c("South Slough", "Haynes Inlet", "PDO Winter", 'PDO Summer', 'Coos County Population', 'Coos County Timber Harvest'),
       fill = c(NA,NA, NA, NA, NA, 'olivedrab3'), border = c(NA, NA, NA, NA, NA, "black"), lty=c(NA, NA, NA,NA, 1, NA), lwd=c(NA, NA, NA,NA, 3, NA), 
       pch=c(16, 16, 16,16, NA, NA), col=c('indianred3', 'grey40', 'goldenrod3', 'dodgerblue4', 'darkgreen', 'olivedrab3'), merge = FALSE, xpd = NA)

#Plot Timber Harvest and Population
par(mar = c(2,5,0,5))
xx <- c(timber$Year, rev(timber$Year))
yy <- c(rep(-2000, nrow(timber)), rev(timber$total))
plot(x=timber$Year, y=timber$total, col='olivedrab3', xlab = "",xaxt = 'n',ylab = "Timber (MBF)", type='l', xlim = c(1650,2016),ylim=1.1*c(0, max(timber$total)))
polygon(xx, yy, col='olivedrab3', border = NA)

par(new = T)
plot(pop$Year, pop$Population, ylab = "", type = "n",xlim = c(1650,2016),xaxt = 'n', xlab = "Date", axes = FALSE)
lines(pop$Year,pop$Population, ylab = "", col='darkgreen', lwd=3)
rect(xleft=1944, xright=1976, ybottom=-3, ytop=70000, density=100, col=color)
axis(side = 4)
axis(side = 1, at = seq(1700, 2000, 100), labels = seq(1700, 2000, 100))
mtext(side = 4, line = 3, "Coos Co Pop.",cex = .7)

#Save Plot
savePlotAsImage(file = 'FinalFigure7', format = "svg", width = 1100, height = 700)


#Renew par()
par(old.par)
