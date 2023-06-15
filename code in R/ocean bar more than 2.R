
library(readr)
data <- read_delim("Ocean_bar.csv", delim = ";", escape_double = FALSE, trim_ws = TRUE)
View(data)

# Filter out rows with index <= 2
filtered_data <- data[data$index > 2,]

# Create the barplot
barplot(height = filtered_data$index, 
        names.arg = filtered_data$city, 
        xlab = "Cities and amount of exhibitions about ocean",
        ylab = "Index",
        main = "ocean",
        col = rainbow(nrow(filtered_data)))
