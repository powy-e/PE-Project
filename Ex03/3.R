library("openxlsx")
library("ggplot2")
library("dplyr")
library("reshape2")


regioes <- c("Entrecampos", "VNTelha-Maia")

# Ler e selecionar os dados
dados <- read.xlsx("./Ex03/QualidadeArO3.xlsx") %>%  select(regioes) %>% melt(measure = regioes)
colnames(dados) <- c("Região", "Valor")

# Converter o tipo de dados para Numérico
dados$Valor <- as.numeric(dados$Valor)

#Gráfico
ggplot(dados, aes(x = Valor, fill= Região)) +
  geom_histogram(bins = 20, alpha=0.7) + 
  labs(title=" Observações horárias de níveis de ozono",
       subtitle = expression(" Em Entrecampos e VNTelha-Maia"~µg/m^3), y="Número de Observações",
       x = expression("Quantidade em "~ µg/m^3)) +
  theme(plot.subtitle=element_text(size=10, hjust=0.03, color="#808080"))
