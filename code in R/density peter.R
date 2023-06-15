
# Libraries
library(ggplot2)
library(dplyr)
library(hrbrthemes)

library(readr)
density_oceans <- read_csv("densitypeter.csv")

# Make the histogram
density_oceans %>%
  filter(year > 1999) %>%
  ggplot(aes(x = year)) +
  geom_density(fill = "#2204e0", color = "#e9ecef", alpha = 0.8) +
  ggtitle("Density of Exhibitions") +
  theme_ipsum()
