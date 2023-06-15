library(leaflet)
library(dplyr)

# Read the data from CSV file
galleries <- read.csv("galleries_3.csv")

# Get the longitude, latitude and galleries data from the CSV file
lon <- galleries$Lon
lat <- galleries$Lat
galleries_col <- galleries$galleries

# Create a leaflet map
map <- leaflet() %>% addTiles()

# Loop through each row of the "galleries" data frame using for loop and add markers to the map for each location using addMarkers() function, with title argument equal to galleries_col value for each row
for (i in 1:nrow(galleries)) {
  map <- addMarkers(map, 
                    lng = lon[i],
                    lat = lat[i],
                    popup = galleries_col[i])
}

# Display the map
map
