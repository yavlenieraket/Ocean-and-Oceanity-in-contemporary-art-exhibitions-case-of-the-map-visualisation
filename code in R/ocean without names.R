library(leaflet)
library(dplyr)

# Read the data from CSV file
galleries <- read.csv("galleries_3.csv")

# Get the longitude and latitude data from the CSV file
lon <- galleries$Lon
lat <- galleries$Lat

# Create a leaflet map
map <- leaflet() %>% addTiles()

# Add Markers to the map
for (i in 1:nrow(galleries)) {
  map <- addMarkers(map, 
                    lng = lon[i],
                    lat = lat[i], icon= iconOcean)
}

#Display the map
map
