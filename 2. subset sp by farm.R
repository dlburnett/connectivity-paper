library(tidyverse)
library(readr)
setwd("/Volumes/1TB Bob/big sp files/bio sp")

for (j in 1:1) {
  
  assign(paste0("sp", j),read_rds(paste0("sp", j, "_bio.RDS")))
}


##subsetting all the RDS files by farm into individual RDS files 
###################subset each farm##################################################
setwd("/Volumes/1TB Bob/sp by farm/sp bio/sp1")

#######sp1
df_list <- split(sp1, sp1$farm)
new_names <- paste0("f", 1:20, "_sp1_bio")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  = paste0(new_names[i], ".RDS"))
}


######sp2
df_list <- split(sp1, sp1$farm)
new_names <- paste0("f", 1:20, "_sp1")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  = paste0(new_names[i], ".RDS"))
}

f5_sp1 <- read_rds("f5_sp1_bio.RDS")
View(f5_sp3)

######sp3
df_list <- split(sp3, sp3$farm)
new_names <- paste0("f", 1:20, "_sp3")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  = paste0(new_names[i], ".RDS"))
}



######sp4
df_list <- split(sp4, sp4$farm)
new_names <- paste0("f", 1:20, "_sp4")
setwd("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp4") 
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  dir.create("sp4")
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp4/", new_names[i], ".RDS"))
}


######sp5
df_list <- split(sp5, sp5$farm)
setwd("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp5")
new_names <- paste0("f", 1:20, "_sp5")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  dir.create("sp5")
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp5/", new_names[i], ".RDS"))
}

#sp6
df_list <- split(sp6, sp6$farm)
new_names <- paste0("f", 1:20, "_sp6")
setwd("/Volumes/1TB Bob/sp by farm/sp6") 
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  dir.create("sp6")
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp6/", new_names[i], ".RDS"))
}


######sp7
df_list <- split(sp7, sp7$farm)
new_names <- paste0("f", 1:20, "_sp7")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  dir.create("sp7")
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp7/", new_names[i], ".RDS"))
}

######sp8
df_list <- split(sp8, sp8$farm)
new_names <- paste0("f", 1:20, "_sp8")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  dir.create("sp8")
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp8/", new_names[i], ".RDS"))
  
}

######sp9
df_list <- split(sp9, sp9$farm)
new_names <- paste0("f", 1:20, "_sp9")
dir.create("/Volumes/1TB Bob/sp by farm/sp9/")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  dir.create("sp9")
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp9/", new_names[i], ".RDS"))
  
}
 

######sp10
df_list <- split(sp10, sp10$farm)
new_names <- paste0("f", 1:20, "_sp10")
dir.create("sp10")
setwd("/Volumes/1TB Bob/sp by farm/sp10") 
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp10/", new_names[i], ".RDS"))
  
}


######sp11
df_list <- split(sp11, sp11$farm)
new_names <- paste0("f", 1:20, "_sp11")
dir.create("sp11")
setwd("/Volumes/1TB Bob/sp by farm/sp11") 
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp11/", new_names[i], ".RDS"))
  
}


######sp12
df_list <- split(sp12, sp12$farm)
new_names <- paste0("f", 1:20, "_sp12")
dir.create("sp12")
setwd("/Volumes/1TB Bob/sp by farm/sp12") 
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp12/", new_names[i], ".RDS"))
  
}


#######sp13
df_list <- split(sp13, sp13$farm)
new_names <- paste0("f", 1:20, "_sp13")
dir.create("sp13")

for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp13/", new_names[i], ".RDS"))
  
}


######sp14
df_list <- split(sp14, sp14$farm)
new_names <- paste0("f", 1:20, "_sp14")
dir.create("sp14")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp14/", new_names[i], ".RDS"))
  
}


######sp15
df_list <- split(sp15, sp15$farm)
new_names <- paste0("f", 1:20, "_sp15")
dir.create("sp15")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp15/", new_names[i], ".RDS"))
  
}



######sp16
df_list <- split(sp16, sp16$farm)
new_names <- paste0("f", 1:20, "_sp16")
dir.create("sp16")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp16/", new_names[i], ".RDS"))
  
}


######sp17
df_list <- split(sp17, sp17$farm)
new_names <- paste0("f", 1:20, "_sp17")
dir.create("sp17")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp17/", new_names[i], ".RDS"))
  
}


######sp18
df_list <- split(sp18, sp18$farm)
new_names <- paste0("f", 1:20, "_sp18")
dir.create("sp18")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp18/", new_names[i], ".RDS"))
  
}


######sp19
df_list <- split(sp19, sp19$farm)
new_names <- paste0("f", 1:20, "_sp19")
dir.create("sp19")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp19/", new_names[i], ".RDS"))
  
}



######sp20
df_list <- split(sp20, sp20$farm)
new_names <- paste0("f", 1:20, "_sp20")
dir.create("sp20")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp20/", new_names[i], ".RDS"))
  
}


