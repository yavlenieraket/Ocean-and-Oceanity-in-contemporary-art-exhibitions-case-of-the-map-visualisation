
library(leaflet)
library(dplyr)

library(readr)
ostend_sea_scaled <- read_delim("ostend_sea_scaled.csv", 
                                delim = ";", escape_double = FALSE, trim_ws = TRUE)
View(ostend_sea_scaled)

leaflet(ostend_sea_scaled) %>% 
  addTiles() %>% 
  addCircles(lng = ~Long, 
             lat = ~Lat, 
             weight = 1, # Change weight to 1 for uniform circle border width
             radius = ~sqrt(Pop) * 50000, # Scale radius using square root of population for larger circles
             popup = ~city)
map