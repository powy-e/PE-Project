library("openxlsx")
library("ggplot2")
library("dplyr")
library("reshape2")



countries <- c("GR - Grécia", "HR - Croácia", "SI - Eslovénia")

# Ler os dados do Excel
dadosExcel <- read.xlsx("./Ex01/ResiduosPerCapita.xlsx",
    rows = c(12:43), cols = c(1:3)
)

# Renomear as colunas
colnames(dadosExcel) <- c("País", "2004", "2018")

# Filtrar os Dados e preparar os dados para fazer o gráfico 
dadosExcel <- dadosExcel %>%
    filter(País %in% countries) %>%
    melt(id = c("País"))

# Voltar a renomear colunas
colnames(dadosExcel) <- c("País", "Ano", "Resíduos")

# Fazer o Gráfico de Barras
ggplot(dadosExcel, aes(x = País, y = Resíduos, fill = Ano)) +
    geom_bar(stat = "Identity", position = position_dodge()) +
    geom_text(aes(label = Resíduos),
        vjust = 2.5, size = 4, color = "white",
        position = position_dodge(0.9)
    ) +
    labs(title=" Produção de resíduos per capita") +
    ylab("Resíduos (t)") +
    scale_fill_brewer(palette = "Paired")