######sp21
df_list <- split(sp21, sp21$farm)
new_names <- paste0("f", 1:20, "_sp21")
dir.create("sp21")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp21/", new_names[i], ".RDS"))
  
}

######sp22
df_list <- split(sp22, sp22$farm)
new_names <- paste0("f", 1:20, "_sp22")
dir.create("sp22")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp22/", new_names[i], ".RDS"))
  
}


######sp23
df_list <- split(sp23, sp23$farm)
new_names <- paste0("f", 1:20, "_sp23")
dir.create("sp23")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp23/", new_names[i], ".RDS"))
  
}



######sp24
df_list <- split(sp24, sp24$farm)
new_names <- paste0("f", 1:20, "_sp24")
dir.create("sp24")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp24/", new_names[i], ".RDS"))
  
}



######sp25
df_list <- split(sp25, sp25$farm)
new_names <- paste0("f", 1:20, "_sp25")
dir.create("sp25")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp25/", new_names[i], ".RDS"))
  
}



######sp26
df_list <- split(sp26, sp26$farm)
new_names <- paste0("f", 1:20, "_sp26")
dir.create("sp26")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp26/", new_names[i], ".RDS"))
  
}



######sp27
df_list <- split(sp27, sp27$farm)
new_names <- paste0("f", 1:20, "_sp27")
dir.create("sp27")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp27/", new_names[i], ".RDS"))
  
}



######sp28
df_list <- split(sp28, sp28$farm)
new_names <- paste0("f", 1:20, "_sp28")
dir.create("sp28")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp28/", new_names[i], ".RDS"))
  
}



######sp29
df_list <- split(sp29, sp29$farm)
new_names <- paste0("f", 1:20, "_sp29")
dir.create("sp29")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp29/", new_names[i], ".RDS"))
  
}


######sp30
df_list <- split(sp30, sp30$farm)
new_names <- paste0("f", 1:20, "_sp30")
dir.create("sp30")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp30/", new_names[i], ".RDS"))
  
}



######sp31
df_list <- split(sp31, sp31$farm)
new_names <- paste0("f", 1:20, "_sp31")
dir.create("sp31")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp31/", new_names[i], ".RDS"))
  
}

######sp32
df_list <- split(sp32, sp32$farm)
new_names <- paste0("f", 1:20, "_sp32")
dir.create("sp32")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp32/", new_names[i], ".RDS"))
  
}


######sp33
df_list <- split(sp33, sp33$farm)
new_names <- paste0("f", 1:20, "_sp33")
dir.create("sp33")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp33/", new_names[i], ".RDS"))
  
}


######sp34
df_list <- split(sp34, sp34$farm)
new_names <- paste0("f", 1:20, "_sp34")
dir.create("sp34")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp34/", new_names[i], ".RDS"))
  
}

######sp35
df_list <- split(sp35, sp35$farm)
new_names <- paste0("f", 1:20, "_sp35")
dir.create("sp35")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp35/", new_names[i], ".RDS"))
  
}


######sp36
df_list <- split(sp36, sp36$farm)
new_names <- paste0("f", 1:20, "_sp36")
dir.create("sp36")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp36/", new_names[i], ".RDS"))
  
}


######sp37
df_list <- split(sp37, sp37$farm)
new_names <- paste0("f", 1:20, "_sp37")
dir.create("sp37")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp37/", new_names[i], ".RDS"))
  
}


######sp38
df_list <- split(sp38, sp38$farm)
new_names <- paste0("f", 1:20, "_sp38")
dir.create("sp38")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp38/", new_names[i], ".RDS"))
  
}


######sp39
df_list <- split(sp39, sp39$farm)
new_names <- paste0("f", 1:20, "_sp39")
dir.create("sp39")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp39/", new_names[i], ".RDS"))
  
}


######sp40
df_list <- split(sp40, sp40$farm)
new_names <- paste0("f", 1:20, "_sp40")
dir.create("sp40")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp40/", new_names[i], ".RDS"))
  
}


######sp41
df_list <- split(sp41, sp41$farm)
new_names <- paste0("f", 1:20, "_sp41")
dir.create("sp41")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp41/", new_names[i], ".RDS"))
  
}

######sp42
df_list <- split(sp42, sp42$farm)
new_names <- paste0("f", 1:20, "_sp42")
dir.create("sp42")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp42/", new_names[i], ".RDS"))
  
}

######sp43
df_list <- split(sp43, sp43$farm)
new_names <- paste0("f", 1:20, "_sp43")
dir.create("sp43")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp43/", new_names[i], ".RDS"))
  
}


######sp44
df_list <- split(sp44, sp44$farm)
new_names <- paste0("f", 1:20, "_sp44")
dir.create("sp44")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp44/", new_names[i], ".RDS"))
  
}
######sp45
df_list <- split(sp45, sp45$farm)
new_names <- paste0("f", 1:20, "_sp45")
dir.create("sp45")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp45/", new_names[i], ".RDS"))
  
}



