library(igraph)
library(plyr)
library(readr)
library(RColorBrewer)
library(tidyverse)
library(tidyr)
library(ggplot2)

#read in the connectivity matrix
setwd("/Volumes/1TB Bob/send to crawford/")
df <- read.csv(file = "sp1_proportion.csv", row.names = 1)
df <- plyr::rename(df, c("X1" = 1, "X2" = 2, "X3" = 3, "X4" = 4, "X5" = 5, "X6" = 6, "X7" = 7, "X8" = 8, "X9" = 9, "X10" = 10, "X11" = 11, "X12" = 12, "X13" = 13, "X14" = 14, "X15" = 15, "X16" = 16, "X17" = 17, "X18" = 18, "X19" = 19, "X20" = 20))

#change it into long form 
dat2 <- df %>%
  tbl_df() %>%
  rownames_to_column('to') %>%
  gather(from, value, -to) %>%
  mutate(
    to = as.character(to, levels=1:20),
    from = as.character(gsub("v", "", from), levels = 1:20)
  )

#drop values smaller than the mean connection
str(dat2)
dat2 <- dat2[which(dat2$value > 0.0009),]

#make the network
g <- make_empty_graph() +
  vertices(dat2$to)

plot(g1,
     vertex.shape = "circle",
     vertex.frame.color = "SkyBlue2",
     vertex.size = g1[3],
     vertex.label.cex = 0.8,
     edge.curved = F,
     edge.arrow.size = 0.3)




#This will cluster on your network!
cluster_edge_betweenness

g2 <- graph_from_literal(A-+ B)
plot(g2)












mat_df <- as.matrix(df)


g1 <- graph.adjacency(mat_df, weighted = T, mode = 'directed')
g2 <- simplify(g1)
plot(g2)

#try with the ggnet package instead
library(network)
library(sna)
library(ggplot2)
library(intergraph)
setwd("/Volumes/1TB Bob/send to crawford/")
df <- read.csv(file = "sp1_proportion.csv", row.names = 1)
df <- plyr::rename(df, c("X1" = 1, "X2" = 2, "X3" = 3, "X4" = 4, "X5" = 5, "X6" = 6, "X7" = 7, "X8" = 8, "X9" = 9, "X10" = 10, "X11" = 11, "X12" = 12, "X13" = 13, "X14" = 14, "X15" = 15, "X16" = 16, "X17" = 17, "X18" = 18, "X19" = 19, "X20" = 20))
df2 <- "as.network"(df, matrix.type = NULL, directed = TRUE, ignore.eval = F)

nw <- network(df2)
ggnet2(nw)