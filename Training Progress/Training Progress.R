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

#Sukuriamas vektorius, nurodantis irisu tipus (pagal tipa bus atvaizduojama grafike):

rusis <- auto.mpg.original[,c(5)]
#Pritaikomas metodas:

kohmap <- xyf(scale(auto.mpg[,c(1:4)]), rusis, grid = somgrid(5, 5, "hexagonal"), rlen=100)
#Grafikas parodo atstumu pokycius vykstant SOM tinklo mokymo iteracijoms:

plot(kohmap, type="changes")