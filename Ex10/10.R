library("ggplot2"); library("dplyr"); library("reshape2")

set.seed(835)
n_amostras <- 750

contaminar <- 0.25                # % a contaminar

lambda <- 0.35
lambda_c <- 0.02
  
nivel_confianca <- 0.93
alpha <- (1-nivel_confianca)

qnt_dnorm <- qnorm(1-alpha/2)     # Quantis de Distribuição Normal

mediaAmostrasN <- c(); mediaAmostrasNC <- c()
valor_n <- c()
for (j in 1:25) {
  amostrasN <- c(); amostrasNC <- c()               # Amostra Contaminada
  dimensao <- 100*j
  for (i in 1:n_amostras) {
    descontaminados <- rexp(dimensao, lambda)
    contaminados <- rexp(dimensao*contaminar, lambda_c)
    amostraContaminada <- append(contaminados, descontaminados[(dimensao*contaminar + 1):(dimensao)])
    amostrasN[i]<- 2* qnt_dnorm / sqrt(dimensao) / mean(descontaminados)
    amostrasNC[i]<- 2* qnt_dnorm / sqrt(dimensao) / mean(amostraContaminada)
  }
  valor_n[j] = dimensao
  mediaAmostrasN[j] <- mean(amostrasN)
  mediaAmostrasNC[j] <- mean(amostrasNC)
}

dados <- data.frame(N = valor_n, MA = mediaAmostrasN, MAC = mediaAmostrasNC) %>% melt(id = "N")

ggplot(dados, aes(x = N, y = value, color = variable)) +
  geom_point() +
  labs(title = "Média da amplitude dos IC em função da dimensão da amostra (n)",
       subtitle = expression("com/sem contaminação por distribuição que modela outliers"),
       y = "Média da Amplitude dos IC", x = "Tamanho da Amostra (n)") +
  scale_color_discrete(name = "Contaminação", labels = c("MA(n) - Descontaminada", "MAc(n) - Contaminada")) +
  theme(plot.subtitle=element_text(size=10, hjust=0.03, color="#808080"))
