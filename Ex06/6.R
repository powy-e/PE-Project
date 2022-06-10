
set.seed(1681)

inicio <- 4
fim <- 8

n1 <- 2
n2 <- 25
n3 <- 59

pop <- 290

dadosN1<- c()
dadosN2<- c()
dadosN3<- c()

for(i in 1:pop) { 
  dadosN1[i] <- mean(runif(n1, inicio, fim)) 
}

for(i in 1:pop) { 
  dadosN2[i] <- mean(runif(n2, inicio, fim)) 
}

for(i in 1:pop) { 
  dadosN3[i] <- mean(runif(n3, inicio, fim)) 
}


media1 <- mean(unif1)
media2 <- mean(unif2)
media3 <- mean(unif3)

p <- ggplot(dados, aes(x = Valor, fill= Regiao)) +
  geom_histogram(binwidth = 10 , alpha=0.5)



ggplot() + aes(dadosN1)+ geom_histogram(aes(y = after_stat(count / sum(count))),colour="black", fill="white") +
  xlim(inicio, fim) + scale_y_continuous(labels = scales::percent) #+
 # stat_function(fun = dnorm, args = list((inicio+fim)/2), sqrt(((fim-inicio)**2)/(12*n1)))

ggplot() + aes(dadosN2)+ geom_histogram(aes(y = after_stat(count / sum(count))),colour="black", fill="white") + 
  xlim(inicio, fim) + scale_y_continuous(labels = scales::percent)

ggplot() + aes(dadosN3)+ geom_histogram(aes(y = after_stat(count / sum(count))),colour="black", fill="white") + 
  xlim(inicio, fim) + scale_y_continuous(labels = scales::percent)

