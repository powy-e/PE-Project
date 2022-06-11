
set.seed(484)

n_amostras <- 550

# dimensao das amostras varia entre [100, 2.500] em incrementos de 100
# 100n , n[1:25]

contaminar <- 0.25

lambda <- 0.28
lambda_c <- 0.17
  
nivel_confianca <- 0.92
alpha <- (1-nivel_confianca)

qnt_dnorm <- qnorm(1-alpha/2)

mediaAmostrasN <- c()
mediaAmostrasNC <- c()
valor_n <- c()

for (j in 1:25) {
  amostrasN <- c()
  amostrasNC <- c()
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
  geom_point()
