library("openxlsx")
library("ggplot2")
library("dplyr")
library("reshape2")
library("stringr")

paises <- c("UK - Reino Unido", "ES - Espanha", "FI - Finlândia")
paisesProcessados<- unlist(lapply(paises, str_replace_all," ","."))

# Ler e processar dados das Homens
dadosHomens <- read.xlsx("./Ex02/EsperancaVida.xlsx",
    rows = c(9:70), cols = c(1,36:69))  %>%  select( (paisesProcessados) | X1) %>% 
  filter(X1 %in% 2002:2019)
colnames(dadosHomens) <- c("UK - M", "ES - M", "FI - M", "Ano")
dadosHomens <- melt(dadosHomens,id = c("Ano"))

# Ler e processar dados das Mulheres
dadosMulheres <- read.xlsx("./Ex02/EsperancaVida.xlsx",
  rows = c(9:70), cols = c(1,70:104)) %>%  select((paisesProcessados) | X1) %>% 
  filter(X1 %in% 2002:2019)
colnames(dadosMulheres) <- c("UK - F", "ES - F", "FI - F", "Ano")
dadosMulheres <- melt(dadosMulheres,id = c("Ano"))

# Retirar dados inexistentes
dadosTotais <- rbind(dadosMulheres, dadosHomens) %>% filter(value != 0)
colnames(dadosTotais)<-c("Ano", "Pais", "EMV")

# Gráfico
ggplot(dadosTotais, aes(x = Ano, y = EMV, color= Pais)) +
  geom_line() +
  labs(title=" Evolução da Esperança Média de Vida", subtitle = " No UK, ES, FI por sexo") + ylab("Esperança Média de Vida")+ 
  theme(plot.subtitle=element_text(size=10, hjust=0.03, color="#808080"))
