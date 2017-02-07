# Exemple de boucle for avec usage de next/break
values <- c("a","b","c","d")
values <- seq(from=0, to=10, by=0.5)

for(j in values){
  
  if(j<5) {
    print(j)
    next
  }
  
  print("hello")
}


print("end")


# Exemple de traitement conditionnel au cours d'une boucle for
x <- rep(c("Adrien", "Bob"), length.out = 20)
y <- runif(20) * 15000

str(x)
str(y)
data <- data.frame(Name= x, Dist= y)

head(data)
str(data)

data$Name <- as.character(data$Name)
data$Name <- as.factor(data$Name)

data[12,1] <- "Janine"

# calculer la distance totale parcourue par Adrien et Bob
n <- nrow(data)
n

sum_adrien <- 0
sum_bob <- 0

for(a in 1:20) {
  print(a)
  
  #print(data[a,1])
  #print(data[a,2])
  name_a <- data[a,1]
  dist_a <- data[a,2]
  
  if(name_a == "Adrien" & dist_a > 1000){
    sum_adrien <- sum_adrien + dist_a
  } else if(name_a == "Bob" & dist_a > 1000) {
    sum_bob <- sum_bob + dist_a
  } else {
    warning("Unknown runner")
  }
  
}

print(sum_adrien)
print(sum_bob)

# commande équivalente pour cet exemple simple.
sum(data$Dist[data$Name == "Adrien" & data$Dist > 1000])
sum(data$Dist[data$Name == "Bob" & data$Dist > 1000])


# Exemple à finir avec des deal types.
dealType <- rep(c("FUTCO", "GEFWD", "GESWA"), length.out=1000)
prices <- rep(c(10,45,-20), length.out= 1000)

data <- data.frame(DealType= dealType, Price= prices)
data$Price <- data$Price + rnorm(1000, mean=0, sd= 10)

str(data)
head(data)


