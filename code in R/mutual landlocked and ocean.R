
library(leaflet)
library(sf)
library(rnaturalearth)
library(stringr)
library(dplyr)

# Load world map data and reproject
world <- ne_countries(scale = "medium", returnclass = "sf") %>% 
  st_transform("+proj=longlat +datum=WGS84")

# Get the names of the coastal countries
coastal_countries <- world %>% 
  filter(!is.na(str_detect(admin, "Sea"))) %>% 
  pull(admin)

# Create a data frame with all countries and assign them a color
country_colors <- world %>%
  mutate(color = ifelse(
    admin %in% c("Zambia", "Mali", "Niger", "Ethiopia", "South Sudan", 
                 "Central African Republic", "Chad", "Burkina Faso", 
                 "Uganda", "Rwanda", "Zimbabwe", "Botswana", "Burundi", 
                 "Malawi", "Eswatini", "Lesotho", "Austria", "Serbia", 
                 "Hungary", "Slovakia", "Switzerland", "Belarus", 
                 "North Macedonia", "Czech Republic", "Luxembourg", 
                 "Moldova", "Liechtenstein", "Transnistria", "Andorra", 
                 "San Marino", "Vatican City", "Afghanistan", "Azerbaijan", 
                 "Kazakhstan", "Uzbekistan", "Laos", "Armenia", 
                 "Kyrgyzstan", "Tajikistan", "Turkmenistan", "Mongolia", 
                 "Bhutan", "Nepal", "Bolivia", "Paraguay"), 
    "gray70", 
    ifelse(admin %in% coastal_countries, "blue", "yellow")
  ))

# Create a Leaflet map
map <- leaflet() %>%
  addTiles() %>%
  setView(lng = 0, lat = 0, zoom = 2)

# Fix: Add map argument to addPolygons() and specify tooltip options
map <- map %>% 
  addPolygons(data = country_colors, 
              fillColor = ~color,
              stroke = TRUE,
              weight = 1,
              opacity = 1,
              fillOpacity = 0.7,
              color = "white",
              group = "countries",
              label = ~admin,
              labelOptions = labelOptions(
                style = list("font-weight" = "normal", padding = "3px 8px"),
                textsize = "15px",
                direction = "auto"
              ))

# Read the data from CSV file
galleries <- read.csv("galleries_3.csv")

# Get the longitude and latitude data from the CSV file
lon <- galleries$Lon
lat <- galleries$Lat

# Create a leaflet map
map <- map %>%
  addTiles()

# Add Markers to the map
for (i in 1:nrow(galleries)) {
  map <- addMarkers(map, 
                    lng = lon[i],
                    lat = lat[i], icon= iconOcean)
}

# Display the map
map
