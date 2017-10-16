library(raster)
library(tidyverse)
library(ncdf4)
library(plyr)

# set the working directory
getwd()
setwd("/Volumes/1TB Bob/super pulse/sp1")
#setwd("Volumes/My Passport for Mac/")


####get the netCDF files into RDS files############################################
sp <- dir()
# read the names of the files in the folder called sp1 
files <- dir()
dat <- data.frame()
# loop through the filenames 
for (j in sp) {
  
  # read the names of the files in the folder called sp1 
  files <- dir()
  dat <- data.frame()
  
for (i in files) {
  # extract each variable you are interested in
  ind <- raster(paste0("", i), varname = "indomain") %>% as.data.frame()
  lon <- raster(paste0("", i), varname = "x") %>% as.data.frame()
  lat <- raster(paste0("", i), varname = "y") %>% as.data.frame()
  dep <- raster(paste0("", i), varname = "z") %>% as.data.frame()
  mor <- raster(paste0("", i), varname = "m") %>% as.data.frame()
  mat <- raster(paste0("", i), varname = "tm") %>% as.data.frame()
  sal <- raster(paste0("", i), varname = "salt") %>% as.data.frame()
  tmp <- raster(paste0("", i), varname = "temp") %>% as.data.frame()
  
  # create a data frame with above vectors 
  df1 <- data.frame(expand.grid(nlag  = as.character(1:1000), 
                                 time = rev(1:(length(tmp[,1])/1000))
                                ),
                    farm = as.numeric(rep(1:20, 
                                            each = 50, 
                                            times = length(tmp[,1])/1000)
                                        ),
                    lon, lat, dep, mor, mat, sal, tmp, ind, i
                    )
  
  # short names are easier to type ;)
  names(df1) <- c("nlag", "time", "farm", "lon", "lat", "dep", 
                  "surv", "mat", "sal", "tmp", "ind", "source")
  
  dat <- filter(df1, as.numeric(time) %in% c(seq(73, 793, 72))) %>% 
    bind_rows(dat)
  
  #dat <- filter(df1) %>%
   # bind_rows(dat)
}
}

dat1 <- dat %>% 
  separate(source, c("br", "r", "date", "br2", "pulse"), extra = "drop") %>% 
  mutate(pulse = as.numeric(pulse)) %>% 
  arrange(pulse) %>% 
  select(-br, -r, -date)

dat2 <- dat1%>% 
mutate(lat2 = lat + 5500206.4, 
       lon2 = lon + 495942.1, 
       mor  = (1 - surv)
)

getwd()
setwd("/Volumes/1TB Bob/big sp files")
saveRDS(dat2, file = "sp1.RDS")













readRDS(sp10_try2.RDS)

setwd("/Volumes/1TB Bob/super pulse/sp1")
files <- dir()
files

sp <- list()
listRDS <- dir(pattern = "*.RDS")
for (i in 1:length(listRDS)) {
  readRDS(listRDS[i]) %>% 
    mutate(lat2 = lat + 5500206.4, 
           lon2 = lon + 495942.1, 
           mor  = (1 - surv)
           ) %>% 
    saveRDS(paste0("new/sp", i, ".RDS"))
}






