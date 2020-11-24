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

kohmap <- xyf(scale(auto.mpg[,c(1:7)]), rusis, grid = somgrid(5, 5, "hexagonal"), rlen=100)

#rodo objektu, suskirstytu i atskirus vienetus, skaiciu.
# Tusti vienetai vaizduojami pilka spalva:

counts <- plot(kohmap, type="counts", shape = "straight")