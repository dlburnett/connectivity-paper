
setwd("C:\\Work\\06 Aquaculture\\Danielle Burnett\\R - Kernel Simulation")

  library("maptools")
  library("spatstat")
  library("shapefiles")
  library("raster")
  library("rgeos")
  library("rgdal")
setwd("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp10/shp")
  #Define Plot Dimensions (100x100m = 1 ha)
    x_width<-100
    y_width<-100

    dd <- data.frame(Id=c(1),X=c(0,x_width,x_width,0,0),Y=c(0,0,y_width,y_width,0))
    ddTable <- data.frame(Id=c(1),Name=c("Item1"))
    ddShapefile <- convert.to.shapefile(dd, ddTable, "Id", 5)
  write.shapefile(ddShapefile, "simulation_plot", arcgis=T)

  poly<-readShapePoly(".shp")
  plot(poly)


# Simulate points (several options - must make the shapefile after)

#### Option 1 (few points, strong clustering)
  p<-10 #number of points to add
  
  #Strong clustering  (little edge effect correction)
  lambda = function(x,y,a,b) {a*dnorm(x,x_width/2,b)*dnorm(y,y_width/2,b)} # intensity function
  random_pts = rpoispp(lambda, win=poly,a=p*3,b=12.5) # simulation (using thinning)
  x <- head(random_pts$x,p)
  y <- head(random_pts$y,p)
  #...now make the shapefile (below)

 
#### Option 2 (lots of points, strong clustering)
  p<-500 #number of points to add
  
  #Strong clustering  (little edge effect correction)
  lambda = function(x,y,a,b) {a*dnorm(x,x_width/2,b)*dnorm(y,y_width/2,b)} # intensity function
  random_pts = rpoispp(lambda, win=poly,a=p*3,b=12.5) # simulation (using thinning)
  x <- head(random_pts$x,p)
  y <- head(random_pts$y,p)
  #...now make the shapefile (below)


#### Option 3 (few points, weak clustering)
  p<-10
  #Weak clustering  (more edge effect correction)
  lambda = function(x,y,a,b) {a*dnorm(x,x_width/2,b)*dnorm(y,y_width/2,b)} # intensity function
  random_pts = rpoispp(lambda, win=poly,a=p*3,b=50) # simulation (using thinning)
  x <- head(random_pts$x,p)
  y <- head(random_pts$y,p)
  #...now make the shapefile (below)


#### Option 4 (lots of points, weak clustering)
  p<-500
  #Weak clustering  (more edge effect correction)
  lambda = function(x,y,a,b) {a*dnorm(x,x_width/2,b)*dnorm(y,y_width/2,b)} # intensity function
  random_pts = rpoispp(lambda, win=poly,a=p*3,b=50) # simulation (using thinning)
  x <- head(random_pts$x,p)
  y <- head(random_pts$y,p)
  #...now make the shapefile (below)


# Make the shapefile  
  dd <- data.frame(Id=c(1:p),X=x,Y=y)
  ddTable <- data.frame(Id=c(1:p),Name=c("Item1"))
  ddShapefile <- convert.to.shapefile(dd, ddTable, "Id", 1)
  write.shapefile(ddShapefile, "simulation_points", arcgis=T)

  # Show the points and poly
  plot(poly)
  plot(points, add=T)

# Make kernel density
  #Get bandwidth information and determine cell size (based on desired dimensions)
  #Note both are in EPSG:2953 - projected in metres
  xrange_points=extent(points)[2]-extent(points)[1]
  yrange_points=extent(points)[4]-extent(points)[3]
  bandwidth <-min(xrange_points,yrange_points)/8
  
  gridsize<-25 #note, usually 100, but now the grid is only 100x100
  # This is what I was playing with to figure out the region:raster grid scale relationship
  xrange_poly=extent(poly)[2]-extent(poly)[1]
  yrange_poly=extent(poly)[4]-extent(poly)[3]
  cellsx<- xrange_poly/gridsize
  cellsy<- yrange_poly/gridsize
  
  #Generate kernel density surface (using Diggle's edge correction)
  dimuse = c(cellsy, cellsx)
  dat.ow <- as(as(poly, "SpatialPolygons"), "owin")
  
  dat.pp = as(points, "SpatialPoints")
  dat.ppp = ppp(x = coordinates(dat.pp)[,1], y = coordinates(dat.pp)[,2], window = dat.ow)
  out.den = density(dat.ppp, sigma = bandwidth, dimyx = dimuse, edge=TRUE, diggle=TRUE)
  out.spdf = as(as(out.den, "SpatialGridDataFrame"), "SpatialPixelsDataFrame")
  raster_out <- brick(raster(out.spdf))
  
  
  
  
  
  writeRaster(raster_out,"Kdensity_simulation.tif","GTiff", overwrite=T)
  
  setwd("/Volumes/1TB Bob/shapefiles from FVCOM grid")
  poly <- readOGR("250m_both.shp")
  xrange_poly=extent(poly)[2]-extent(poly)[1]
  yrange_poly=extent(poly)[4]-extent(poly)[3]
  
  setwd("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp10/shp")
  raster_out <- raster("f1_sp10.RDS.tif")
  #Final product!
  plot(raster_out)
  plot(points, add=T)
  
  
  cellStats(raster_out, 'sum')
  tapply(area(raster_out), raster_out[], sum)
  cellStats(raster_out, 'sum') #Sum of all values
  ncell(raster_out) #Number of cells in grid
  


  area <- xrange_poly * yrange_poly
  #Solved it!
  (cellStats(raster_out, 'sum') / ncell(raster_out)) * (xrange_poly*yrange_poly)
  (cellStats(raster_out, 'sum') / ncell(raster_out)) * area
  # (Sum of all raster values / total number of cells ) * Regional surface area
  # You may have to remove land surface area for your calculations to work!  
    # Using the library(rgeos), you can get the surface area - that might help!
  
  
  library(geosphere)
  geosphere::areaPolygon(poly)
  rgeos::gArea(poly)
  
  
  rgeos::area.poly(raster_out)
    area2 <- gArea(raster_out)
    (cellStats(raster_out, 'sum') / ncell(raster_out)) *  48962.04
      
      5413928693
  plot(poly)
    area(poly)
    area_raster <- raster::area(raster_out, na.rm = TRUE)
    cellStats(area_raster, 'sum')
