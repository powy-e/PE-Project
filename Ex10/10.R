
set.seed(835)

n_amostras <- 750

# dimensao das amostras varia entre [100, 2.500] em incrementos de 100
# 100n , n[1:25]

nivel_confianca <- 0.93
contaminar <- 0.25

mediaAmostrasN <- c()
mediaAmostrasNC <- c()
valor_n <- c()

for (j in 1:25) {
  amostrasN <- c()
  amostrasNC <- c()
  for (i in 1:n_amostras) {
    amostrasN[i]<- 2*(sd(rexp(100*j*(1-contaminar), 0.35)) * nivel_confianca / sqrt(100*j*contaminar))
    amostrasNC[i]<- 2*(sd(rexp(100*j*contaminar, 0.02)) * nivel_confianca / sqrt(100*j*contaminar))
  }
  valor_n[j] = (100*j)
  mediaAmostrasN[j] <- mean(amostrasN)
  mediaAmostrasNC[j] <- mean(amostrasNC)
}


dados <- data.frame(N = valor_n, MA = mediaAmostrasN, MAC = mediaAmostrasNC) %>% melt(id = "N")

p <- ggplot(dados, aes(x = N, y = value, color = variable)) +
  geom_point() +
  theme_light()

