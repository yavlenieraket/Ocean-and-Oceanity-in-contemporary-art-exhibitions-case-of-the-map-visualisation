
# Load libraries
library(ggplot2)
library(dplyr)

# Load data from 3 CSV files and combine them
df1 <- read.csv("densitypeter.csv")
df1$dataset <- "Dataset 1"
df2 <- read.csv("density_use.csv")
df2$dataset <- "Dataset 2"

df_all <- rbind(df1, df2)

# Create stacked density chart with custom histogram and dataset colors
ggplot(df_all, aes(x = year, fill = dataset, color = dataset)) +
  geom_density(alpha = 0.5, adjust = 2) +
  scale_fill_manual(values = c("#5b4fa8", "#62a7d1")) +
  scale_color_manual(values = c("#5b4fa8", "#62a7d1")) +
  theme_bw()
