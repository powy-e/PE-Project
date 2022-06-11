
set.seed(285)

n_amostras <- 900

# dimensao das amostras varia entre [100, 5.000] em incrementos de 100
# 100n , n[1:50]

lambda <- 0.7

nivel_confianca <- 0.99
alpha <- (1-nivel_confianca)

qnt_dnorm <- qnorm(1-alpha/2)

mediaAmostrasN <- c()
valor_n <- c()
for (j in 1:50) {
  amostrasN <- c()
  dimensao <- 100*j
  for (i in 1:n_amostras) {
    amostra <- rexp(dimensao, lambda)
    amostrasN[i]<- 2* qnt_dnorm / sqrt(dimensao) / mean(amostra)
  }
  valor_n[j] = dimensao
  mediaAmostrasN[j] <- mean(amostrasN)
}


dados <- data.frame(N = valor_n, MA = mediaAmostrasN)

p <- ggplot(dados, aes(x = N, y = MA)) +
  geom_point() +
  theme_light()

