library("openxlsx")
library("ggplot2")
library("dplyr")
library("reshape2")
library("stringr")
library("data.table")

paises <- c("UK - Reino Unido", "ES - Espanha", "FI - Finlândia")
paisesProcessados<- unlist(lapply(paises, str_replace_all," ","."))


dadosHomens <- read.xlsx("./Ex02/EsperancaVida.xlsx",
    rows = c(9:70), cols = c(1,36:69))  %>%  select( (paisesProcessados) | X1) %>% 
  filter(X1 %in% 2002:2019)
colnames(dadosHomens) <- c("UK - M", "ES - M", "FI - M", "Ano")
dadosHomens <- melt(dadosHomens,id = c("Ano"))


dadosMulheres <- read.xlsx("./Ex02/EsperancaVida.xlsx",
  rows = c(9:70), cols = c(1,70:104)) %>%  select((paisesProcessados) | X1) %>% 
  filter(X1 %in% 2002:2019)

colnames(dadosMulheres) <- c("UK - F", "ES - F", "FI - F", "Ano")

dadosMulheres <- melt(dadosMulheres,id = c("Ano"))


dadosTotais <- rbind(dadosMulheres, dadosHomens) %>% filter(value != 0)
colnames(dadosTotais)<-c("Ano", "Pais", "EMV")

p <- ggplot(dadosTotais, aes(x = Ano, y = EMV, color= Pais)) +
  geom_line() +
  theme_light()

  


