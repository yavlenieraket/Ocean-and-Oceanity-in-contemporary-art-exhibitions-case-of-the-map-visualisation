
# Load libraries
library(ggplot2)
library(dplyr)

# Load data from 3 CSV files and combine them
df1 <- read.csv("densitypeter.csv")
df1$dataset <- "Peter Fend"
df2 <- read.csv("density_sea.csv")
df2$dataset <- "Sea"
df3 <- read.csv("ostend_density.csv")
df3$dataset <- "Sea.Ostend"
df4 <- read.csv("density_ocean.csv")
df4$dataset <- "Ocean"

df_all <- rbind(df2)

# Filter data to only include years 1993 onwards
df_all <- filter(df_all, year >= 1993)

# Create stacked density chart with custom color palette
ggplot(df_all, aes(x = year, fill = dataset)) +
  geom_density(alpha = 0.4, adjust = 0.3) +
  scale_fill_manual(values = c("#1F78B4", "#2415ab", "#7ac3e6", "#64c3c4")) +
  theme_bw()
