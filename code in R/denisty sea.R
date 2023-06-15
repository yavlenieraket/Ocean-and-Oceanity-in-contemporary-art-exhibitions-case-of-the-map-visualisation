
# Load libraries
library(ggplot2)
library(dplyr)



library(readr)
density_sea <- read_delim("density_sea.csv", 
                          delim = ";", escape_double = FALSE, trim_ws = TRUE)
View(density_sea)


df1$dataset <- "sea"


df_all <- rbind(df1)

# Set the fill colours for Dataset 1 and Dataset 2
fill_colors <- c("#1c76eb")

# Create stacked density chart with custom fill colours
ggplot(df_all, aes(x = year, fill = dataset)) +
  geom_density(alpha = 1, adjust = 0.5) +
  scale_fill_manual(values = fill_colors) + # set fill colours for datasets
  theme_bw()
