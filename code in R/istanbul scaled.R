
library(leaflet)
library(dplyr)

library(readr)
bi_istanbul_scaled <- read_delim("bi_istanbul_scaled.csv", 
                                 delim = ";", escape_double = FALSE, trim_ws = TRUE)
View(bi_istanbul_scaled)

leaflet(bi_istanbul_scaled) %>% 
  addTiles() %>% 
  addCircles(lng = ~Long, 
             lat = ~Lat, 
             weight = 1, # Change weight to 1 for uniform circle border width
             radius = ~sqrt(Pop) * 120000, # Scale radius using square root of population for larger circles
             popup = ~city)
map