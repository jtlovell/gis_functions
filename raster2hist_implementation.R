require(raster)
filename <- system.file("external/test.grd", package="raster")
r <- raster(filename)
plot(r, main='RasterLayer from file')

# for data that is continuous
raster2hist(r=r,levels=seq(100,2000,10))
raster2hist(r=r,levels=20)
raster2hist(r=r,levels=20, main="Test")
raster2hist(r=r,levels=20, main="Test", xlab="value", ylab="count")
raster2hist(r=r,levels=50, border=F)

# or if you want full customizability - return just the table and make a barplot from that. 
h<-raster2hist(r=r,levels=20, border=F,palette=rainbow, plot=F)
barplot(h$table)

# for data that is discrete
r2 <- cut(raster(filename),10)
raster2hist(r=r2, levels="discrete", palette=rainbow)

# add the bar plot to a pre-existing plot
library(TeachingDemos)
plot(r, main='RasterLayer from file', col=terrain.colors(200))
subplot( # add plot to existing plot
  raster2hist(r=r,levels=100,palette=terrain.colors, 
              border=NA, # turn off bar borders
              xaxt="n", # turn off x axis
              axisnames=F, # turn off axis labels
              space=0 # remove spacing between bars - may need to be negative with lots of bars
  ),
  x=extent(r)[1]+400, # place the top of the plot here
  y=extent(r)[4]+200, # place the left edge of the plot here
  vadj=1, hadj=0, # ignore
  size=c(3,1) # set the size of the inset by inches (x, y)
)



