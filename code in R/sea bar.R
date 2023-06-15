
# Load the necessary library for reading csv files

library(readr)
Sea_bar <- read_delim("Sea_bar.csv", delim = ";", 
                      escape_double = FALSE, trim_ws = TRUE)
View(Sea_bar)


# Create the barplot
barplot(height = Sea_bar$index, 
        names.arg = Sea_bar$city, 
        xlab = "Cities and amount of exhibitions about sea",
        ylab = "Index",
        main = "sea",
        col = rainbow(nrow(data)))


