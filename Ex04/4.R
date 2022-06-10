library("openxlsx")
library("ggplot2")
library("dplyr")
library("reshape2")
library("stringr")
library("data.table")

variaveis <- c("Colesterol", "TAD")


dados <- read.xlsx("./Ex04/Utentes.xlsx") %>%  select(variaveis)


p <- ggplot(dados, aes(x = Colesterol, y= TAD)) +
  geom_point(color= 'black', fill='orange', shape= 21) +
  labs(title = "Gráfico de Dispersão de TAD e Colestrol") 
p
