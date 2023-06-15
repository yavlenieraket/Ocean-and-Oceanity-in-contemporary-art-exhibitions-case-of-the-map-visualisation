
library(leaflet)
library(dplyr)

library(readr)
oceansea <- read_delim("oceansea.csv", delim = ";", 
                       escape_double = FALSE, trim_ws = TRUE)
View(oceansea)

# Get the longitude and latitude data from the CSV file
lon <- as.numeric(oceansea$Lon)
lat <- as.numeric(oceansea$Lat) # Convert to numeric format

# Create a leaflet map
map <- leaflet() %>% addTiles()

# Add Markers with titles to the map
for (i in 1:nrow(oceansea)) {
  map <- addMarkers(map, 
                    lng = lon[i],
                    lat = lat[i],
                    icon= iconOceanSea,
                    popup = oceansea[i, "city"])
}


map