######sp46
df_list <- split(sp46, sp46$farm)
new_names <- paste0("f", 1:20, "_sp46")
dir.create("sp46")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp46/", new_names[i], ".RDS"))
  
}


######sp47
df_list <- split(sp47, sp47$farm)
new_names <- paste0("f", 1:20, "_sp47")
dir.create("sp47")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp47/", new_names[i], ".RDS"))
  
}


######sp48
df_list <- split(sp48, sp48$farm)
new_names <- paste0("f", 1:20, "_sp48")
dir.create("sp48")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp48/", new_names[i], ".RDS"))
  
}


######sp49
df_list <- split(sp49, sp49$farm)
new_names <- paste0("f", 1:20, "_sp31")
dir.create("sp49")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp49/", new_names[i], ".RDS"))
  
}


######sp50
df_list <- split(sp50, sp50$farm)
new_names <- paste0("f", 1:20, "_sp50")
dir.create("sp50")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp50/", new_names[i], ".RDS"))
  
}



######sp51
df_list <- split(sp51, sp51$farm)
new_names <- paste0("f", 1:20, "_sp51")
dir.create("sp51")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp51/", new_names[i], ".RDS"))
  
}



######sp52
df_list <- split(sp52, sp52$farm)
new_names <- paste0("f", 1:20, "_sp52")
dir.create("sp52")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp52/", new_names[i], ".RDS"))
  
}


######sp53
df_list <- split(sp53, sp53$farm)
new_names <- paste0("f", 1:20, "_sp53")
dir.create("sp53")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp53/", new_names[i], ".RDS"))
  
}

######sp54
df_list <- split(sp54, sp54$farm)
new_names <- paste0("f", 1:20, "_sp54")
dir.create("sp54")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp54/", new_names[i], ".RDS"))
  
}



######sp55
df_list <- split(sp55, sp55$farm)
new_names <- paste0("f", 1:20, "_sp55")
dir.create("sp55")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp55/", new_names[i], ".RDS"))
  
}


######sp56
df_list <- split(sp56, sp56$farm)
new_names <- paste0("f", 1:20, "_sp56")
dir.create("sp56")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp56/", new_names[i], ".RDS"))
  
}


######sp57
df_list <- split(sp57, sp57$farm)
new_names <- paste0("f", 1:20, "_sp57")
dir.create("sp57")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp57/", new_names[i], ".RDS"))
  
}

######sp58
df_list <- split(sp58, sp58$farm)
new_names <- paste0("f", 1:20, "_sp58")
dir.create("sp58")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp58/", new_names[i], ".RDS"))
  
}



######sp59
df_list <- split(sp59, sp59$farm)
new_names <- paste0("f", 1:20, "_sp59")
dir.create("sp59")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp59/", new_names[i], ".RDS"))
  
}


######sp60
df_list <- split(sp60, sp60$farm)
new_names <- paste0("f", 1:20, "_sp60")
dir.create("sp60")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp60/", new_names[i], ".RDS"))
  
}

######sp61
df_list <- split(sp61, sp61$farm)
new_names <- paste0("f", 1:20, "_sp61")
dir.create("sp61")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp61/", new_names[i], ".RDS"))
  
}

######sp62
df_list <- split(sp62, sp62$farm)
new_names <- paste0("f", 1:20, "_sp62")
dir.create("sp62")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp62/", new_names[i], ".RDS"))
  
}
######sp63
df_list <- split(sp63, sp63$farm)
new_names <- paste0("f", 1:20, "_sp63")
dir.create("sp63")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp63/", new_names[i], ".RDS"))
  
}

######sp64
df_list <- split(sp64, sp64$farm)
new_names <- paste0("f", 1:20, "_sp64")
dir.create("sp64")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp64/", new_names[i], ".RDS"))
  
}

######sp65
df_list <- split(sp65, sp65$farm)
new_names <- paste0("f", 1:20, "_sp65")
dir.create("sp65")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp65/", new_names[i], ".RDS"))
  
}

######sp66
df_list <- split(sp66, sp66$farm)
new_names <- paste0("f", 1:20, "_sp66")
dir.create("sp66")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp66/", new_names[i], ".RDS"))
  
}

######sp67
df_list <- split(sp67, sp67$farm)
new_names <- paste0("f", 1:20, "_sp67")
dir.create("sp67")

for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp67/", new_names[i], ".RDS"))
  
}


######sp68
df_list <- split(sp68, sp68$farm)
new_names <- paste0("f", 1:20, "_sp68")
dir.create("sp68")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp68/", new_names[i], ".RDS"))
  
}

######sp69
df_list <- split(sp69, sp69$farm)
new_names <- paste0("f", 1:20, "_sp69")
dir.create("sp69")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp69/", new_names[i], ".RDS"))
  
}


######sp70
df_list <- split(sp70, sp70$farm)
new_names <- paste0("f", 1:20, "_sp70")
dir.create("sp70")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp70/", new_names[i], ".RDS"))
  
}

######sp71
df_list <- split(sp71, sp71$farm)
new_names <- paste0("f", 1:20, "_sp71")
dir.create("sp71")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp71/", new_names[i], ".RDS"))
  
}

