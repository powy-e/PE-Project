
set.seed(285)

n_amostras <- 900

# dimensao das amostras varia entre [100, 5.000] em incrementos de 100
# 100n , n[1:50]


nivel_confianca <- 0.99

mediaAmostrasN <- c()
valor_n <- c()

for (j in 1:50) {
  amostrasN <- c()
  for (i in 1:n_amostras) {
      amostrasN[i]<- 2*(sd(rexp(100*j, 0.7)) * nivel_confianca / sqrt(100*j))
  }
  valor_n[j] = (100*j)
  mediaAmostrasN[j] <- mean(amostrasN)
}


dados <- data.frame(N = valor_n, MA = mediaAmostrasN)

p <- ggplot(dados, aes(x = valor_n, y = mediaAmostrasN)) +
  geom_line() +
  theme_light()

