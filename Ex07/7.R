
set.seed(313)

n_amostras <- 7390

dimensao <- 56

amostras<- c()
for (i in 1:n_amostras) {
  amostras[i] <- mean(rbinom(dimensao, 48, 0.53))
}

sum <- 0

for (i in 0:48){
  sum <-sum + ( i * dbinom(i, 48, 0.53))
}

result <- abs(mean(amostras) - sum)

print(result)