

set.seed(1081)

p <- rexp(17,0.2)
x<-ecdf(p)
maiorQ2amostra =  1 - x(2)


plot(x)

real <- pexp(2, 0.2, lower.tail = FALSE)

print(maiorQ2amostra-real)