#Plotting metals and ratios from SS and HI: Ti, Fe, Mn, Ni/Ti, Zn/Ti 
op <- par(mfrow = c(1,11)) 
par(mar = c(5,1,4,6))
plot(xrf$Ti, xrf$depth, xlab="", ylab="", ylim=c(82,0), pch=16, type = 'n', axes = FALSE)
par(mar = c(5,1,4,1))
plot(xrf$Ti, xrf$depth, main = "South Slough", xlab="Ti", ylab="Depth (cm)", ylim=c(82,0), pch=16)
lines(predict(lo_ti), xrf$depth, lwd=2)
arrows(xrf$Ti-xrf$Ti.Err, xrf$depth, xrf$Ti+xrf$Ti.Err, xrf$depth, length=0.05, angle=90, code=3)
abline(h=30, col='red', lty=2)
mtext("Depth (cm)", side = 2, line = 3,cex = .75)

plot(xrf$Mn, xrf$depth, xlab="Mn", yaxt = 'n',ylab=" ", ylim=c(82,0),  pch=16)
lines(predict(lo_mn), xrf$depth, lwd=2)
arrows(xrf$Mn-xrf$Mn.Err, xrf$depth, xrf$Mn+xrf$Mn.Err, xrf$depth, length=0.05, angle=90, code=3)
abline(h=30, col='red', lty=2)

plot(xrf$Fe, xrf$depth, xlab="Fe", yaxt = 'n',ylab=" ", ylim=c(82,0),  pch=16)
lines(predict(lo_fe), xrf$depth, lwd=2)
arrows(xrf$Fe-xrf$Fe.Err, xrf$depth, xrf$Fe+xrf$Fe.Err, xrf$depth, length=0.05, angle=90, code=3)
abline(h=30, col='red', lty=2)

plot(xrf$Ni/xrf$Ti, xrf$depth, yaxt = 'n',xlab="Ni/Ti", ylab=" ", ylim=c(82,0), pch=16)
lines(predict(lo_ni_ti), xrf$depth, lwd=2)
arrows(xrf$Ni/xrf$Ti-ni_ti_err, xrf$depth, xrf$Ni/xrf$Ti +ni_ti_err, xrf$depth, length=0.05, angle=90, code=3)
abline(h=30, col='red', lty=2)

plot(xrf$Zn/xrf$Ti, xrf$depth, yaxt = 'n',xlab="Zn/Ti", ylab=" ", ylim=c(82,0), pch =16)
lines(predict(lo_zn_ti), xrf$depth, lwd=2)
arrows(xrf$Zn/xrf$Ti-zn_ti_err, xrf$depth, xrf$Zn/xrf$Ti +zn_ti_err, xrf$depth, length=0.05, angle=90, code=3)
abline(h=30, col='red', lty=2)

plot(coo6_ss$Ti, coo6_ss$depth, main = "Haynes' Inlet", xlab="Ti", yaxt = 'n',ylab=" ", ylim=c(82,0), pch=16)
lines(predict(coo6_lo_ti), coo6_ss$depth, lwd=2)
arrows(coo6_ss$Ti-coo6_ss$Ti.Err, coo6_ss$depth, coo6_ss$Ti+coo6_ss$Ti.Err, coo6_ss$depth, length=0.05, angle=90, code=3)
abline(h=78, col='red', lty=2)

plot(coo6_ss$Mn, coo6_ss$depth, xlab="Mn", yaxt = 'n',ylab=" ", ylim=c(82,0), pch=16)
lines(predict(coo6_lo_mn), coo6_ss$depth, lwd=2)
arrows(coo6_ss$Mn-coo6_ss$Mn.Err, coo6_ss$depth, coo6_ss$Mn+coo6_ss$Mn.Err, coo6_ss$depth, length=0.05, angle=90, code=3)
abline(h=78, col='red', lty=2)

plot(coo6_ss$Fe, coo6_ss$depth, xlab="Fe", yaxt = 'n',ylab=" ", ylim=c(82,0), pch=16)
lines(predict(coo6_lo_fe), coo6_ss$depth, lwd=2)
arrows(coo6_ss$Fe-coo6_ss$Fe.Err, coo6_ss$depth, coo6_ss$Fe+coo6_ss$Fe.Err, coo6_ss$depth, length=0.05, angle=90, code=3)
abline(h=78, col='red', lty=2)

plot(coo6_ss$Ni/coo6_ss$Ti, coo6_ss$depth, yaxt = 'n',xlab="Ni/Ti", ylab=" ", ylim=c(82,0), pch=16)
lines(predict(coo6_lo_ni_ti), coo6_ss$depth, lwd=2)
arrows(coo6_ss$Ni/coo6_ss$Ti-coo6_ni_ti_err, coo6_ss$depth, coo6_ss$Ni/coo6_ss$Ti +coo6_ni_ti_err, coo6_ss$depth, length=0.05, angle=90, code=3)
abline(h=78, col='red', lty=2)

plot(coo6_ss$Zn/coo6_ss$Ti, coo6_ss$depth, yaxt = 'n',xlab="Zn/Ti", ylab=" ", ylim=c(82,0),pch =16)
lines(predict(coo6_lo_zn_ti), coo6_ss$depth, lwd=2)
arrows(coo6_ss$Zn/coo6_ss$Ti-coo6_zn_ti_err, coo6_ss$depth, coo6_ss$Zn/coo6_ss$Ti +coo6_zn_ti_err, coo6_ss$depth, length=0.05, angle=90, code=3)
abline(h=78, col='red', lty=2)


#Save plot
savePlotAsImage(file = 'FinalFigure4', format = "svg", width = 1300, height = 700)


par(old.par)


