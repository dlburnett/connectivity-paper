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

for (j in 103:139) {
  #dir.create(paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp", j,"/shp_bio"))
  #setwd(paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp", j, "/shp"))
  setwd(paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp", j, "/shp"))
  listSHP <- dir(pattern = "*.shp")
  list.files()
  dir.create(paste0("/Volumes/1TB Bob/sp by farm/sp bio/sp", j, "/csv_bio"))


  
  for (i in 1:length(listSHP)) {
    points <- readOGR(listSHP[i])
    #subset so that only infectious particles are included, this is unique for the biological model KDE
    #points <- subset(points, mat >= 1)
    xrange_points <- extent(points)[2] - extent(points)[1]
    yrange_points <- extent(points)[4] - extent(points)[3]
    bandwidth <- min(xrange_points,yrange_points)/8
    points <- subset(points, mat >= 0.8)
    weights <- points$surv
    dat.ow <- as(as(poly, "SpatialPolygons"), "owin")
    dat.pp <- as(points, "SpatialPoints")
    dat.ppp <- ppp(x = coordinates(dat.pp)[,1], y = coordinates(dat.pp)[,2], window = dat.ow)
    #next line includes a weighting for survivability
    out.den <- density(dat.ppp, sigma = bandwidth, dimyx = dimuse, edge = TRUE, diggle = TRUE, weights = weights)
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
    write.csv(x = farm_densities, file = paste0("/Volumes/1TB Bob/sp by farm/sp bio/sp", j, "/csv_bio/", listSHP[i], ".csv"))
  }
}
















points <- readOGR("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp26/shp/f5_sp26.RDS.shp")
points <- readOGR("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp1/shp/f10_sp1.RDS.shp")
one <- subset(points, nlag == "10")
plot(points$surv)


View(nlag)

plot(points$surv, points$time)
points2 <- subset(points, mat >= 1)
plot(points2)
plot(points$mats)

marks(dat.ppp) <- points[,c(7, 8)] 

dat.ppp %mark% dat.ppp$
  m1 <- setmarks(dat.ppp, weights)

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


