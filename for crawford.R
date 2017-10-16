library(dplyr)
library(readr)
library(RColorBrewer)
library(tidyverse)
library(tidyr)
library(ggplot2)

####################################################################################################################
#####################combine csv's into one csv#####################################################################

#column names are the "from", row names are the "to" for the connectivity matrixes 
#NEED TO PUT ALL THE CSV'S INTO THEIR OWN SUB FOLDER 

###comment out either with or without bio parameter lines as necessary
for (j in 1:5) {
  #setwd(paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp", j, "/csv/")) ##no bio parameters
  setwd(paste0("/Volumes/1TB Bob/sp by farm/sp bio/sp", j, "/csv_bio/"))  ##with bio parameters
  listSHP <- dir(pattern = "*.csv")
  list.files()

#combine csv's and rename columns to reflect which farm they are from
  df <- list.files(full.names = TRUE) %>% 
  lapply(read_csv, col_types = "_d_") %>% 
  bind_cols() %>% 
  as.data.frame()

colnames(df) <- sort(as.character(1:20)) 
rownames(df) <- sort(as.character(1:20))

#reorder the rows and columns to custom order
df <- df[c("20", "19", "18", "17", "16", "7", "10", "15", "11", "6", "9", "14", "13", "12", "8", "4", "5", "1", "2", "3")]
df <- df[c("20", "19", "18", "17", "16", "7", "10", "15", "11", "6", "9", "14", "13", "12", "8", "4", "5", "1", "2", "3"),]

#save the csv's
#write.csv(x = df, file = paste0("/Volumes/1TB Bob/send to crawford/sp", j, ".csv")) #no bio
write.csv(x = df, file = paste0("/Volumes/1TB Bob/send to crawford/sp", j, "with_bio.csv")) #with bio

dat2 <- df %>%
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
  #scale_fill_gradient(low = "white", high = "red", limits = c(0,160), breaks = c(0, 40, 80, 120, 160)) #without bio
   scale_fill_gradient(low = "white", high = "red") #with bio 

p1
setwd("/Volumes/1TB Bob/send to Crawford")
#ggsave(paste0("sp",j, ".png"), plot = p1) #no bio parameters
ggsave(paste0("sp",j, "with_bio.png"), plot = p1) #with bio parameters
}



####turn into proportions
###with biological parameters########################################################################################
for (j in 1:5) {
  setwd("/Volumes/1TB Bob/send to crawford/")
  df <- read.csv(file = paste0("sp", j, "with_bio.csv"), row.names = 1, check.names = F)
  #turn absolute numbers into a proportion
  df2 <- df[,1:20]/13200
  
  #save the values matrix as a csv
  write.csv(x = df2, file = paste0("/Volumes/1TB Bob/send to crawford/sp", j, "_with_bio_proportion.csv"))
            
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
    scale_fill_gradient(low = "white", high = "red") 
  
  #save the heatmap
  p1
  setwd("/Volumes/1TB Bob/send to crawford")
  ggsave(paste0("sp",j, "_with_bio_proportion.png"), plot = p1)
  
}



dat2$to<- factor(dat2$to, c(20, 19, 18, 17, 16, 7, 10, 15, 11, 6, 9, 14, 13, 12, 8, 4, 5, 1, 2, 3))
dat2$from<- factor(dat2$from, c(20, 19, 18, 17, 16, 7, 10, 15, 11, 6, 9, 14, 13, 12, 8, 4, 5, 1, 2, 3))
