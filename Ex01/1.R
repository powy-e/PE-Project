library("openxlsx")
library("ggplot2")
library("dplyr")
library("reshape2")



countries <- c("GR - Grécia", "HR - Croácia", "SI - Eslovénia")

# Read Data from EXCEL and Filter it by the countries we're looking for
readData <- read.xlsx("./Ex01/ResiduosPerCapita.xlsx",
    rows = c(12:43), cols = c(1:3)
)

# Rename columns to clean up the data
colnames(readData) <- c("Country", "2004", "2018")

# Melt the data to get the data in the right format
readData <- readData %>%
    filter(Country %in% countries) %>%
    melt(id = c("Country"))

# Name columns
colnames(readData) <- c("Country", "Year", "Residues")

# Make the plot
p <- ggplot(readData, aes(x = Country, y = Residues, fill = Year)) +
    geom_bar(stat = "Identity", position = position_dodge()) +
    geom_text(aes(label = Residues),
        vjust = 2.5, size = 4, color = "white",
        position = position_dodge(0.9)
    ) +
    labs(title="Produced Residues per capita") +
    ylab("Residues (t)") +
    scale_fill_brewer(palette = "Paired") +
    theme_minimal()

p
