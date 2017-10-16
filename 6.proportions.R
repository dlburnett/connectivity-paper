
library(tidyr)
library(dplyr)
library(readr)
library(RColorBrewer)
library(tidyverse)
library(ggplot2)

setwd("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp1/csv")


##no biological parameters
for (j in 1:139) {
  #setwd(paste0("/Volumes/1TB Bob/sp by farm/sp bio/sp", j, "/csv_bio/"))
  setwd(paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp", j, "/csv/"))
  listSHP <- dir(pattern = "*.csv")
  list.files()
  dir.create(paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/prop_heatmap/"))

  #combine csv's and rename columns to reflect which farm they are from
  df <- list.files(full.names = TRUE) %>% 
    lapply(read_csv, col_types = "_d_") %>% 
    bind_cols() %>% 
    as.data.frame()
  
  colnames(df) <- sort(as.character(1:20)) 
  rownames(df) <- sort(as.character(1:20))
  
  #turn absolute numbers into a proportion
 df2 <- df[,1:20]/13200
 
 #save the values matrix as a csv
 write.csv(file = paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/prop_heatmap/sp", j, "_no_bio.csv"), x = df2 )
 
 #get the data into tidy/long form for ggplot
 dat2 <- df2 %>%
   tbl_df() %>%
   rownames_to_column('to') %>%
   gather(from, value, -to) %>%
   mutate(
     to = as.character(to, levels=1:20),
     from = as.character(gsub("v", "", from), levels = 1:20)
   )
 
 #now make the heat map using ggplot
 dat2$to<- factor(dat2$to, c(20, 19, 18, 17, 16, 7, 10, 15, 11, 6, 9, 14, 13, 12, 8, 4, 5, 1, 2, 3))
 dat2$from<- factor(dat2$from, c(20, 19, 18, 17, 16, 7, 10, 15, 11, 6, 9, 14, 13, 12, 8, 4, 5, 1, 2, 3))

 
 p1 <- ggplot(dat2, aes(from, to)) +
   geom_tile(aes(fill = value)) + 
   scale_fill_gradient(low = "white", high = "red", limits = c(0,.010))
  
 
 #save the heatmap
 p1
 setwd("/Volumes/1TB Bob/sp by farm/super pulse RDS files/prop_heatmap/")
 ggsave(paste0("sp",j, "_no_bio.png"), plot = p1)
  
}

###with biological parameters########################################################################################
for (j in 1:139) {
  setwd(paste0("/Volumes/1TB Bob/sp by farm/sp bio/sp", j, "/csv_bio/"))
  listSHP <- dir(pattern = "*.csv")
  list.files()
  dir.create(paste0("/Volumes/1TB Bob/sp by farm/sp bio/prop_heatmap"))

  #combine csv's and rename columns to reflect which farm they are from
  df <- list.files(full.names = TRUE) %>% 
    lapply(read_csv, col_types = "_d_") %>% 
    bind_cols() %>% 
    as.data.frame()
  
  colnames(df) <- sort(as.character(1:20)) 
  rownames(df) <- sort(as.character(1:20))
  
  #turn absolute numbers into a proportion
  df2 <- df[,1:20]/13200
  
  #save the values matrix as a csv
  write.csv(file = paste0("/Volumes/1TB Bob/sp by farm/sp bio/prop_heatmap/sp", j, "_withbio"), x = df2 )

  #get the data into tidy/long form for ggplot
  dat2 <- df2 %>%
    tbl_df() %>%
    rownames_to_column('to') %>%
    gather(from, value, -to) %>%
    mutate(
      to = as.character(to, levels=1:20),
      from = as.character(gsub("v", "", from), levels = 1:20)
    )
  
  #now make the heat map using ggplot
  dat2$to<- factor(dat2$to, c(20, 19, 18, 17, 16, 7, 10, 15, 11, 6, 9, 14, 13, 12, 8, 4, 5, 1, 2, 3))
  dat2$from<- factor(dat2$from, c(20, 19, 18, 17, 16, 7, 10, 15, 11, 6, 9, 14, 13, 12, 8, 4, 5, 1, 2, 3))
  
  p1 <- ggplot(dat2, aes(from, to)) +
    geom_tile(aes(fill = value)) + 
    scale_fill_gradient(low = "white", high = "red", limits = c(0,.00050))
  
  #save the heatmap
  p1
  setwd("/Volumes/1TB Bob/sp by farm/sp bio/prop_heatmap")
  ggsave(paste0("sp",j, "_withbio.png"), plot = p1)
  
}
  
  
  
  
  
  
  
  
  
  