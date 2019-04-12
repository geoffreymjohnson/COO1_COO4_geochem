dis_years <- c(2003,2015)
dis <- discharge[1:150,]
plot(dis, dis_years)

as.vector(dis[,1])
mean_dis <- apply(dis,2,mean)
mean_dis
