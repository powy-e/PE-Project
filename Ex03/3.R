library("openxlsx")
library("ggplot2")
library("dplyr")
library("reshape2")
library("stringr")
library("data.table")

regioes <- c("Entrecampos", "VNTelha-Maia")


dados <- read.xlsx("./Ex03/QualidadeArO3.xlsx") %>%  select(regioes) %>% melt(measure = regioes)
colnames(dados) <- c("Regiao", "Valor")

dados$Valor <- as.numeric(dados$Valor)

p <- ggplot(dados, aes(x = Valor, fill= Regiao, fill= Regiao)) +
  geom_histogram(binwidth = 20 , alpha=0.5)
p
