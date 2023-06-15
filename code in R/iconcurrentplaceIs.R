library(leaflet)

# Define the URL or local path for the image
imageUrl <- "currentplaceIs.png"

# Create a custom icon
iconcurrentplaceIs <- makeIcon(iconUrl = imageUrl, iconWidth = 50, iconHeight = 50)

# Create a simple map with a marker using the custom icon
map <- leaflet() %>%
  addTiles() %>%
  setView(lng = -73.9857, lat = 40.7484, zoom = 12) %>% # set center location and zoom level
  addMarkers(lng = -73.9857, lat = 40.7484, icon = iconcurrentplaceIs) # add marker with custom icon

# Add javascript to rescale icon on zoom
map <- htmlwidgets::onRender(map, "
  function(el, x) {
    this.on('zoomend', function() {
      var zoom = this.getZoom();
      var newIconSize = [35, 45];  // Change to new size for your marker
      var newIconAnchor = [newIconSize[0]/2, newIconSize[1]/2];
      el.getElementsByClassName('leaflet-marker-icon')[0].style.width = newIconSize[0] * zoom/3 + 'px';
      el.getElementsByClassName('leaflet-marker-icon')[0].style.height = newIconSize[1] * zoom/3 + 'px';
      el.getElementsByClassName('leaflet-marker-icon')[0].style.marginLeft = -newIconAnchor[0] * zoom/3 + 'px';
      el.getElementsByClassName('leaflet-marker-icon')[0].style.marginTop = -newIconAnchor[1] * zoom/3 + 'px';
    });
  }
")

# Display the map
map
