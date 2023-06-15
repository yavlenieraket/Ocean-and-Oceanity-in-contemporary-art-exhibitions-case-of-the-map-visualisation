library(readr)
Sea_bar <- read_delim("Sea_bar.csv", delim = ";", escape_double = FALSE, trim_ws = TRUE)
View(Sea_bar)


# Filter out rows with index <= 2
filtered_data <- Sea_bar[Sea_bar$index > 2,]

# Create the barplot
barplot(height = filtered_data$index, 
        names.arg = filtered_data$city, 
        xlab = "Cities and amount of exhibitions about sea",
        ylab = "Index",
        main = "sea",
        col = rainbow(nrow(filtered_data)))