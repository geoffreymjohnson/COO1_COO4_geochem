#Composite plot 6 panels showing geochem relationships to DO at VI and CB
par(mfcol = c(2,3))
leg <- c("2 - VI","5 - VI","2 - CB","5 - CB")
colors <- c(2,'blue',2,'blue')
line_type <- c(1,1,2,2)
ln_wdth <- c(2,2,2,2)
do_cm <- c(258.5,375,475,180,875.3,2175,392.5,253)
dates <- c(1999:2015)
y_range <- seq(0,1200,75)


#blank for the legend
plot(dates, y_range, type = "n", axes=F, ylab = NA, xlab = NA)
legend(2002, y=1000, legend = leg, lty=line_type, lwd = ln_wdth, col=colors, title="DO threshold (mg/L)")
cor_depth <- 8

#Using a desired number of subsections, build the widths for variable width age bars 
ages <- agemodel_all$date[1:cor_depth]
ages_minus <- head(ages, -1)
age_shift <- append(ages_minus, 2014.6, after = 0)
mid <- ages + widths/2

#Variable width bars for core section age range
element <- xrf$Ti
proxy <- element[1:cor_depth] 
widths <- age_shift - ages
heights <- proxy
y1_zero <- min(heights)*0.75
y1_max <- max(heights)
x_axis <- years + 0.5
dates <- c(1999:2015)
y_range <- seq(0,1200,75)

#Plot window 2:
par(mar = c(5,4,2,4))
plot.window(xlim = c(1999, 2015), ylim = c(y1_zero,y1_max))  
barplot(heights, widths, ylim = c(y1_zero,y1_max), space=0, col = 'white', ylab = "Ti (mass %)",  beside = TRUE, xpd = FALSE)

par(new = T)
par(mar = c(5,4,2,4))
plot(dates, y_range, type = "n", axes=F, ylab = NA, xlab = "")
lines(x_axis, DO_below5/2, lty = 1, lwd = 2, col='blue')
lines(x_axis, DO_below2/2, lty = 1, lwd = 2, col=2)
lines(x_axis[4:16], CH_DO_below5/2, lty=2, lwd = 2, col='blue')
lines(x_axis[4:16], CH_DO_below2/2, lty=2, lwd = 2, col=2)
axis(side = 1, at = dates, labels = dates )

#Label and correlation calc
text(2000,1200, 'Ti')
test_DO <- approx(x_axis, DO_below5[,1], mid, method = 'linear', rule = 2)
do_cor <- cor.test(heights, do_cm, method = "spearman")
do_cor
pvalue <- paste('p = ', as.character(round(do_cor$p.value, digits = 3), sep = ''))
estimate <- paste('cor = ', as.character(round(do_cor$estimate, digits = 3), sep = ''))
text(2002,1100, estimate)
text(2002,1000, pvalue)

#Plot window 3
element <- xrf$Ni
proxy <- element[1:cor_depth] 

widths <- age_shift - ages
heights <- rev(proxy)
y1_zero <- min(heights)*0.75
y1_max <- max(heights)
dates <- c(1999:2015)
y_range <- seq(0,1200,75)

par(mar = c(5,4,2,4))
plot.window(xlim = c(1999, 2015), ylim = c(y1_zero,y1_max))
barplot(heights, widths, space=0, ylim = c(y1_zero,y1_max), col =  'white',ylab = "Ni (mass %)", beside = TRUE, xpd = FALSE)

par(new = T)
par(mar = c(5,4,2,4))
plot(dates, y_range, type = "n", axes=F, ylab = NA, xlab = "")
lines(x_axis, DO_below5/2, lty = 1, lwd = 2, col='blue')
lines(x_axis, DO_below2/2, lty = 1, lwd = 2, col=2)
lines(x_axis[4:16], CH_DO_below5/2, lty=2, lwd = 2, col='blue')
lines(x_axis[4:16], CH_DO_below2/2, lty=2, lwd = 2, col=2)
axis(side = 1, at = dates, labels = FALSE)


text(2000,1200, 'Ni')
test_DO <- approx(x_axis, DO_below5[,1], mid, method = 'linear', rule = 2)
do_cor <- cor.test(heights, do_cm, method = "spearman")
pvalue <- paste('p = ', as.character(round(do_cor$p.value, digits = 3), sep = ''))
estimate <- paste('cor = ', as.character(round(do_cor$estimate, digits = 3), sep = ''))
text(2002,1100, estimate)
text(2002,1000, pvalue)

#Plot window 4
element <- xrf$Ni/xrf$Ti
proxy <- element[1:cor_depth] 

widths <- age_shift - ages
heights <- rev(proxy)
y1_zero <- min(heights)*0.75
y1_max <- max(heights)
x_axis <- years + 0.5
dates <- c(1999:2015)
y_range <- seq(0,1200,75)

par(mar = c(5,4,2,4))
plot.window(xlim = c(1999, 2015), ylim = c(y1_zero,y1_max))
barplot(heights, widths, space=0, ylim = c(y1_zero,y1_max), col =  'white',ylab = "Ni/Ti (mass ratio)", beside = TRUE, xpd = FALSE)

