library(leaflet)
library(dplyr)

# Read the data from CSV files
galleries <- read.csv("galleries_3.csv")
galler <- read_delim("galler.csv", delim = ";", escape_double = FALSE, trim_ws = TRUE)

# Convert lat and lon to numeric
galleries <- galleries %>% 
  mutate(Lat = as.numeric(Lat), Lon = as.numeric(Lon))
galler <- galler %>% 
  mutate(Lat = as.numeric(Lat), Lon = as.numeric(Lon))

# Create a leaflet map
map <- leaflet() %>% addTiles()

# Add markers with titles to the map for the galleries data
for (i in 1:nrow(galleries)) {
  map <- addMarkers(map, 
                    lng = galleries$Lon[i],
                    lat = galleries$Lat[i],
                    icon= iconOcean,
                    popup = galleries[i, "city"])
}

# Add markers with titles to the map for the galler data
for (i in 1:nrow(galler)) {
  map <- addMarkers(map,
                    lng = galler$Lon[i],
                    lat = galler$Lat[i],
                    icon = iconSea,
                    popup = paste0(galler[i, "city"]))
}

# Display the map
map
