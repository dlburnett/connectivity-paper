library("maptools")
library("rgdal")
library("tidyverse")
library("maps")
library("sp")
library("raster")
library("spatstat")


setwd("/Volumes/1TB Bob/shapefiles from FVCOM grid")
poly <- readOGR("250m_both.shp")
gridsize <- 100
xrange_poly <- extent(poly)[2] - extent(poly)[1]
yrange_poly <- extent(poly)[4] - extent(poly)[3]
cellsx <- xrange_poly/gridsize
cellsy <- yrange_poly/gridsize
dimuse <- c(cellsy, cellsx)
farm_loc <- readOGR("/Volumes/1TB Bob/farm locations")

#cycle through wd one at a time to run the loops for each sp

#################################################################################################
#this loop makes the rasters that are the kernel densities
#and extracts infection pressure
######################################################################################################

for (j in 101:139) {
  setwd(paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp", j, "/shp"))
  listSHP <- dir(pattern = "*.shp")
  list.files()
  dir.create(paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp", j, "/csv"))

for (i in 1:length(listSHP)) {
  points <- readOGR(listSHP[i])

  xrange_points <- extent(points)[2] - extent(points)[1]
  yrange_points <- extent(points)[4] - extent(points)[3]
  bandwidth <- min(xrange_points,yrange_points)/8
  dat.ow <- as(as(poly, "SpatialPolygons"), "owin")
  dat.pp <- as(points, "SpatialPoints")
  dat.ppp <- ppp(x = coordinates(dat.pp)[,1], y = coordinates(dat.pp)[,2], window = dat.ow)
  out.den <- density.ppp(dat.ppp, sigma = bandwidth, dimyx = dimuse, edge = TRUE, diggle = TRUE)
  out.spdf <- as(as(out.den, "SpatialGridDataFrame"), "SpatialPixelsDataFrame")
  raster_out <- brick(raster(out.spdf))
  #Set projection (optional - default is WGS84) 
  proj4string(raster_out) = CRS("+proj=utm +zone=9 +datum=WGS84 +units=m +no_defs +ellps=WGS84 +towgs84=0,0,0")
  #Convert from m2 to km2
  raster_out <- raster_out*1000000
  #extract connectivity
  writeRaster(raster_out, 
              filename = paste0(listSHP[i]),"GTiff", overwrite = T)
  farm_densities <- as.data.frame(raster::extract(raster_out,farm_loc))
  farm_densities$farm <- farm_loc$farm
  write.csv(x = farm_densities, file = paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp", j, "/csv/", listSHP[i], ".csv"))
}
}



###this is for if you need to re grab the values from one sp's raster
setwd("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp21/shp/tif")
for (j in 1:20) {
  listSHP <- dir(pattern = "*.tif")
  list.files()
  raster_out <- raster(paste0("f", j, "_sp21.RDS.tif"))
farm_densities <- as.data.frame(raster::extract(raster_out,farm_loc))
farm_densities$farm <- farm_loc$farm
write.csv(x = farm_densities, file = paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp21/csv/", listSHP[j], ".csv"))
}






###Now turn the values from last step into proportions

for (j in 71:90) {
  setwd(paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp", j, "/csv/"))
  listSP <- dir(pattern = ".csv")
  list.files()


    #dir.create(paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp", j, "/prop"))
for (i in 1:20) {
  data <- read_csv(listSP[i])
  data <- data[-1]
  data$v <- data$v/1000
  write.csv(x = data, file = paste0("/Volumes/1TB Bob/weighted csv/", listSP[i]))
}
}
  



dir.create("prop")










setwd("/Volumes/1TB Bob/super pulse/sp10/try2/shp")
listSHP <- dir(pattern = "*.shp")
list.files()
dir.create("/Volumes/1TB Bob/super pulse/sp10/try2/csv")


for (i in 1:length(listSHP)) {
  points <- readOGR(listSHP[i])
  xrange_points <- extent(points)[2] - extent(points)[1]
  yrange_points <- extent(points)[4] - extent(points)[3]
  bandwidth <- min(xrange_points,yrange_points)/8
  #weights <- points$mor #this is to weight on survivability in the kdensity
  dat.ow <- as(as(poly, "SpatialPolygons"), "owin")
  dat.pp <- as(points, "SpatialPoints")
  dat.ppp <- ppp(x = coordinates(dat.pp)[,1], y = coordinates(dat.pp)[,2], window = dat.ow)
  out.den <- density(dat.ppp, sigma = bandwidth, dimyx = dimuse, edge = TRUE, diggle = TRUE)
  # put this in the previous line after "diggle = TRUE" to weight on mortality: , weights = weights
  out.spdf <- as(as(out.den, "SpatialGridDataFrame"), "SpatialPixelsDataFrame")
  raster_out <- brick(raster(out.spdf))
  #Set projection (optional - default is WGS84) (2953 = NB projection)
  proj4string(raster_out) = CRS("+proj=utm +zone=9 +datum=WGS84 +units=m +no_defs +ellps=WGS84 +towgs84=0,0,0")
  #Convert from m2 to km2
  raster_out <- raster_out*1000000
  #extract connectivity
  writeRaster(raster_out, 
              filename = paste0(listSHP[i]),"GTiff", overwrite = T)
  farm_densities <- as.data.frame(raster::extract(raster_out,farm_loc))
  farm_densities$farm <- farm_loc$farm
  write.csv(x = farm_densities, file = paste0("/Volumes/1TB Bob/super pulse/sp10/try2/csv/",listSHP[i], ".csv"))
}






  

###SP2###################################################################################################################
setwd("/Volumes/1TB Bob/sp by farm/sp2/shp")
listSHP <- dir(pattern = "*.shp")
list.files()
dir.create("/Volumes/1TB Bob/sp by farm/sp2/csv/")


for (i in 1:length(listSHP)) {
  points <- readOGR(listSHP[i])
  xrange_points <- extent(points)[2] - extent(points)[1]
  yrange_points <- extent(points)[4] - extent(points)[3]
  bandwidth <- min(xrange_points,yrange_points)/8
  #weights <- points$mor #this is to weight on survivability in the kdensity
  dat.ow <- as(as(poly, "SpatialPolygons"), "owin")
  dat.pp <- as(points, "SpatialPoints")
  dat.ppp <- ppp(x = coordinates(dat.pp)[,1], y = coordinates(dat.pp)[,2], window = dat.ow)
  out.den <- density(dat.ppp, sigma = bandwidth, dimyx = dimuse, edge = TRUE, diggle = TRUE)
  # put this in the previous line after "diggle = TRUE" to weight on mortality: , weights = weights
  out.spdf <- as(as(out.den, "SpatialGridDataFrame"), "SpatialPixelsDataFrame")
  raster_out <- brick(raster(out.spdf))
  #Set projection (optional - default is WGS84) (2953 = NB projection)
  proj4string(raster_out) = CRS("+proj=utm +zone=9 +datum=WGS84 +units=m +no_defs +ellps=WGS84 +towgs84=0,0,0")
  #Convert from m2 to km2
  raster_out <- raster_out*1000000
  #extract connectivity
  writeRaster(raster_out, 
              filename = paste0(listSHP[i]),"GTiff", overwrite = T)
  farm_densities <- as.data.frame(raster::extract(raster_out,farm_loc))
  farm_densities$farm <- farm_loc$farm
  write.csv(x = farm_densities, file = paste0("/Volumes/1TB Bob/sp by farm/sp2/csv/",listSHP[i], ".csv"))
}



###SP3######################################################################################################################
setwd("/Volumes/1TB Bob/sp by farm/sp3/shp")
listSHP <- dir(pattern = "*.shp")
list.files()
dir.create("/Volumes/1TB Bob/sp by farm/sp3/csv/")


for (i in 1:length(listSHP)) {
  points <- readOGR(listSHP[i])
  xrange_points <- extent(points)[2] - extent(points)[1]
  yrange_points <- extent(points)[4] - extent(points)[3]
  bandwidth <- min(xrange_points,yrange_points)/8
  #weights <- points$mor #this is to weight on survivability in the kdensity
  dat.ow <- as(as(poly, "SpatialPolygons"), "owin")
  dat.pp <- as(points, "SpatialPoints")
  dat.ppp <- ppp(x = coordinates(dat.pp)[,1], y = coordinates(dat.pp)[,2], window = dat.ow)
  out.den <- density(dat.ppp, sigma = bandwidth, dimyx = dimuse, edge = TRUE, diggle = TRUE)
  # put this in the previous line after "diggle = TRUE" to weight on mortality: , weights = weights
  out.spdf <- as(as(out.den, "SpatialGridDataFrame"), "SpatialPixelsDataFrame")
  raster_out <- brick(raster(out.spdf))
  #Set projection (optional - default is WGS84) (2953 = NB projection)
  proj4string(raster_out) = CRS("+proj=utm +zone=9 +datum=WGS84 +units=m +no_defs +ellps=WGS84 +towgs84=0,0,0")
  #Convert from m2 to km2
  raster_out <- raster_out*1000000
  #extract connectivity
  writeRaster(raster_out, 
              filename = paste0(listSHP[i]),"GTiff", overwrite = T)
  farm_densities <- as.data.frame(raster::extract(raster_out,farm_loc))
  farm_densities$farm <- farm_loc$farm
  write.csv(x = farm_densities, file = paste0("/Volumes/1TB Bob/sp by farm/sp3/csv/",listSHP[i], ".csv"))
}


###SP4############################################################################################################################
setwd("/Volumes/1TB Bob/sp by farm/sp4/shp")
listSHP <- dir(pattern = "*.shp")
list.files()
dir.create("/Volumes/1TB Bob/sp by farm/sp4/csv/")


for (i in 1:length(listSHP)) {
  points <- readOGR(listSHP[i])
  xrange_points <- extent(points)[2] - extent(points)[1]
  yrange_points <- extent(points)[4] - extent(points)[3]
  bandwidth <- min(xrange_points,yrange_points)/8
  #weights <- points$mor #this is to weight on survivability in the kdensity
  dat.ow <- as(as(poly, "SpatialPolygons"), "owin")
  dat.pp <- as(points, "SpatialPoints")
  dat.ppp <- ppp(x = coordinates(dat.pp)[,1], y = coordinates(dat.pp)[,2], window = dat.ow)
  out.den <- density(dat.ppp, sigma = bandwidth, dimyx = dimuse, edge = TRUE, diggle = TRUE)
  # put this in the previous line after "diggle = TRUE" to weight on mortality: , weights = weights
  out.spdf <- as(as(out.den, "SpatialGridDataFrame"), "SpatialPixelsDataFrame")
  raster_out <- brick(raster(out.spdf))
  #Set projection (optional - default is WGS84) (2953 = NB projection)
  proj4string(raster_out) = CRS("+proj=utm +zone=9 +datum=WGS84 +units=m +no_defs +ellps=WGS84 +towgs84=0,0,0")
  #Convert from m2 to km2
  raster_out <- raster_out*1000000
  #extract connectivity
  writeRaster(raster_out, 
              filename = paste0(listSHP[i]),"GTiff", overwrite = T)
  farm_densities <- as.data.frame(raster::extract(raster_out,farm_loc))
  farm_densities$farm <- farm_loc$farm
  write.csv(x = farm_densities, file = paste0("/Volumes/1TB Bob/sp by farm/sp4/csv/",listSHP[i], ".csv"))
}





###SP5##############################################################################################################
setwd("/Volumes/1TB Bob/sp by farm/sp5/shp")
listSHP <- dir(pattern = "*.shp")
list.files()
dir.create("/Volumes/1TB Bob/sp by farm/sp5/csv/")


for (i in 1:length(listSHP)) {
  points <- readOGR(listSHP[i])
  xrange_points <- extent(points)[2] - extent(points)[1]
  yrange_points <- extent(points)[4] - extent(points)[3]
  bandwidth <- min(xrange_points,yrange_points)/8
  #weights <- points$mor #this is to weight on survivability in the kdensity
  dat.ow <- as(as(poly, "SpatialPolygons"), "owin")
  dat.pp <- as(points, "SpatialPoints")
  dat.ppp <- ppp(x = coordinates(dat.pp)[,1], y = coordinates(dat.pp)[,2], window = dat.ow)
  out.den <- density(dat.ppp, sigma = bandwidth, dimyx = dimuse, edge = TRUE, diggle = TRUE)
  # put this in the previous line after "diggle = TRUE" to weight on mortality: , weights = weights
  out.spdf <- as(as(out.den, "SpatialGridDataFrame"), "SpatialPixelsDataFrame")
  raster_out <- brick(raster(out.spdf))
  #Set projection (optional - default is WGS84) (2953 = NB projection)
  proj4string(raster_out) = CRS("+proj=utm +zone=9 +datum=WGS84 +units=m +no_defs +ellps=WGS84 +towgs84=0,0,0")
  #Convert from m2 to km2
  raster_out <- raster_out*1000000
  #extract connectivity
  writeRaster(raster_out, 
              filename = paste0(listSHP[i]),"GTiff", overwrite = T)
  farm_densities <- as.data.frame(raster::extract(raster_out,farm_loc))
  farm_densities$farm <- farm_loc$farm
  write.csv(x = farm_densities, file = paste0("/Volumes/1TB Bob/sp by farm/sp5/csv/",listSHP[i], ".csv"))
}


###SP6##############################################################################################################
setwd("/Volumes/1TB Bob/sp by farm/sp6/shp")
listSHP <- dir(pattern = "*.shp")
list.files()
dir.create("/Volumes/1TB Bob/sp by farm/sp6/csv/")


for (i in 1:length(listSHP)) {
  points <- readOGR(listSHP[i])
  xrange_points <- extent(points)[2] - extent(points)[1]
  yrange_points <- extent(points)[4] - extent(points)[3]
  bandwidth <- min(xrange_points,yrange_points)/8
  #weights <- points$mor #this is to weight on survivability in the kdensity
  dat.ow <- as(as(poly, "SpatialPolygons"), "owin")
  dat.pp <- as(points, "SpatialPoints")
  dat.ppp <- ppp(x = coordinates(dat.pp)[,1], y = coordinates(dat.pp)[,2], window = dat.ow)
  out.den <- density(dat.ppp, sigma = bandwidth, dimyx = dimuse, edge = TRUE, diggle = TRUE)
  # put this in the previous line after "diggle = TRUE" to weight on mortality: , weights = weights
  out.spdf <- as(as(out.den, "SpatialGridDataFrame"), "SpatialPixelsDataFrame")
  raster_out <- brick(raster(out.spdf))
  #Set projection (optional - default is WGS84) (2953 = NB projection)
  proj4string(raster_out) = CRS("+proj=utm +zone=9 +datum=WGS84 +units=m +no_defs +ellps=WGS84 +towgs84=0,0,0")
  #Convert from m2 to km2
  raster_out <- raster_out*1000000
  #extract connectivity
  writeRaster(raster_out, 
              filename = paste0(listSHP[i]),"GTiff", overwrite = T)
  farm_densities <- as.data.frame(raster::extract(raster_out,farm_loc))
  farm_densities$farm <- farm_loc$farm
  write.csv(x = farm_densities, file = paste0("/Volumes/1TB Bob/sp by farm/sp6/csv/",listSHP[i], ".csv"))
}


###SP7##############################################################################################################
setwd("/Volumes/1TB Bob/sp by farm/sp7/shp")
listSHP <- dir(pattern = "*.shp")
list.files()
dir.create("/Volumes/1TB Bob/sp by farm/sp7/csv/")


for (i in 1:length(listSHP)) {
  points <- readOGR(listSHP[i])
  xrange_points <- extent(points)[2] - extent(points)[1]
  yrange_points <- extent(points)[4] - extent(points)[3]
  bandwidth <- min(xrange_points,yrange_points)/8
  #weights <- points$mor #this is to weight on survivability in the kdensity
  dat.ow <- as(as(poly, "SpatialPolygons"), "owin")
  dat.pp <- as(points, "SpatialPoints")
  dat.ppp <- ppp(x = coordinates(dat.pp)[,1], y = coordinates(dat.pp)[,2], window = dat.ow)
  out.den <- density(dat.ppp, sigma = bandwidth, dimyx = dimuse, edge = TRUE, diggle = TRUE)
  # put this in the previous line after "diggle = TRUE" to weight on mortality: , weights = weights
  out.spdf <- as(as(out.den, "SpatialGridDataFrame"), "SpatialPixelsDataFrame")
  raster_out <- brick(raster(out.spdf))
  #Set projection (optional - default is WGS84) (2953 = NB projection)
  proj4string(raster_out) = CRS("+proj=utm +zone=9 +datum=WGS84 +units=m +no_defs +ellps=WGS84 +towgs84=0,0,0")
  #Convert from m2 to km2
  raster_out <- raster_out*1000000
  #extract connectivity
  writeRaster(raster_out, 
              filename = paste0(listSHP[i]),"GTiff", overwrite = T)
  farm_densities <- as.data.frame(raster::extract(raster_out,farm_loc))
  farm_densities$farm <- farm_loc$farm
  write.csv(x = farm_densities, file = paste0("/Volumes/1TB Bob/sp by farm/sp7/csv/",listSHP[i], ".csv"))
}


###SP8##############################################################################################################
setwd("/Volumes/1TB Bob/sp by farm/sp8/shp")
listSHP <- dir(pattern = "*.shp")
list.files()
dir.create("/Volumes/1TB Bob/sp by farm/sp8/csv/")


for (i in 1:length(listSHP)) {
  points <- readOGR(listSHP[i])
  xrange_points <- extent(points)[2] - extent(points)[1]
  yrange_points <- extent(points)[4] - extent(points)[3]
  bandwidth <- min(xrange_points,yrange_points)/8
  #weights <- points$mor #this is to weight on survivability in the kdensity
  dat.ow <- as(as(poly, "SpatialPolygons"), "owin")
  dat.pp <- as(points, "SpatialPoints")
  dat.ppp <- ppp(x = coordinates(dat.pp)[,1], y = coordinates(dat.pp)[,2], window = dat.ow)
  out.den <- density(dat.ppp, sigma = bandwidth, dimyx = dimuse, edge = TRUE, diggle = TRUE)
  # put this in the previous line after "diggle = TRUE" to weight on mortality: , weights = weights
  out.spdf <- as(as(out.den, "SpatialGridDataFrame"), "SpatialPixelsDataFrame")
  raster_out <- brick(raster(out.spdf))
  #Set projection (optional - default is WGS84) (2953 = NB projection)
  proj4string(raster_out) = CRS("+proj=utm +zone=9 +datum=WGS84 +units=m +no_defs +ellps=WGS84 +towgs84=0,0,0")
  #Convert from m2 to km2
  raster_out <- raster_out*1000000
  #extract connectivity
  writeRaster(raster_out, 
              filename = paste0(listSHP[i]),"GTiff", overwrite = T)
  farm_densities <- as.data.frame(raster::extract(raster_out,farm_loc))
  farm_densities$farm <- farm_loc$farm
  write.csv(x = farm_densities, file = paste0("/Volumes/1TB Bob/sp by farm/sp8/csv/",listSHP[i], ".csv"))
}


###SP6##############################################################################################################
setwd("/Volumes/1TB Bob/sp by farm/sp9/shp")
listSHP <- dir(pattern = "*.shp")
list.files()
dir.create("/Volumes/1TB Bob/sp by farm/sp9/csv/")


for (i in 1:length(listSHP)) {
  points <- readOGR(listSHP[i])
  xrange_points <- extent(points)[2] - extent(points)[1]
  yrange_points <- extent(points)[4] - extent(points)[3]
  bandwidth <- min(xrange_points,yrange_points)/8
  #weights <- points$mor #this is to weight on survivability in the kdensity
  dat.ow <- as(as(poly, "SpatialPolygons"), "owin")
  dat.pp <- as(points, "SpatialPoints")
  dat.ppp <- ppp(x = coordinates(dat.pp)[,1], y = coordinates(dat.pp)[,2], window = dat.ow)
  out.den <- density(dat.ppp, sigma = bandwidth, dimyx = dimuse, edge = TRUE, diggle = TRUE)
  # put this in the previous line after "diggle = TRUE" to weight on mortality: , weights = weights
  out.spdf <- as(as(out.den, "SpatialGridDataFrame"), "SpatialPixelsDataFrame")
  raster_out <- brick(raster(out.spdf))
  #Set projection (optional - default is WGS84) (2953 = NB projection)
  proj4string(raster_out) = CRS("+proj=utm +zone=9 +datum=WGS84 +units=m +no_defs +ellps=WGS84 +towgs84=0,0,0")
  #Convert from m2 to km2
  raster_out <- raster_out*1000000
  #extract connectivity
  writeRaster(raster_out, 
              filename = paste0(listSHP[i]),"GTiff", overwrite = T)
  farm_densities <- as.data.frame(raster::extract(raster_out,farm_loc))
  farm_densities$farm <- farm_loc$farm
  write.csv(x = farm_densities, file = paste0("/Volumes/1TB Bob/sp by farm/sp9/csv/",listSHP[i], ".csv"))
}

###SP10##############################################################################################################
setwd("/Volumes/1TB Bob/sp by farm/sp10/shp")
listSHP <- dir(pattern = "*.shp")
list.files()
dir.create("/Volumes/1TB Bob/sp by farm/sp10/csv/")


for (i in 1:length(listSHP)) {
  points <- readOGR(listSHP[i])
  xrange_points <- extent(points)[2] - extent(points)[1]
  yrange_points <- extent(points)[4] - extent(points)[3]
  bandwidth <- min(xrange_points,yrange_points)/8
  #weights <- points$mor #this is to weight on survivability in the kdensity
  dat.ow <- as(as(poly, "SpatialPolygons"), "owin")
  dat.pp <- as(points, "SpatialPoints")
  dat.ppp <- ppp(x = coordinates(dat.pp)[,1], y = coordinates(dat.pp)[,2], window = dat.ow)
  out.den <- density(dat.ppp, sigma = bandwidth, dimyx = dimuse, edge = TRUE, diggle = TRUE)
  # put this in the previous line after "diggle = TRUE" to weight on mortality: , weights = weights
  out.spdf <- as(as(out.den, "SpatialGridDataFrame"), "SpatialPixelsDataFrame")
  raster_out <- brick(raster(out.spdf))
  #Set projection (optional - default is WGS84) (2953 = NB projection)
  proj4string(raster_out) = CRS("+proj=utm +zone=9 +datum=WGS84 +units=m +no_defs +ellps=WGS84 +towgs84=0,0,0")
  #Convert from m2 to km2
  raster_out <- raster_out*1000000
  #extract connectivity
  writeRaster(raster_out, 
              filename = paste0(listSHP[i]),"GTiff", overwrite = T)
  farm_densities <- as.data.frame(raster::extract(raster_out,farm_loc))
  farm_densities$farm <- farm_loc$farm
  write.csv(x = farm_densities, file = paste0("/Volumes/1TB Bob/sp by farm/sp10/csv/",listSHP[i], ".csv"))
}





















####before I had it in a looping form#####
######farm1, sp1#############################################################################
setwd("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp1/shp/")
points <- readOGR("f1_sp1.RDS.shp")
setwd("/Volumes/1TB Bob/shapefiles from FVCOM grid/")
poly <- readOGR("250m_both.shp")
#double check points are where they should be
plot(poly)
map.axes()
points(points)
#triple check that the projection is the same for the points and for the polygon
proj4string(points)
proj4string(poly)

#Get bandwidth information and cell size
#Note both are in EPSG:2953 - projected in metres
xrange_points = extent(points)[2] - extent(points)[1]
yrange_points = extent(points)[4] - extent(points)[3]
bandwidth <- min(xrange_points,yrange_points)/8
gridsize <- 10
xrange_poly <- extent(poly)[2] - extent(poly)[1]
yrange_poly <- extent(poly)[4] - extent(poly)[3]
cellsx <- xrange_poly/gridsize
cellsy <- yrange_poly/gridsize

#Generate kernel density surface (using Diggle's edge correction; diggle = TRUE in the density command)
dimuse <- c(cellsy, cellsx)
#weights <- points$mor #this is to weight on survivability in the kdensity
dat.ow <- as(as(poly, "SpatialPolygons"), "owin")
dat.pp <- as(points, "SpatialPoints")
dat.ppp <- ppp(x = coordinates(dat.pp)[,1], y = coordinates(dat.pp)[,2], window = dat.ow)
out.den <- density.ppp(dat.ppp, sigma = bandwidth, dimyx = dimuse, edge = TRUE, diggle = TRUE)
                   , weights = weights)
out.spdf <- as(as(out.den, "SpatialGridDataFrame"), "SpatialPixelsDataFrame")
raster_out <- brick(raster(out.spdf))
#Set projection (optional - default is WGS84) (2953 = NB projection)
proj4string(raster_out) = CRS("+proj=utm +zone=9 +datum=WGS84 +units=m +no_defs +ellps=WGS84 +towgs84=0,0,0")
#Convert from m2 to km2
raster_out <- raster_out*1000000
writeRaster(raster_out, file = "/Volumes/1TB Bob/test2.tiff","GTiff", overwrite = T)
plot(raster_out)
#plot(points, add = T, pch = 16, cex = 0.5)

#import farm locations
farm_loc <- readOGR("/Volumes/My Passport for Mac/farm locations/farm_loc9N.shp")
plot(poly)
points(farm_loc)
map.axes()

#extract connectivity info                    
farm_densities <- as.data.frame(raster::extract(raster_out,farm_loc))
farm_densities$farm <- farm_loc$farm
write.csv(farm_densities,file = "/Volumes/My Passport for Mac/for meeting/f1_sp1_infectionpressures.csv")
###can verify that these are correct by opening tiff files in QGIS and then using the point sampling tool 