######sp72
df_list <- split(sp72, sp72$farm)
new_names <- paste0("f", 1:20, "_sp72")
dir.create("sp72")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp72/", new_names[i], ".RDS"))
  
}


######sp73
df_list <- split(sp73, sp73$farm)
new_names <- paste0("f", 1:20, "_sp73")
dir.create("sp73")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp73/", new_names[i], ".RDS"))
  
}


######sp74
df_list <- split(sp74, sp74$farm)
new_names <- paste0("f", 1:20, "_sp74")
dir.create("sp74")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp74/", new_names[i], ".RDS"))
  
}


######sp75
df_list <- split(sp75, sp75$farm)
new_names <- paste0("f", 1:20, "_sp75")
dir.create("sp75")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp75/", new_names[i], ".RDS"))
  
}


######sp76
df_list <- split(sp76, sp76$farm)
new_names <- paste0("f", 1:20, "_sp76")
dir.create("sp76")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp76/", new_names[i], ".RDS"))
  
}


######sp77
df_list <- split(sp77, sp77$farm)
new_names <- paste0("f", 1:20, "_sp77")
dir.create("sp77")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp77/", new_names[i], ".RDS"))
  
}


######sp78
df_list <- split(sp78, sp78$farm)
new_names <- paste0("f", 1:20, "_sp78")
dir.create("sp78")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp78/", new_names[i], ".RDS"))
  
}


######sp79
df_list <- split(sp79, sp79$farm)
new_names <- paste0("f", 1:20, "_sp79")
dir.create("sp79")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp79/", new_names[i], ".RDS"))
  
}

######sp80
df_list <- split(sp80, sp80$farm)
new_names <- paste0("f", 1:20, "_sp80")
dir.create("sp80")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp80/", new_names[i], ".RDS"))
  
}

######sp81
df_list <- split(sp81, sp81$farm)
new_names <- paste0("f", 1:20, "_sp81")
dir.create("sp81")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp81/", new_names[i], ".RDS"))
  
}


######sp82
df_list <- split(sp82, sp82$farm)
new_names <- paste0("f", 1:20, "_sp82")
dir.create("sp82")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp82/", new_names[i], ".RDS"))
  
}


######sp83
df_list <- split(sp83, sp83$farm)
new_names <- paste0("f", 1:20, "_sp83")
dir.create("sp83")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp83/", new_names[i], ".RDS"))
  
}


######sp84
df_list <- split(sp84, sp84$farm)
new_names <- paste0("f", 1:20, "_sp84")
dir.create("sp84")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp84/", new_names[i], ".RDS"))
  
}

######sp85
df_list <- split(sp85, sp85$farm)
new_names <- paste0("f", 1:20, "_sp85")
dir.create("sp85")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp85/", new_names[i], ".RDS"))
  
}
######sp86
df_list <- split(sp86, sp86$farm)
new_names <- paste0("f", 1:20, "_sp86")
dir.create("sp86")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp86/", new_names[i], ".RDS"))
  
}


######sp87
df_list <- split(sp87, sp87$farm)
new_names <- paste0("f", 1:20, "_sp87")
dir.create("sp87")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp87/", new_names[i], ".RDS"))
  
}


######sp88
df_list <- split(sp88, sp88$farm)
new_names <- paste0("f", 1:20, "_sp88")
dir.create("sp88")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp88/", new_names[i], ".RDS"))
  
}


######sp89
df_list <- split(sp89, sp89$farm)
new_names <- paste0("f", 1:20, "_sp89")
dir.create("sp89")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp89/", new_names[i], ".RDS"))
  
}


######sp90
df_list <- split(sp90, sp90$farm)
new_names <- paste0("f", 1:20, "_sp90")
dir.create("sp90")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp90/", new_names[i], ".RDS"))
  
}


######sp91
df_list <- split(sp91, sp91$farm)
new_names <- paste0("f", 1:20, "_sp91")
dir.create("sp91")
for (i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp91/", new_names[i], ".RDS"))
  
}

######sp92
df_list <- split(sp92, sp92$farm)
new_names <- paste0("f", 1:20, "_sp92")
dir.create("sp92")
for (i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp92/", new_names[i], ".RDS"))
  
}

######sp93
df_list <- split(sp93, sp93$farm)
new_names <- paste0("f", 1:20, "_sp93")
dir.create("sp93")
for (i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp93/", new_names[i], ".RDS"))
  
}


######sp94
df_list <- split(sp94, sp94$farm)
new_names <- paste0("f", 1:20, "_sp94")
dir.create("sp94")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp94/", new_names[i], ".RDS"))
  
}


######sp95
df_list <- split(sp95, sp95$farm)
new_names <- paste0("f", 1:20, "_sp95")
dir.create("sp95")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp95/", new_names[i], ".RDS"))
  
}


