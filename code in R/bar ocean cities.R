
# Load the necessary library for reading csv files

library(readr)
data <- read_delim("Ocean_bar.csv", 
                        delim = ";", escape_double = FALSE, trim_ws = TRUE)
View(data)

# Create the barplot
barplot(height = data$index, 
        names.arg = data$city, 
        xlab = "Cities and amount of exhibitions about ocean",
        ylab = "Index",
        main = "ocean",
        col = rainbow(nrow(data)))


