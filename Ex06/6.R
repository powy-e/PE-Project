library("ggplot2")
library("patchwork")


inicio <- 4; fim <- 8

n1 <- 2; n2 <- 25; n3 <- 59

pop <- 290

dadosN1<- c()
dadosN2<- c()
dadosN3<- c()

set.seed(1681)
for(i in 1:pop) { 
  dadosN1[i] <- mean(runif(n1, inicio, fim)) 
}
set.seed(1681)
for(i in 1:pop) { 
  dadosN2[i] <- mean(runif(n2, inicio, fim)) 
}
set.seed(1681)
for(i in 1:pop) { 
  dadosN3[i] <- mean(runif(n3, inicio, fim)) 
}


dados <- data.frame(dadosN1, dadosN2, dadosN3)
dados$dadosN1 <-  as.numeric(dados$dadosN1)

p <- ggplot(dados, aes(x = Valor, fill= Regiao)) +
  geom_histogram(binwidth = 10 , alpha=0.5)


p1 <- ggplot(dados, aes(dadosN1)) + geom_histogram(aes(y = after_stat(count/sum(count))),colour="black", fill="white") +
  xlim(inicio, fim) +
  stat_function(fun = dnorm, args = list(mean = (mean(dados$dadosN1)),
                                         sd = (sd(dadosN1) / sqrt((n1)))))

p2 <- ggplot(dados, aes(dadosN2)) + geom_histogram(aes(y = after_stat(count/sum(count))),colour="black", fill="white") +
  xlim(inicio, fim)  +
  stat_function(fun = dnorm, args = list(mean = (mean(dados$dadosN2)),
                                         sd = (sd(dadosN2) / sqrt((n2)))))

p3 <- ggplot(dados, aes(dadosN3)) + geom_histogram(aes(y = after_stat(count/sum(count))),colour="black", fill="white") +
  xlim(inicio, fim) +
  stat_function(fun = dnorm, args = list(mean = (mean(dados$dadosN3)),
                                         sd = (sd(dadosN3) / sqrt((n3)))))

p1+p2+p3


