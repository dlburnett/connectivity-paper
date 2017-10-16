library("maptools")
library("rgdal")
library("tidyverse")
library("maps")
library("sp")
library(plyr)
proj_custom <- CRS("+proj=tmerc +zone=9 +lat_0=0 +lon_0=-127 +k=0.9996 +x_0=500000 +y_0=0 +datum=WGS84 +units=m")
proj_utm9n  <- CRS("+proj=utm +zone=9 +lat_0=0 +lon_0=-127 +k=0.9996 +x_0=500000 +y_0=0 +datum=WGS84 +units=m")
#setwd("/Volumes/1TB Bob/sp by farm/super pulse RDS files/")
setwd("/Volumes/1TB Bob/sp by farm/sp bio/")
for (j in 1:1) {
  setwd(paste0("/Volumes/1TB Bob/sp by farm/sp bio/sp", j))
  listRDS <- dir(pattern = "*.RDS")
  for (i in 1:length(listRDS)) {
    file <- readRDS(listRDS[i])
    coordinates(file) <-  ~lon2+lat2 
    proj4string(file) <-  proj_custom
    file <- spTransform(file, proj_utm9n)
    writeOGR(file, 
             dsn    = paste0("/Volumes/1TB Bob/sp by farm/sp bio/sp", j, "/shp/"), 
             layer  = paste0(listRDS[i]), 
             driver = "ESRI Shapefile", 
             overwrite_layer = T
    )
  }
}









################import polygon to double check points are in correct projection#####################################################
poly <- readOGR("/Volumes/1TB Bob/shapefiles from FVCOM grid/250m_both.shp")
points <- readOGR("/Volumes/1TB Bob/sp by farm/sp1/1.shp")
plot(poly)
map.axes()
points(points)

points <- readOGR("/Volumes/1TB Bob/sp by farm/sp1/2.shp")
plot(poly)
map.axes()
points(points)


points <- readOGR("/Volumes/1TB Bob/sp by farm/sp1/3.shp")
plot(poly)
map.axes()
points(points)


points <- readOGR("/Volumes/1TB Bob/sp by farm/sp1/4.shp")
plot(poly)
map.axes()
points(points)


points <- readOGR("/Volumes/1TB Bob/sp by farm/sp1/5.shp")
plot(poly)
map.axes()
points(points)


points <- readOGR("/Volumes/1TB Bob/sp by farm/sp1/6.shp")
plot(poly)
map.axes()
points(points)


points <- readOGR("/Volumes/1TB Bob/sp by farm/sp1/7.shp")
plot(poly)
map.axes()
points(points)


points <- readOGR("/Volumes/1TB Bob/sp by farm/sp1/8.shp")
plot(poly)
map.axes()
points(points)


points <- readOGR("/Volumes/1TB Bob/sp by farm/sp1/9.shp")
plot(poly)
map.axes()
points(points)


points <- readOGR("/Volumes/1TB Bob/sp by farm/sp1/10.shp")
plot(poly)
map.axes()
points(points)


points <- readOGR("/Volumes/1TB Bob/sp by farm/sp1/11.shp")
plot(poly)
map.axes()
points(points)


points <- readOGR("/Volumes/1TB Bob/sp by farm/sp1/12.shp")
plot(poly)
map.axes()
points(points)


points <- readOGR("/Volumes/1TB Bob/sp by farm/sp1/13.shp")
plot(poly)
map.axes()
points(points)


points <- readOGR("/Volumes/1TB Bob/sp by farm/sp1/14.shp")
plot(poly)
map.axes()
points(points)


points <- readOGR("/Volumes/1TB Bob/sp by farm/sp1/15.shp")
plot(poly)
map.axes()
points(points)


points <- readOGR("/Volumes/1TB Bob/sp by farm/sp1/16.shp")
plot(poly)
map.axes()
points(points)


points <- readOGR("/Volumes/1TB Bob/sp by farm/sp1/17.shp")
plot(poly)
map.axes()
points(points)

points <- readOGR("/Volumes/1TB Bob/sp by farm/sp1/18.shp")
plot(poly)
map.axes()
points(points)


points <- readOGR("/Volumes/1TB Bob/sp by farm/sp1/19.shp")
plot(poly)
map.axes()
points(points)


points <- readOGR("/Volumes/1TB Bob/sp by farm/sp1/20.shp")
plot(poly)
map.axes()
points(points)









###### same code as loop above, but how I wrote it before it was in a loop

##############farm1##################################################################################################
f1_sp1 <- read_rds("f1_sp1.RDS")
class(f1_sp1)
#turn df into a spatial points df
coordinates(f1_sp1) <- ~lon2+lat2
#set custom projection
proj4string(f1_sp1) <- CRS("+proj=tmerc +zone=9 +lat_0=0 +lon_0=-127 +k=0.9996 +x_0=500000 +y_0=0 +datum=WGS84 +units=m")
writeOGR(f1_sp1, dsn = "/Volumes/1TB Bob/shp/sp1", "f1_sp1", driver = "ESRI Shapefile")

#import polygon for the outline of the kdensity analysis
poly <- readOGR("/Volumes/1TB Bob/shapefiles from FVCOM grid/250m_both.shp")
points <- readOGR("/Volumes/1TB Bob/shp/sp1/f1_sp1.shp")
#change the projection to match the polygon
point2 <- spTransform(points, CRS("+proj=utm +zone=9 +lat_0=0 +lon_0=-127 +k=0.9996 +x_0=500000 +y_0=0 +datum=WGS84 +units=m"))
#overwrite in correct projection
writeOGR(point2, driver = "ESRI Shapefile", "f1_sp1", dsn = "/Volumes/1TB Bob/shp/sp1", overwrite_layer = T)
points <- readOGR("/Volumes/1TB Bob/shp/sp1/f1_sp1.shp")
#double check points are where they should be
plot(poly)
map.axes()
points(points)
##########################################################################################################################