######sp96
df_list <- split(sp96, sp96$farm)
new_names <- paste0("f", 1:20, "_sp96")
dir.create("sp96")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp96/", new_names[i], ".RDS"))
  
}


######sp97
df_list <- split(sp97, sp97$farm)
new_names <- paste0("f", 1:20, "_sp97")
dir.create("sp97")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp97/", new_names[i], ".RDS"))
  
}


######sp98
df_list <- split(sp98, sp98$farm)
new_names <- paste0("f", 1:20, "_sp98")
dir.create("sp98")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp98/", new_names[i], ".RDS"))
  
}

######sp99
df_list <- split(sp99, sp99$farm)
new_names <- paste0("f", 1:20, "_sp99")
dir.create("sp99")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp99/", new_names[i], ".RDS"))
  
}

######sp100
df_list <- split(sp100, sp100$farm)
new_names <- paste0("f", 1:20, "_sp100")
dir.create("sp100")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp100/", new_names[i], ".RDS"))
  
}

######sp101
df_list <- split(sp101, sp101$farm)
new_names <- paste0("f", 1:20, "_sp101")
dir.create("sp101")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp101/", new_names[i], ".RDS"))
  
}


######sp102
df_list <- split(sp102, sp102$farm)
new_names <- paste0("f", 1:20, "_sp102")
dir.create("sp102")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp102/", new_names[i], ".RDS"))
  
}

######sp103
df_list <- split(sp103, sp103$farm)
new_names <- paste0("f", 1:20, "_sp103")
dir.create("sp103")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp103/", new_names[i], ".RDS"))
}


######sp104
df_list <- split(sp104, sp104$farm)
new_names <- paste0("f", 1:20, "_sp104")
dir.create("sp104")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp104/", new_names[i], ".RDS"))
  
}

######sp105
df_list <- split(sp105, sp105$farm)
new_names <- paste0("f", 1:20, "_sp105")
dir.create("sp105")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp105/", new_names[i], ".RDS"))
  
}

######sp106
df_list <- split(sp106, sp106$farm)
new_names <- paste0("f", 1:20, "_sp106")
dir.create("sp106")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp106/", new_names[i], ".RDS"))
  
}

######sp107
df_list <- split(sp107, sp107$farm)
new_names <- paste0("f", 1:20, "_sp107")
dir.create("sp107")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp107/", new_names[i], ".RDS"))
  
}

######sp108
df_list <- split(sp108, sp108$farm)
new_names <- paste0("f", 1:20, "_sp108")
dir.create("sp108")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp108/", new_names[i], ".RDS"))
  
}

######sp109
df_list <- split(sp109, sp109$farm)
new_names <- paste0("f", 1:20, "_sp109")
dir.create("sp109")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp109/", new_names[i], ".RDS"))
  
}


######sp110
df_list <- split(sp110, sp110$farm)
new_names <- paste0("f", 1:20, "_sp110")
dir.create("sp110")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp110/", new_names[i], ".RDS"))
  
}

######sp111
df_list <- split(sp111, sp111$farm)
new_names <- paste0("f", 1:20, "_sp111")
dir.create("sp111")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp111/", new_names[i], ".RDS"))
  
}


######sp112
df_list <- split(sp112, sp112$farm)
new_names <- paste0("f", 1:20, "_sp112")
dir.create("sp112")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp112/", new_names[i], ".RDS"))
  
}

######sp113
df_list <- split(sp113, sp113$farm)
new_names <- paste0("f", 1:20, "_sp113")
dir.create("sp113")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp113/", new_names[i], ".RDS"))
  
}

######sp114
df_list <- split(sp114, sp114$farm)
new_names <- paste0("f", 1:20, "_sp114")
dir.create("sp114")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp114/", new_names[i], ".RDS"))
  
}

######sp115
df_list <- split(sp115, sp115$farm)
new_names <- paste0("f", 1:20, "_sp115")
dir.create("sp115")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp115/", new_names[i], ".RDS"))
  
}


######sp116
df_list <- split(sp116, sp116$farm)
new_names <- paste0("f", 1:20, "_sp116")
dir.create("sp116")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp116/", new_names[i], ".RDS"))
  
}
######sp117
df_list <- split(sp117, sp117$farm)
new_names <- paste0("f", 1:20, "_sp117")
dir.create("sp117")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp117/", new_names[i], ".RDS"))
  
}

######sp118
df_list <- split(sp118, sp118$farm)
new_names <- paste0("f", 1:20, "_sp118")
dir.create("sp118")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp118/", new_names[i], ".RDS"))
  
}

######sp119
df_list <- split(sp119, sp119$farm)
new_names <- paste0("f", 1:20, "_sp119")
dir.create("sp119")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp119/", new_names[i], ".RDS"))
  
}

######sp120
df_list <- split(sp120, sp120$farm)
new_names <- paste0("f", 1:20, "_sp120")
dir.create("sp120")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp120/", new_names[i], ".RDS"))
  
}


######sp121
df_list <- split(sp121, sp121$farm)
new_names <- paste0("f", 1:20, "_sp121")
dir.create("sp121")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp121/", new_names[i], ".RDS"))
  
}


