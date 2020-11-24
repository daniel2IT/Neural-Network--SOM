auto.mpg[auto.mpg == '?'] <- NA
summary(auto.mpg) 
auto.mpg$V4 <- as.numeric(auto.mpg$V4)

vid <- mean(auto.mpg$V4, na.rm = TRUE)

auto.mpg$V4 <- replace(auto.mpg$V4, is.na(auto.mpg$V4), vid)

auto.mpg[,c("V9")] <- list(NULL)

for (i in colnames(auto.mpg)){ 
  auto.mpg[[i]] <- (auto.mpg[[i]] - min(auto.mpg[[i]]))/(max(auto.mpg[[i]]) - min(auto.mpg[[i]]))
}

library(plotly)
library("kohonen")

rusis <- auto.mpg.original[,c(8)]

#Taikoma SOM funkcija:
sommap <- som(scale(auto.mpg[,c(1:4)]), grid = somgrid(5, 5, "hexagonal"))

#U-matricos atvaizdavimas suklasterizavus vektorius:

som.hc <- cutree(hclust(object.distances(sommap, "codes")), 3)
add.cluster.boundaries(sommap, som.hc)