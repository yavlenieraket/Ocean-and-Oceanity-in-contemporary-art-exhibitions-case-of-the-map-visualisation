
library(leaflet)
library(dplyr)
library(readr)

fend_map <- read_delim("fend_map.csv", delim = ";",
                       escape_double = FALSE, col_types = cols(Lat = col_double()),
                       trim_ws = TRUE)
View(fend_map)

# Get the longitude and latitude data from the CSV file
lon <- fend_map$Lon
lat <- fend_map$Lat

# Create a leaflet map
map <- leaflet() %>% addTiles()

# Add markers with icons and popup titles to the map
for (i in 1:nrow(fend_map)) {
  # use the icon name from the gallery column
  icon_name <- fend_map[i, "gallery"]
  icon_path <- paste0("icons/", icon_name, ".png")
  
  map <- addMarkers(map,
                    lng = lon[i],
                    lat = lat[i],
                    icon = iconfendmap,
                    popup = fend_map[i, "gallery"])
}

# Display the map
map