######sp122
df_list <- split(sp122, sp122$farm)
new_names <- paste0("f", 1:20, "_sp122")
dir.create("sp122")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp122/", new_names[i], ".RDS"))
  
}

######sp123
df_list <- split(sp123, sp123$farm)
new_names <- paste0("f", 1:20, "_sp123")
dir.create("sp123")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp123/", new_names[i], ".RDS"))
  
}

######sp124
df_list <- split(sp124, sp124$farm)
new_names <- paste0("f", 1:20, "_sp124")
dir.create("sp124")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp124/", new_names[i], ".RDS"))
  
}

######sp125
df_list <- split(sp125, sp125$farm)
new_names <- paste0("f", 1:20, "_sp125")
dir.create("sp125")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp125/", new_names[i], ".RDS"))
  
}

######sp126
df_list <- split(sp126, sp126$farm)
new_names <- paste0("f", 1:20, "_sp126")
dir.create("sp126")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp126/", new_names[i], ".RDS"))
  
}

######sp127
df_list <- split(sp127, sp127$farm)
new_names <- paste0("f", 1:20, "_sp127")
dir.create("sp127")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp127/", new_names[i], ".RDS"))
  
}

######sp128
df_list <- split(sp128, sp128$farm)
new_names <- paste0("f", 1:20, "_sp128")
dir.create("sp128")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp128/", new_names[i], ".RDS"))
  
}

######sp129
df_list <- split(sp129, sp129$farm)
new_names <- paste0("f", 1:20, "_sp129")
dir.create("sp129")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp129/", new_names[i], ".RDS"))
  
}

######sp130
df_list <- split(sp130, sp130$farm)
new_names <- paste0("f", 1:20, "_sp130")
dir.create("sp130")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp130/", new_names[i], ".RDS"))
  
}

######sp131
df_list <- split(sp131, sp131$farm)
new_names <- paste0("f", 1:20, "_sp131")
dir.create("sp131")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp131/", new_names[i], ".RDS"))
  
}

######sp132
df_list <- split(sp132, sp132$farm)
new_names <- paste0("f", 1:20, "_sp132")
dir.create("sp132")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp132/", new_names[i], ".RDS"))
  
}


######sp133
df_list <- split(sp133, sp133$farm)
new_names <- paste0("f", 1:20, "_sp133")
dir.create("sp133")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp133/", new_names[i], ".RDS"))
  
}


######sp134
df_list <- split(sp134, sp134$farm)
new_names <- paste0("f", 1:20, "_sp134")
dir.create("sp134")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp134/", new_names[i], ".RDS"))
  
}

######sp135
df_list <- split(sp135, sp135$farm)
new_names <- paste0("f", 1:20, "_sp135")
dir.create("sp135")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp135/", new_names[i], ".RDS"))
  
}

######sp136
df_list <- split(sp136, sp136$farm)
new_names <- paste0("f", 1:20, "_sp136")
dir.create("sp136")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp136/", new_names[i], ".RDS"))
  
}


######sp137
df_list <- split(sp137, sp137$farm)
new_names <- paste0("f", 1:20, "_sp137")
dir.create("sp137")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp137/", new_names[i], ".RDS"))
  
}

######sp138
df_list <- split(sp138, sp138$farm)
new_names <- paste0("f", 1:20, "_sp138")
dir.create("sp138")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp138/", new_names[i], ".RDS"))
  
}
######sp139
df_list <- split(sp139, sp139$farm)
new_names <- paste0("f", 1:20, "_sp139")
dir.create("sp139")
for(i in 1:length(df_list)) {
  assign(new_names[i], df_list[[i]])
  saveRDS(object = df_list[[i]],
          file  =  paste0("/Volumes/1TB Bob/sp by farm/super pulse RDS files/sp139/", new_names[i], ".RDS"))
  
}
##########################################################################################




















###########################before it was a loop ########################################################
#farm1
f1_sp1 <- subset(sp1, farm == 1)
saveRDS(f1_sp1, file = "/Volumes/1TB Bob/sp by farm/sp1/f1_sp1.RDS")

#farm2
f2_sp1 <- subset(sp1, farm == 2)
saveRDS(f2_sp1, file = "/Volumes/1TB Bob/sp by farm/sp1/f2_sp1.RDS")

#farm3
f3_sp1 <- subset(sp1, farm == 3)
saveRDS(f3_sp1, file = "/Volumes/1TB Bob/sp by farm/sp1/f3_sp1.RDS")

#farm4
f4_sp1 <- subset(sp1, farm == 4)
saveRDS(f4_sp1, file = "/Volumes/1TB Bob/sp by farm/sp1/f4_sp1.RDS")

#farm5
f5_sp1 <- subset(sp1, farm == 5)
saveRDS(f5_sp1, file = "/Volumes/1TB Bob/sp by farm/sp1/f5_sp1.RDS")


