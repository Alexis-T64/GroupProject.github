library(tidyverse)

library(dplyr)      # data manipulation
library(cluster)    # clustering algorithms
library(factoextra) # clustering algorithms and funny visualization
library(dendextend) # for comparing two dendrograms
library(psych)

data <- read.delim("Cusine-pref-raw.txt")
data_num <-data[2:25]
apply(data_num,1,var)
scaled_data_num <- scale(data_num)
apply(scaled_data_num,1,var)
head(scaled_data_num)

d <- dist(scaled_data_num, method = "euclidean")
fviz_dist(d, gradient = list(low = "#00AFBB", mid = "white", high = "#FC4E07"))
hc <- hclust(d, method = "complete" )
plot(hc, cex = 0.6, hang = -1)
plot(as.dendrogram(hc), main = "my results")

fviz_nbclust(scaled_data_num, FUN = hcut, method = "wss")
fviz_nbclust(scaled_data_num, kmeans, method = "silhouette")

