
A <- matrix(c(1,1,0,3,
              2,1,-1,1,
              3,-1,-1,2,
              -1,2,3,-1), nrow = 4, ncol = 4, byrow = T)
A

#Exercise 6.5

B <- matrix(c(1,2,-1,
              2,4,0,
              0,1,-1), nrow = 3, ncol = 3, byrow = T)
B

C <-  matrix(c(0,1,1,
               1,-2,-1,
               1,-1,1), nrow = 3, ncol = 3, byrow = T)
C

D <- matrix(c(1,1,-1,0,
              1,1,4,3,
              2,-1,2,4,
              2,-1,2,3), nrow = 4, ncol = 4, byrow = T)
D

E <-  matrix(c(0,1,1,2,
               0,1,1,-1,
               1,2,-1,3,
               1,1,2,0), nrow = 4, ncol = 4, byrow = T)
E

LU <- function(A){
  k <- 1
  n <- nrow(A)
  L <- U <-  matrix(c(0), ncol = n, nrow = n)
  diag(L) <- 1
  L;U
  #Adım1
  U[1,1] <- A[1,1]/L[1,1]
  if(L[1,1]*U[1,1] == 0){
    stop("Çarpanlarına ayırmak imkansız.")
  }
  U[1,1]
  L[1,1]
  A[1,1]
  L;U
  #Adım2
  for(j in 2:n){
    U[1,j] <- A[1,j]/L[1,1]
    L[j,1] <- A[j,1]/U[1,1]
  }
  L;U
  #Adım3
  for(i in 2:(n-1)){
    #Adım4
    U[i,i] <- (A[i,i] - sum(L[i, k:(i-1)]*U[k:(i-1),i]))/L[i,i]
    L;U
    if(L[i,i]*U[i,i] == 0){
      stop("Matris çarpanlarını ayırmak mümkün değil.")
    }
    #Adım5
    for(j in (i+1):n){
      U[i,j] <- (1/L[i,i]) * (A[i,j] - sum(L[i,k:(i-1)]*U[k:(i-1),j]))
      L[j,i] <- (1/U[i,i]) * (A[j,i] - sum(L[j,k:(i-1)]*U[k:(i-1),i]))
      L;U
    }
  }
  #Adım6
  U[n,n] <- (A[n,n]- sum(L[n,k:(n-1)]*U[k:(n-1),n]))/L[n,n]
  L;U
  if(L[n,n]*U[n,n] == 0){
    cat("Çözüm tekildir.")
  }
  #Adım7
  print("L = ")
  print(L)
  print("U = ")
  print(U)
  print("A = ")
  return(A)
}
LU(A)
LU(B)
LU(C)
LU(D)
LU(E)
# syf 428 den sonraki örneklerden çöz
