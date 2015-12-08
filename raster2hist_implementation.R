require(raster)
filename <- system.file("external/test.grd", package="raster")
r <- raster(filename)
plot(r, main='RasterLayer from file')

# for data that is continuous
raster2hist(r=r,levels=seq(100,2000,100))
raster2hist(r=r,levels=20)
raster2hist(r=r,levels=20, main="Test")
raster2hist(r=r,levels=20, main="Test", xlab="value", ylab="count")
raster2hist(r=r,levels=20, border=F,palette=rainbow)

# or if you want full customizability - return just the table and make a barplot from that. 
h<-raster2hist(r=r,levels=20, border=F,palette=rainbow, plot=F)
barplot(h$table)

# for data that is discrete
r2 <- cut(raster(filename),10)
raster2hist(r=r2, levels="discrete", palette=rainbow)

