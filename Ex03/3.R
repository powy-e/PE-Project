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
ggplot(dados, aes(x = Valor, color= Região, fill = Região)) +
  geom_histogram(binwidth = 10, alpha=0.5, position="Identity") + 
  labs(title=" Observações horárias de níveis de ozono",
       subtitle = expression(" Em Entrecampos e VNTelha-Maia"~µg/m^3), y="Número de Observações",
       x = expression("Quantidade em "~ µg/m^3)) +
  theme(plot.subtitle=element_text(size=10, hjust=0.03, color="#808080")) + 
  scale_color_brewer(palette = "Set1") +
  scale_x_continuous(breaks = seq(0, 165, 15))
  
