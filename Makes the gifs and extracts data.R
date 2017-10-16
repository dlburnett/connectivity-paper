#Jeff's code:
library(ncdf4)
setwd("/Volumes/1TB Bob/broughton/Erin from DFO_IOS/run_file_br55/output")
BA1 <- nc_open('br55_r1_Mar09_br500_1.nc')


# Individual variables can be extracted using ncvar_get()
summary(BA1$var)    # List of variable names
print(BA1)          # Variable names and units
# Extract x and y coordinates: PROJECTION CURRENTLY UNKNOWN, these are in meters, but reference
# point is uncertain.
particlesx <- ncvar_get(BA1, varid="x")
particlesy <- ncvar_get(BA1, varid="y")

# Initial particle positions are in the first columns of particlesx and particlesy; extract as
# XY coordinates:

initpos <- data.frame(particlesx[,1], particlesy[,1])

## Create new data frame column for farm ID; plot in XY space (NO PROJECTION YET!!!); rename columns
initpos$farm <- rep(1:20,each=50)
names(initpos) <- c("initx","inity","farm")
plot(initpos$initx, initpos$inity, col=initpos$farm)

## Same process to look at final position (end of simulation)
finalpos <- data.frame(particlesx[,796], particlesy[,796])
finalpos$farm <- rep(1:20,each=50)
names(finalpos) <- c("finalx","finaly","farm")
plot(finalpos$finalx, finalpos$finaly, col=initpos$farm)

## export as csv ##
write.csv(finalpos, 'finalpos.csv')

## Do an intermediate time step of, say, 1 day ##

midpos <- data.frame(particlesx[,72], particlesy[,72])
midpos$farm <- rep(1:20,each=50)
names(midpos) <- c("initx","inity","farm")
write.csv(midpos, 'midpos.csv')





#Derek's code
library(raster)

par(mfrow = c(1,1))

for (i in 1:2) {
rasBA1 <- raster(paste0('br55_r1_Mar09_br500_', i, '.nc'))
plot(rasBA1)
}

library(dplyr)
temp <- raster("br55_r1_Mar09_br500_1.nc", varname= "temp") 
x <- raster("br55_r1_Mar09_br500_1.nc", varname= "x") 
y <- raster("br55_r1_Mar09_br500_1.nc", varname= "y") 


plot(r)

summary(BA1$var) 
print(BA1) 

particlesx <- ncvar_get(BA1, varid="x")
particlesy <- ncvar_get(BA1, varid="y")
initpos <- data.frame(particlesx[,1], particlesy[,1])

initpos$farm <- rep(1:20,each=50)
names(initpos) <- c("initx","inity","farm")
plot(initpos$initx, initpos$inity)

finalpos <- data.frame(particlesx[,796], particlesy[,796])
finalpos$farm <- rep(1:20,each=50)
names(finalpos) <- c("finalx","finaly","farm")
plot(finalpos$finalx, finalpos$finaly)

midpos <- data.frame(particlesx[,72], particlesy[,72])
midpos$farm <- rep(1:20,each=50)
names(midpos) <- c("initx","inity","farm")
write.csv(midpos, 'midpos.csv')
plot(midpos$initx, midpos$inity, col=initpos$farm)






##Derek's code

library(raster)
library(tidyverse)
library(animation)



# set the working directory
setwd("~/Documents/broughton/Erin from DFO_IOS/run_file_br55/")

# colors
#catz <- viridis::plasma(20)

# read the names of the files in the folder called fig2
#change the name of the folder to make one for each month
files <- dir("june")

# loop through the filenames 
for (i in files) {
  # extract each variable you are interested in
  ind <- raster(paste0("june/", i), varname = "indomain") %>% as.data.frame()
  lon <- raster(paste0("june/", i), varname = "x") %>% as.data.frame()
  lat <- raster(paste0("june/", i), varname = "y") %>% as.data.frame()
  dep <- raster(paste0("june/", i), varname = "z") %>% as.data.frame()
  mor <- raster(paste0("june/", i), varname = "m") %>% as.data.frame()
  mat <- raster(paste0("june/", i), varname = "tm") %>% as.data.frame()
  sal <- raster(paste0("june/", i), varname = "salt") %>% as.data.frame()
  tmp <- raster(paste0("june/", i), varname = "temp") %>% as.data.frame()

  # create a data frame with above vectors 
  dat <- data.frame(expand.grid(nlag = as.character(1:1000), 
                                time = rev(1:796)),
                    farm = as.character(rep(1:20, each = 50, times = 796)),
                    lon, lat, dep, mor, mat, sal, tmp, ind, i)
  
  # short names are easier to type ;)
  names(dat) <- c("nlag", "time", "farm", "lon", "lat", "dep", 
                  "mor", "mat", "sal", "tmp", "ind", "source")

  # get the location of each farm by averaging the position at timestep 1
  farm_loc <- dat %>%
    filter(time == 1) %>% 
    group_by(farm) %>% 
    summarise(lat = mean(lat), lon = mean(lon))
  
  
  # plot
  
  ggplot(dat, aes(lon, lat)) + 
    # color by farm, alpha=transparency
    geom_path(aes(color = farm, group = nlag), alpha = 1/10) +
    # fish farms
    geom_point(data = farm_loc, aes(fill = farm), shape = 21) +
    # get rid of legends
    guides(color = "none", alpha = "none", fill = "none") +
    ##scale_color_manual(values = catz) +
    ##scale_fill_manual(values = catz) +
    # change axes labels
    labs(x = "", y = "") +
    # set coordinates to equal length... almost like a map
    coord_equal(xlim = c(-1e+05, 1e+05), ylim = c(90000, 170000)) +
    # theme settings
    theme_minimal() +
    theme(panel.grid   = element_blank(),
          panel.border = element_rect(color = "grey", fill = NA),
          axis.text =element_blank(), axis.ticks=element_blank()
         
          )
  
  # create fig2 directory
  dir.create("june_png")
  ggsave(paste0("june_png/", i, ".png"), width = 8)
}

## to make a GIF, put this in the terminal of the computer (not in R)
##to set directory:
#cd ~/Documents/broughton/Erin\ from\ DFO_IOS/run_file_br55/june_png/
# but rename the gif for whatever month it is
# convert -delay 50 -loop 0 *.png june.gif

