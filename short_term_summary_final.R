#proxy, timber harvest and upwelling
x <- seq(1985,2015,1)
y <- seq(0,30,1)
do <- belowX*0.5
cor_depth=13

#Using a desired number of subsections, build the widths for variable width age bars 
ages <- agemodel$date[1:cor_depth]
ages_minus <- head(ages, -1)
age_shift <- append(ages_minus, 2014.6, after = 0)


#Set up plot parameters and overall dimensions
op <- par(mfrow = c(5,1))
plot(x, y, type = 'n', axes = FALSE,xlab = '', ylab = '')
legend('center',
       legend=c("Ni/Ti Ratio", "Time Below 5mg/L at VI (Time)", 'South Fork Coos R. Discharge (Q)', 
                'Upwelling Season Length (USL)', 'Cumulative Upwelling Index (CUI)', 
                'Coos County Timber Harvest (Timber)'),
       fill = c('indianred3', NA, NA, NA, NA, 'olivedrab3'), border = c("black", NA, NA, NA, NA, NA), 
       lwd=c(NA,2,1,1,1,NA), pch=c(NA, NA, 17, 16, 16, NA), cex = c(1.1, 1.1, 1.1, 1.1, 1.1, 1.1), 
       col=c(5, "black", 'black', 'slateblue1', 'purple3', 'olivedrab3'), 
       merge = FALSE, xpd = NA)

#First panel: South Slough DO proxy
par(mar = c(3,5,0,5))
element <- xrf$Ni/xrf$Ti
proxy <- element[1:cor_depth] 
widths <- age_shift - ages
heights <- proxy
x_axis <- years + 0.5
dates <- c(1985:2015)
y_range <- seq(0,1200,40)
barplot(rev(heights), rev(widths), space=0, 
        col = 'indianred3',  ylim = c(0,.025),ylab = "Ni/Ti Ratio", beside = TRUE, xpd = FALSE)
plot.window(xlim = c(1985, 2015), ylim = c(.15,.25))
par(new = T)
par(mar = c(3,5,0,5))
plot(dates, y_range, type = "n", axes=F, ylab = NA, xlab = "")
points(x_axis, do, pch=16, xlab=NA, ylab=NA, cex = .5)
lines(x_axis, do, lwd = 2)
axis(side = 4)
mtext(side = 4, line = 3, "Time (Hrs)", cex = .7)
text(1989, 1150, labels = "South Slough")

#Recaluculating for Haynes Inlet
cor_depth=22
ages <- ages_coo6_ss$y[1:cor_depth]
ages_minus <- head(ages, -1)
age_shift <- append(ages_minus, 2014.4, after = 0)
element <- coo6_ss$Ni/coo6_ss$Ti
proxy <- element[1:cor_depth]
widths <- age_shift - ages
heights <- proxy
dates <- c(1985:2015)

#Plotting second panel: Haynes Inlet
par(mar = c(3,5,0,5))
barplot(rev(heights), rev(widths), space=0, 
        col = 'indianred3', ylim = c(0,.025),ylab = "Ni/Ti Ratio", 
        beside = TRUE, xpd = FALSE)
par(new = T)
plot(dis_stats$date, dis_stats$median, xlim = c(1985, 2015),ylab = "", xlab = "Date", axes = FALSE, pch = 17, cex = 1.4)
lines(dis_stats$date, dis_stats$median)
axis(side = 4)
mtext(side = 4, line = 3, "Q (cfs)", cex = .7)
text(1989, 55, labels = "Hayne's Inlet")

#Plot third panel
par(mar = c(3,5,0,5))
plot(years_ws, season_length, xaxt = 'n',xlim = c(1985, 2015), col = 'slateblue1', ylab = 'USL (days)',xlab = '',pch = 16, bty = "n")
lines(years_ws, season_length, xlim = c(1985, 2015), col = 'slateblue1')
par(new = T)
plot(years_ws, season_sum, ylim = c(-1, -5), col = 'purple3',xlim = c(1985, 2015), axes = FALSE, xlab = '', ylab = '', pch = 16, bty = "n")
lines(years_ws, season_sum, ylim = c(-1, -5), col = 'purple3',xlim = c(1985, 2015))
axis(side = 4)
mtext(side = 4, line = 3, "CUI", cex = .7)

#Plot fourth panel
par(mar = c(3,5,0,5))
xx <- c(timber$Year[61:90], rev(timber$Year[61:90]))
yy <- c(rep(0, nrow(timber[61:90,])), rev(timber$total[61:90]))
plot(x=timber$Year[61:90], y=timber$total[61:90], xlab = '',ylab = 'Timber (mbf)',col='palegreen4', type='l', xlim = c(1985, 2015),ylim= c(0, 600000), bty = "n")
polygon(xx, yy, col='olivedrab3', border = NA)

#Save Plot
savePlotAsImage(file = 'FinalFigure6', format = "svg", width = 900, height = 600)


par(old.par)
