
set.seed(520)

n_amostras <- 1100

dimensao <- 673

lambda <- 0.78

nivel_confianca <- 0.93
alpha <- (1-nivel_confianca)

qnt_dnorm <- qnorm(1-alpha/2)

amostras<- c()
for (i in 1:n_amostras) {
  amostra <- rexp(dimensao, lambda)
  amostras[i] <- 2* qnt_dnorm / sqrt(dimensao) / mean(amostra)
}

print(mean(amostras))