par(new = T)
par(mar = c(5,4,2,4))
plot(dates, y_range, type = "n", axes=F, ylab = NA, xlab = 'Year AD')
lines(x_axis, DO_below5/2, lty = 1, lwd = 2, col='blue')
lines(x_axis, DO_below2/2, lty = 1, lwd = 2, col=2)
lines(x_axis[4:16], CH_DO_below5/2, lty=2, lwd = 2, col='blue')
lines(x_axis[4:16], CH_DO_below2/2, lty=2, lwd = 2, col=2)
axis(side = 1, at = dates, labels = dates )

text(2000,1200, 'Ni/Ti')
test_DO <- approx(x_axis, DO_below5[,1], mid, method = 'linear', rule = 2)
do_cor <- cor.test(heights, do_cm, method = "spearman")
pvalue <- paste('p = ', as.character(round(do_cor$p.value, digits = 3), sep = ''))
estimate <- paste('cor = ', as.character(round(do_cor$estimate, digits = 3), sep = ''))
text(2002,1100, estimate)
text(2002,1000, pvalue)

#Plot window 4
element <- xrf$Zn
proxy <- element[1:cor_depth] 

widths <- age_shift - ages
heights <- rev(proxy)
y1_zero <- min(heights)*0.75
y1_max <- max(heights)
x_axis <- years + 0.5
dates <- c(1999:2015)
y_range <- seq(0,1200,75)

par(mar = c(5,4,2,4))
plot.window(xlim = c(1999, 2015), ylim = c(y1_zero,y1_max))
barplot(heights, widths, space=0, ylim = c(y1_zero,y1_max), col =  'white',ylab = 'Zn (mass %)', beside = TRUE, xpd = FALSE)

par(new = T)
par(mar = c(5,4,2,4))
plot(dates, y_range, type = "n", axes=F, ylab = NA, xlab = "")
lines(x_axis, DO_below5/2, lty = 1, lwd = 2, col='blue')
lines(x_axis, DO_below2/2, lty = 1, lwd = 2, col=2)
lines(x_axis[4:16], CH_DO_below5/2, lty=2, lwd = 2, col='blue')
lines(x_axis[4:16], CH_DO_below2/2, lty=2, lwd = 2, col=2)
axis(side = 4)
axis(side = 1, at = dates, labels = FALSE)

text(2000,1200, 'Zn')
mtext(side = 4, line = 3, cex =0.75, "Time below threshold (hrs/yr)")
test_DO <- approx(x_axis, DO_below5[,1], mid, method = 'linear', rule = 2)
do_cor <- cor.test(heights, do_cm, method = "spearman")
pvalue <- paste('p = ', as.character(round(do_cor$p.value, digits = 3), sep = ''))
estimate <- paste('cor = ', as.character(round(do_cor$estimate, digits = 3), sep = ''))
text(2002,1100, estimate)
text(2002,1000, pvalue)

#Plot window 5:
element <- xrf$Zn/xrf$Ti
proxy <- element[1:cor_depth] 

widths <- age_shift - ages
heights <- rev(proxy)
y1_zero <- min(heights)*0.75
y1_max <- max(heights)
x_axis <- years + 0.5
dates <- c(1999:2015)
y_range <- seq(0,1200,75)

par(mar = c(5,4,2,4))
plot.window(xlim = c(1999, 2015), ylim = c(y1_zero,y1_max))
barplot(heights, widths, space=0, ylim = c(y1_zero,y1_max), col =  'white',ylab = "Zn/Ti (mass ratio)", beside = TRUE, xpd = FALSE)

par(new = T)
par(mar = c(5,4,2,4))
plot(dates, y_range, type = "n", axes=F, ylab = NA, xlab = "")
lines(x_axis, DO_below5/2, lty = 1, lwd = 2, col='blue')
lines(x_axis, DO_below2/2, lty = 1, lwd = 2, col=2)
lines(x_axis[4:16], CH_DO_below5/2, lty=2, lwd = 2, col='blue')
lines(x_axis[4:16], CH_DO_below2/2, lty=2, lwd = 2, col=2)
axis(side = 4)
axis(side = 1, at = dates, labels = dates )

text(2000,1200, 'Zn/Ti')
mtext(side = 4, line = 3, cex =0.75, "Time below threshold (hrs/yr)")
test_DO <- approx(x_axis, DO_below5[,1], mid, method = 'linear', rule = 2)
do_cor <- cor.test(heights, do_cm, method = "spearman", exact = TRUE)
pvalue <- paste('p = ', as.character(round(do_cor$p.value, digits = 3), sep = ''))
estimate <- paste('cor = ', as.character(round(do_cor$estimate, digits = 3), sep = ''))
text(2002,1100, estimate)
text(2002,1000, pvalue)

#Save plot
savePlotAsImage(file = 'FinalFigure5', format = "svg", width = 1100, height = 700)

#Reset par()
par(old.par)



