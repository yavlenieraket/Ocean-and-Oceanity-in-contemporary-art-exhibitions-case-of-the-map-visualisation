
# Load libraries
library(ggplot2)
library(dplyr)

library(readr)
density_ocean <- read_csv("density_ocean.csv")
View(density_ocean)
df1$dataset <- "ocean"


df_all <- rbind(df1)

# Set the fill colours for Dataset 1 and Dataset 2
fill_colors <- c("#0000b3")

# Create stacked density chart with custom fill colours
ggplot(df_all, aes(x = year, fill = dataset)) +
  geom_density(alpha = 1, adjust = 0.5) +
  scale_fill_manual(values = fill_colors) + # set fill colours for datasets
  theme_bw()

