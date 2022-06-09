
set.seed(313)

n_amostras <- 1100

dimensao <- 673

nivel_confianca <- 0.93

amostras<- c()
for (i in 1:n_amostras) {
  amostras[i]<- 2*(sd(rexp(dimensao, 0.78)) * nivel_confianca / sqrt(dimensao))
}

print(mean(amostras))



