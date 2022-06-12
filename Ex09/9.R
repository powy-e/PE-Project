library("ggplot2")

#indicações do enunciado
set.seed(285)

n_amostras <- 900

lambda <- 0.7

nivel_confianca <- 0.99
alpha <- (1-nivel_confianca)

qnt_dnorm <- qnorm(1-alpha/2)  # Quantis de Distribuição Normal

mediaAmostrasN <- c()
valor_n <- c()
for (j in 1:50) {
  amostrasN <- c()
  dimensao <- 100*j   # Dimensão das amostras varia entre [100, 5.000] em incrementos de 100
  for (i in 1:n_amostras) {
    amostra <- rexp(dimensao, lambda)
    amostrasN[i]<- 2* qnt_dnorm / sqrt(dimensao) / mean(amostra) # Amplitude do Intervalo de confiança
  }
  valor_n[j] = dimensao
  mediaAmostrasN[j] <- mean(amostrasN)
}

# Passar dados para um DataFrame
dados <- data.frame(N = valor_n, MA = mediaAmostrasN)

# Gráfico
ggplot(dados, aes(x = N, y = MA)) +
  geom_point(color = "orange") +
  labs(title = "Média da amplitude dos IC em função da dimensão da amostra (n)",
       subtitle = expression("com 900 amostras com dimensão n e X~Exp(λ=0.7)"),
       y = "Média da Amplitude dos IC", x = "Tamanho da Amostra") +
  theme(plot.subtitle=element_text(size=10, hjust=0.03, color="#808080"))
