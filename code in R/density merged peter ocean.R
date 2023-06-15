
# Libraries
library(ggplot2)
library(dplyr)
library(hrbrthemes)
library(readr)

# Load the datasets
density_use <- read_csv("density_use.csv")
density_peter <- read_csv("densitypeter.csv")

# Combine the datasets
density_oceans <- rbind(density_use, density_peter)

# Make the histogram
density_oceans %>%
  filter(year > 1999) %>%
  ggplot(aes(x = year)) +
  geom_density(fill = "#4d3ac7", color = "#e9ecef", alpha = 0.8) +
  ggtitle("Density of Exhibitions") +
  theme_ipsum()
