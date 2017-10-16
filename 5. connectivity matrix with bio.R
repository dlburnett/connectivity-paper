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



for (j in 1:1) {
  setwd(paste0("/Volumes/1TB Bob/sp by farm/sp bio/sp", j, "/csv_bio/"))
  listSHP <- dir(pattern = "*.csv")
  list.files()
  dir.create(paste0("/Volumes/1TB Bob/sp by farm/sp bio/heatmap"))

#combine csv's and rename columns to reflect which farm they are from
  df <- list.files(full.names = TRUE) %>% 
  lapply(read_csv, col_types = "_d_") %>% 
  bind_cols() %>% 
  as.data.frame()

colnames(df) <- sort(as.character(1:20)) 
rownames(df) <- sort(as.character(1:20))

#get the data into tidy/long form for ggplot
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
  scale_fill_gradient(low = "white", high = "red")

, limits = c(0,80), breaks = c(0, 20, 40, 60, 80)) 
#p1 + geom_text(aes(label = value), size = 1.5)
p1
setwd("/Volumes/1TB Bob/sp by farm/sp bio/heatmap")
ggsave(paste0("sp",j, "_bio.png"), plot = p1)
}




ggsave(filename = paste0("/Volumes/1TB Bob/connectivity matrixes/try/sp", j, ".pdf"), plot = p1)




















#March
setwd("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp1/csv_bio")
setwd("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp2/csv_bio")
setwd("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp3/csv_bio")
setwd("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp4/csv_bio")
setwd("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp5/csv_bio")
setwd("/Volumes/1TB Bob/sp by farm/sp5/csv")
setwd("/Volumes/1TB Bob/sp by farm/sp6/csv")
setwd("/Volumes/1TB Bob/sp by farm/sp7/csv")
setwd("/Volumes/1TB Bob/sp by farm/sp8/csv")
setwd("/Volumes/1TB Bob/sp by farm/sp9/csv")
setwd("/Volumes/1TB Bob/sp by farm/sp10/csv")
setwd("/Volumes/1TB Bob/sp by farm/sp20/csv")

#April
setwd("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp29/csv")
setwd("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp30/csv")
setwd("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp31/csv")
setwd("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp32/csv")
setwd("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp33/csv")

#May
setwd("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp59/csv")
setwd("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp60/csv")
setwd("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp61/csv")
setwd("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp62/csv")
setwd("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp63/csv")

#June
setwd("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp90/csv")
setwd("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp91/csv")
setwd("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp92/csv")
setwd("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp93/csv")
setwd("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp94/csv")


#July
setwd("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp120/csv")
setwd("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp121/csv")
setwd("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp122/csv")
setwd("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp123/csv")
setwd("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp124/csv")



p1 <- ggplot(dat2, aes(from, to)) +
  geom_tile(aes(x = reorder(20, 19, 18, 17, 16, 7, 10, 15, 11, 6, 9, 14, 13, 12, 8, 4, 5, 1, 2, 3), y =  fill = value)) + 
  scale_fill_gradient(low = "white", high = "red",limits = c(0,160), breaks = c(0, 40, 80, 120, 160)) 
p1
