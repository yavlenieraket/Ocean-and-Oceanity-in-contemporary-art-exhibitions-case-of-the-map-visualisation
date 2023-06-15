
# Load libraries
library(ggplot2)
library(dplyr)

# Load data from 2 CSV files
df2 <- read.csv("density_sea.csv")
df4 <- read.csv("density_ocean.csv")

# Filter data for the years between 1993 and 2023
df2 <- filter(df2, year >= 1993 & year <= 2023)
df4 <- filter(df4, year >= 1993 & year <= 2023)

# Create density plot for df2
ggplot(df2, aes(x = year, y = ..density..)) +
  geom_density(fill = "#69b3a2") +
  geom_label(aes(x = 2008, y = 0.25, label = "Sea"), color = "#69b3a2") +
  xlab("Year") +
  scale_x_continuous(limits = c(1993, 2023), breaks = seq(1993, 2023, by = 5)) +
  theme_minimal()

# Create mirrored density plot for df4
ggplot(df4, aes(x = year, y = -..density..)) +
  geom_density(fill = "#404080", adjust = 0.3, position = "identity") +
  geom_label(aes(x = 2008, y = -0.25, label = "Ocean"), color = "#404080") +
  xlab("Year") +
  scale_x_continuous(limits = c(1993, 2023), breaks = seq(1993, 2023, by = 5)) +
  theme_minimal()
