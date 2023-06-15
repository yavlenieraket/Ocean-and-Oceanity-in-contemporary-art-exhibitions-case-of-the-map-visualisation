
library(readxl)
library(dplyr)
library(leaflet)

# Read the Excel file into a data frame
city_freq <- read_excel("galleries_3.xlsx") %>% 
  group_by(city) %>% 
  summarize(Frequency = n(), Lon = mean(Longitude), Lat = mean(Latitude)) # Group by city and count mentions

# Create a leaflet map
map <- leaflet(city_freq) %>%
  addTiles() %>%
  
  # Add circle markers for each city, with size based on frequency of mentions
  addCircles(
    lng = ~Lon,
    lat = ~Lat,
    weight = 1,
    radius = ~sqrt(Frequency) * 30,
    popup = ~paste(city, "<br>Frequency:", Frequency)
  ) 

# Display the map
map
