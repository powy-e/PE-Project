library("openxlsx")
library("ggplot2")
library("dplyr")

variaveis <- c("Colesterol", "TAD")


dados <- read.xlsx("./Ex04/Utentes.xlsx") %>%  select(variaveis)


ggplot(dados, aes(x = Colesterol, y= TAD)) +
  geom_point(color= 'black', fill='orange', shape= 21) + xlim(0,320) + ylim(0, 110) +
  labs(title = "Gráfico de Dispersão de TAD e Colestrol", subtitle = "em 76 Utentes") + geom_smooth(method = "lm", se =FALSE) +
  theme(plot.subtitle=element_text(size=10, hjust=0.03, color="#808080"))
