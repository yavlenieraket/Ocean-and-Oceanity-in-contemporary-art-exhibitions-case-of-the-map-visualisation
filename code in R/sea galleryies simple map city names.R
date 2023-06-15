
library(leaflet)
library(dplyr)

library(readr)
galler <- read_delim("galler.csv", delim = ";", 
                     escape_double = FALSE, trim_ws = TRUE)
View(galler)
View(galler)

# Convert lat and lon to numeric
lat <- as.numeric(galler$Lat)
lon <- as.numeric(galler$Lon)

# Create a leaflet map
map <- leaflet() %>% addTiles()

# Add markers with titles to the map
for (i in 1:nrow(galler)) {
  map <- addMarkers(map,
                    lng = lon[i],
                    lat = lat[i],
                    icon = iconSea,
                    popup = paste0(galler[i, "city"]))
}

# Display the map
map