#farm6
f6_sp1 <- subset(sp1, farm == 6)
saveRDS(f6_sp1, file = "/Volumes/1TB Bob/sp by farm/sp1/f6_sp1.RDS")

#farm7
f7_sp1 <- subset(sp1, farm == 7)
saveRDS(f7_sp1, file = "/Volumes/1TB Bob/sp by farm/sp1/f7_sp1.RDS")

#farm8
f8_sp1 <- subset(sp1, farm == 8)
saveRDS(f8_sp1, file = "/Volumes/1TB Bob/sp by farm/sp1/f8_sp1.RDS")

#farm9
f9_sp1 <- subset(sp1, farm == 9)
saveRDS(f9_sp1, file = "/Volumes/1TB Bob/sp by farm/sp1/f9_sp1.RDS")

#farm10
f10_sp1 <- subset(sp1, farm == 10)
saveRDS(f10_sp1, file = "/Volumes/1TB Bob/sp by farm/sp1/f10_sp1.RDS")

#farm11
f11_sp1 <- subset(sp1, farm == 11)
saveRDS(f11_sp1, file = "/Volumes/1TB Bob/sp by farm/sp1/f11_sp1.RDS")

#farm12
f12_sp1 <- subset(sp1, farm == 12)
saveRDS(f12_sp1, file = "/Volumes/1TB Bob/sp by farm/sp1/f12_sp1.RDS")

#farm13
f13_sp1 <- subset(sp1, farm == 13)
saveRDS(f13_sp1, file = "/Volumes/1TB Bob/sp by farm/sp1/f13_sp1.RDS")

#farm14
f14_sp1 <- subset(sp1, farm == 14)
saveRDS(f14_sp1, file = "/Volumes/1TB Bob/sp by farm/sp1/f14_sp1.RDS")

#farm15
f15_sp1 <- subset(sp1, farm == 15)
saveRDS(f15_sp1, file = "/Volumes/1TB Bob/sp by farm/sp1/f15_sp1.RDS")

#farm16
f16_sp1 <- subset(sp1, farm == 16)
saveRDS(f16_sp1, file = "/Volumes/1TB Bob/sp by farm/sp1/f16_sp1.RDS")

#farm17
f17_sp1 <- subset(sp1, farm == 17)
saveRDS(f17_sp1, file = "/Volumes/1TB Bob/sp by farm/sp1/f17_sp1.RDS")

#farm18
f18_sp1 <- subset(sp1, farm == 18)
saveRDS(f18_sp1, file = "/Volumes/1TB Bob/sp by farm/sp1/f18_sp1.RDS")

#farm19
f19_sp1 <- subset(sp1, farm == 19)
saveRDS(f19_sp1, file = "/Volumes/1TB Bob/sp by farm/sp1/f19_sp1.RDS")

#farm20
f20_sp1 <- subset(sp1, farm == 20)
saveRDS(f20_sp1, file = "/Volumes/1TB Bob/sp by farm/sp1/f20_sp1.RDS")

##how do I write this as a loop?










sp1 <- read_rds("sp1.RDS")
sp2 <- read_rds("sp2.RDS")
sp3 <- read_rds("sp3.RDS")
sp4 <- read_rds("sp4.RDS")
#sp5 <- read_rds("sp5.RDS")
#sp6 <- read_rds("sp6.RDS")
#sp7 <- read_rds("sp7.RDS")
sp8 <- read_rds("sp8.RDS")
#sp9 <- read_rds("sp9.RDS")
#sp10 <- read_rds("sp10.RDS")
#sp11 <- read_rds("sp11.RDS")
#sp12 <- read_rds("sp12.RDS")
#sp13 <- read_rds("sp13.RDS")
#sp14 <- read_rds("sp14.RDS")
#sp15 <- read_rds("sp15.RDS")
#sp16 <- read_rds("sp16.RDS")
#sp17 <- read_rds("sp17.RDS")
#sp18 <- read_rds("sp18.RDS")
#sp19 <- read_rds("sp19.RDS")
#sp20 <- read_rds("sp20.RDS")
#sp21 <- read_rds("sp21.RDS")
#sp22 <- read_rds("sp22.RDS")
#sp23 <- read_rds("sp23.RDS")
#sp24 <- read_rds("sp24.RDS")
#sp25 <- read_rds("sp25.RDS")
#sp26 <- read_rds("sp26.RDS")
#sp27 <- read_rds("sp27.RDS")
#sp28 <- read_rds("sp28.RDS")
#sp29 <- read_rds("sp29.RDS")
#sp30 <- read_rds("sp30.RDS")
sp31 <- read_rds("sp31.RDS")
sp32 <- read_rds("sp32.RDS")
sp33 <- read_rds("sp33.RDS")
sp34 <- read_rds("sp34.RDS")
sp35 <- read_rds("sp35.RDS")
sp36 <- read_rds("sp36.RDS")
sp37 <- read_rds("sp37.RDS")
sp38 <- read_rds("sp38.RDS")
sp39 <- read_rds("sp39.RDS")
sp40 <- read_rds("sp40.RDS")
sp41 <- read_rds("sp41.RDS")
sp42 <- read_rds("sp42.RDS")
sp43 <- read_rds("sp43.RDS")
sp44 <- read_rds("sp44.RDS")
sp45 <- read_rds("sp45.RDS")
sp46 <- read_rds("sp46.RDS")
sp47 <- read_rds("sp47.RDS")
sp48 <- read_rds("sp48.RDS")
sp49 <- read_rds("sp49.RDS")
sp50 <- read_rds("sp50.RDS")

