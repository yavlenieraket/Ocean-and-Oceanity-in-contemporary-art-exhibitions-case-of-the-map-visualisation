
library(leaflet)
library(dplyr)
library(readr)

bi_istanbul <- read_delim("bi_istanbul.csv",
                          delim = ";", escape_double = FALSE, trim_ws = TRUE)

lon <- bi_istanbul$Lon
lat <- bi_istanbul$Lat

# Create a leaflet map
map <- leaflet() %>% addTiles()

# Add Markers with titles to the map
for (i in 1:nrow(bi_istanbul)) {
  map <- addMarkers(map, 
                    lng = lon[i],
                    lat = lat[i],
                    icon = iconcurrentplaceIs,
                    popup = paste("Artist: ", bi_istanbul[i, "artist"]))
}

# Display the map
map
