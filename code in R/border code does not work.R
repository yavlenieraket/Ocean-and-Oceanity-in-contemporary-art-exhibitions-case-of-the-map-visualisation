
library(sf)
library(leaflet)
library(rnaturalearth)

# Load coastline data and convert to WGS84 geographic CRS
coastline <- ne_coastline(scale = "medium", returnclass = "sf")
coastline <- st_transform(coastline, crs = 4326)

# Use buffer() to create a 50km-wide band along the coastline
land_buffered <- st_buffer(coastline, dist = 50000)

# Create a blank leaflet map centered on the land area
map <- leaflet() %>%
  setView(lng = st_centroid(land_buffered)$X, lat = st_centroid(land_buffered)$Y, zoom = 6) %>%
  addProviderTiles(providers$CartoDB.Positron)

# Add the land area and the coastline buffer to the map
map <- map %>% 
  addPolygons(
    data = st_geometry(land_buffered),
    fillColor = "#74ADD1",
    fillOpacity = 1.0,
    color = "#40ADD1",
    weight = 2
  )

# Display the map
map