sp51 <- read_rds("sp51.RDS")
sp52 <- read_rds("sp52.RDS")
sp53 <- read_rds("sp53.RDS")
sp54 <- read_rds("sp54.RDS")
sp55 <- read_rds("sp55.RDS")
sp56 <- read_rds("sp56.RDS")
sp57 <- read_rds("sp57.RDS")
sp58 <- read_rds("sp58.RDS")
sp59 <- read_rds("sp59.RDS")
sp60 <- read_rds("sp60.RDS")
sp61 <- read_rds("sp61.RDS")
sp62 <- read_rds("sp62.RDS")
sp63 <- read_rds("sp63.RDS")
sp64 <- read_rds("sp64.RDS")
sp65 <- read_rds("sp65.RDS")
sp66 <- read_rds("sp66.RDS")
sp67 <- read_rds("sp67.RDS")
sp68 <- read_rds("sp68.RDS")
sp69 <- read_rds("sp69.RDS")
sp70 <- read_rds("sp70.RDS")
sp71 <- read_rds("sp71.RDS")
sp72 <- read_rds("sp72.RDS")
sp73 <- read_rds("sp73.RDS")
sp74 <- read_rds("sp74.RDS")
sp75 <- read_rds("sp75.RDS")
sp76 <- read_rds("sp76.RDS")
sp77 <- read_rds("sp77.RDS")
sp78 <- read_rds("sp78.RDS")
sp79 <- read_rds("sp79.RDS")
sp80 <- read_rds("sp80.RDS")
sp81 <- read_rds("sp81.RDS")
sp82 <- read_rds("sp82.RDS")
sp83 <- read_rds("sp83.RDS")
sp84 <- read_rds("sp84.RDS")
sp85 <- read_rds("sp85.RDS")
sp86 <- read_rds("sp86.RDS")
sp87 <- read_rds("sp87.RDS")
sp88 <- read_rds("sp88.RDS")
sp89 <- read_rds("sp89.RDS")
sp90 <- read_rds("sp90.RDS")
sp91 <- read_rds("sp91.RDS")
sp92 <- read_rds("sp92.RDS")
sp93 <- read_rds("sp93.RDS")
sp94 <- read_rds("sp94.RDS")
sp95 <- read_rds("sp95.RDS")
sp96 <- read_rds("sp96.RDS")
sp97 <- read_rds("sp97.RDS")
sp98 <- read_rds("sp98.RDS")
sp99 <- read_rds("sp99.RDS")
sp100 <- read_rds("sp100.RDS")
sp101 <- read_rds("sp101.RDS")
sp102 <- read_rds("sp102.RDS")
sp103 <- read_rds("sp103.RDS")
sp104 <- read_rds("sp104.RDS")
sp105 <- read_rds("sp105.RDS")
sp106 <- read_rds("sp106.RDS")
sp107 <- read_rds("sp107.RDS")
sp108 <- read_rds("sp108.RDS")
sp109 <- read_rds("sp109.RDS")
sp110 <- read_rds("sp110.RDS")
sp111 <- read_rds("sp111.RDS")
sp112 <- read_rds("sp112.RDS")
sp113 <- read_rds("sp113.RDS")
sp114 <- read_rds("sp114.RDS")
sp115 <- read_rds("sp115.RDS")
sp116 <- read_rds("sp116.RDS")
sp117 <- read_rds("sp117.RDS")
sp118 <- read_rds("sp118.RDS")
sp119 <- read_rds("sp119.RDS")
sp120 <- read_rds("sp120.RDS")
sp121 <- read_rds("sp121.RDS")
sp122 <- read_rds("sp122.RDS")
sp123 <- read_rds("sp123.RDS")
sp124 <- read_rds("sp124.RDS")
sp125 <- read_rds("sp125.RDS")
sp126 <- read_rds("sp126.RDS")
sp127 <- read_rds("sp127.RDS")
sp128 <- read_rds("sp128.RDS")
sp129 <- read_rds("sp129.RDS")
sp130 <- read_rds("sp130.RDS")
sp131 <- read_rds("sp131.RDS")
sp132 <- read_rds("sp132.RDS")
sp133 <- read_rds("sp133.RDS")
sp134 <- read_rds("sp134.RDS")
sp135 <- read_rds("sp135.RDS")
sp136 <- read_rds("sp136.RDS")
sp137 <- read_rds("sp137.RDS")
sp138 <- read_rds("sp138.RDS")
sp139 <- read_rds("sp139.RDS")

