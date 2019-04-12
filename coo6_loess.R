#replace coo6_xrf 0's with NA's
coo6_xrf[coo6_xrf==0] <- NA

#depth loess
coo6_scan_lo_v <- loess(V ~ core_depth, coo6_xrf, model=FALSE, span=0.05, na.action = "na.exclude")
coo6_scan_lo_ni <- loess(Ni ~ core_depth, coo6_xrf, model=FALSE, span=0.05, na.action = "na.exclude")
coo6_scan_lo_zn <- loess(Zn ~ core_depth, coo6_xrf, model=FALSE, span=0.05, na.action = "na.exclude")
coo6_scan_lo_cu <- loess(Cu ~ core_depth, coo6_xrf, model=FALSE, span=0.05, na.action = "na.exclude")
coo6_scan_lo_mn <- loess(Mn ~ core_depth, coo6_xrf, model=FALSE, span=0.05, na.action = "na.exclude")
coo6_scan_lo_fe <- loess(Fe ~ core_depth, coo6_xrf, model=FALSE, span=0.05, na.action = "na.exclude")


coo6_scan_lo_ni_ti <- loess(Ni/Ti ~ core_depth, coo6_xrf, model=FALSE, span=0.05, na.action = "na.exclude")
coo6_scan_lo_zn_ti <- loess(Zn/Ti ~ core_depth, coo6_xrf, model=FALSE, span=0.05, na.action = "na.exclude")
coo6_scan_lo_ni_ti <- loess(Ni/Ti ~ core_depth, coo6_xrf, model=FALSE, span=0.05, na.action = "na.exclude")
coo6_scan_lo_mn_ti <- loess(Mn/Ti ~ core_depth, coo6_xrf, model=FALSE, span=0.05, na.action = "na.exclude")


coo6_scan_lo_v_al <- loess(V/Al ~ core_depth, coo6_xrf, model=FALSE, span=0.05, na.action = "na.exclude")
coo6_scan_lo_ni_al <- loess(Ni/Al ~ core_depth, coo6_xrf, model=FALSE, span=0.05, na.action = "na.exclude")
coo6_scan_lo_zn_al <- loess(Zn/Al ~ core_depth, coo6_xrf, model=FALSE, span=0.05, na.action = "na.exclude")
coo6_scan_lo_cu_al <- loess(Cu/Al ~ core_depth, coo6_xrf, model=FALSE, span=0.05, na.action = "na.exclude")

coo6_scan_lo_Al <- loess(Al ~ core_depth, coo6_xrf, model=FALSE, span=0.05, na.action = "na.exclude")
coo6_scan_lo_Ti <- loess(Ti ~ core_depth,coo6_xrf , model=FALSE, span=0.05, na.action = "na.exclude")
coo6_scan_lo_K <- loess(K ~ core_depth, coo6_xrf, model=FALSE, span=0.05, na.action = "na.exclude")

#age loess
coo6_scan_lo_age_v <- loess(coo6_xrf$V ~ agemodel_coo6$date,model=FALSE, span=0.05, na.action = "na.exclude")
coo6_scan_lo_age_ni <- loess(coo6_xrf$Ni ~ agemodel_coo6$date, model=FALSE, span=0.05, na.action = "na.exclude")
coo6_scan_lo_age_zn <- loess(coo6_xrf$Zn ~ agemodel_coo6$date, model=FALSE, span=0.05, na.action = "na.exclude")
coo6_scan_lo_age_cu <- loess(coo6_xrf$Cu ~ agemodel_coo6$date, model=FALSE, span=0.05, na.action = "na.exclude")
coo6_scan_lo_age_mn <- loess(coo6_xrf$Mn ~ agemodel_coo6$date, model=FALSE, span=0.05, na.action = "na.exclude")


coo6_scan_lo_age_ni_ti <- loess(coo6_xrf$Ni/coo6_xrf$Ti ~ agemodel_coo6$date, model=FALSE, span=0.05, na.action = "na.exclude")
# coo6_scan_lo_age_ni_ti <- loess(Ni/Ti ~ agemodel_coo6$date, model=FALSE, span=0.05, na.action = "na.exclude")
# coo6_scan_lo_age_ni_ti <- loess(Ni/Ti ~ agemodel_coo6$date, model=FALSE, span=0.05, na.action = "na.exclude")
# coo6_scan_lo_age_ni_ti <- loess(Ni/Ti ~ agemodel_coo6$date, model=FALSE, span=0.05, na.action = "na.exclude")


coo6_scan_lo_age_v_al <- loess(coo6_xrf$V/coo6_xrf$Al ~ agemodel_coo6$date, model=FALSE, span=0.05, na.action = "na.exclude")
coo6_scan_lo_age_ni_al <- loess(coo6_xrf$Ni/coo6_xrf$Al ~ agemodel_coo6$date, model=FALSE, span=0.05, na.action = "na.exclude")
coo6_scan_lo_age_zn_al <- loess(coo6_xrf$Zn/coo6_xrf$Al ~ agemodel_coo6$date, model=FALSE, span=0.05, na.action = "na.exclude")
coo6_scan_lo_age_cu_al <- loess(coo6_xrf$Cu/coo6_xrf$Al ~ agemodel_coo6$date, model=FALSE, span=0.05, na.action = "na.exclude")

coo6_scan_lo_age_Al <- loess(coo6_xrf$Al ~ agemodel_coo6$date, model=FALSE, span=0.05, na.action = "na.exclude")
coo6_scan_lo_age_Ti <- loess(coo6_xrf$Ti ~ agemodel_coo6$date, model=FALSE, span=0.05, na.action = "na.exclude")
coo6_scan_lo_age_K <- loess(coo6_xrf$K ~ agemodel_coo6$date, model=FALSE, span=0.05, na.action = "na.exclude")

#
