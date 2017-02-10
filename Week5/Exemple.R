#Exemple Week5


x <- c("a", "b", "c", "d","e","f")

for(truc in x) {
  truc <- paste(truc, "b")
  print(truc)
}

for(j in 1:10) {
  print(j)
}

j <- 1
while(j <11) {
  print(j)
  j <- j + 1
}


x0 <- 10
# find x tel quel 2 x + 1 == 0


x <- 0
count <- 0
while(x < 0.1) {
  x <- runif(1)
  count <- count + 1
  print(x)
}

print(x)
print(count)


ma.super.fonction <- function(){
  return(1)
}



ma.super.fonction2 <- function(mon.argument){
  print(mon.argument)
  return(paste(mon.argument, "bob"))
}


x <- ma.super.fonction()
x

ma.super.fonction2("adrien")

install.packages("beepr")
library(beepr)

for(j in 1:3){
  beep()
}

