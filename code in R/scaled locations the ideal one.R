
library(leaflet)
library(dplyr)
library(readr)

oceansea_s <- read_delim("oceansea_s.csv", 
                         delim = ";", escape_double = FALSE, col_types = cols(Long = col_number(), 
                                                                              Lat = col_number(), Pop = col_number()), 
                         trim_ws = TRUE)

leaflet(oceansea_s) %>% 
  addTiles() %>% 
  addCircles(lng = ~Long, 
             lat = ~Lat, 
             weight = 1, # Change weight to 1 for uniform circle border width
             radius = ~sqrt(Pop) * 50000, # Scale radius using square root of population for larger circles
             popup = ~city)
map