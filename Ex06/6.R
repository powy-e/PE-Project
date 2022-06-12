library("ggplot2")
library("patchwork")


inicio <- 4; fim <- 8

n_value <- c(2, 25, 59)
seed <- 1681

pop <- 290

var_unif_distr <- ((fim-inicio)**2)/12
val_esperado <- mean(c(fim,inicio))

dados <- matrix(nrow = pop, ncol = 3)
for (n in 1:3) {
  set.seed(seed)
  for(i in 1:pop) { 
    dados[i,n] <- mean(runif(n_value[n], inicio, fim)) 
  }
}

dados <- data.frame(dados)

gráficos <- list()
for (i in 1:3) {
gráficos[[i]] <-  ggplot(dados, aes_string(colnames(dados)[i])) + geom_histogram(aes(y = stat(count/sum(count))),colour="purple", fill="#FF00FF", alpha = 0.1, bins = 30) +
  xlim(inicio, fim) + stat_function(fun = dnorm, args = list(mean = val_esperado, sd = (sqrt(var_unif_distr / n_value[i]))), color = "black") + 
  labs(title=paste0("Distribuição da Média (n=", n_value[i], ")"), x="Valores da Distribuição da Média", y="Frequência Relativa")
}


Reduce("+", gráficos) 
