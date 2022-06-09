



set.seed(1681)

inicio <- 4
fim <- 8

n1 <- 2
n2 <- 25
n3 <- 59

pop <- 290

unif1 <- runif(n1, inicio, fim)
unif2 <- runif(n2, inicio, fim)
unif3 <- runif(n3, inicio, fim)




media1 <- mean(unif1)
media2 <- mean(unif2)
media3 <- mean(unif3)

p <- ggplot(dados, aes(x = Valor, fill= Regiao)) +
  geom_histogram(binwidth = 10 , alpha=0.5)


ggplot() + aes(unif1)+ geom_histogram(binwidth=0.5, colour="black", fill="white")

ggplot() + aes(unif2)+ geom_histogram(binwidth=0.5, colour="black", fill="white")

ggplot() + aes(unif3)+ geom_histogram(binwidth=0.5, colour="black", fill="white")
