
A <- matrix(c(1,1,0,3,
              2,1,-1,1,
              3,-1,-1,2,
              -1,2,3,-1), nrow = 4, ncol = 4, byrow = T)
A


LU <- function(A){
  
  n <- nrow(A)
  L <- U <-  matrix(c(0), ncol = n, nrow = n)
  diag(L) <- 1
  L;U
  #Adım1
  U[1,1] <- A[1,1]/L[1,1]
  if(L[1,1]*U[1,1] == 0){
    stop("Çarpanlarına ayırmak imkansız.")
  }
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
    L[i,i] <- U[i,i]<- (A[i,i] - sum(L[i, 1:(i-1)]*U[1:(i-1),i]))
    #U[i,i]<- (A[i,i] - sum(L[i, k=1:(i-1)]*U[k=1:(i-1),i]))
    L;U
    if(L[i,i]*U[i,i] == 0){
      stop("Matris çarpanlarını ayırmak mümkün değil.")
    }
    #Adım5
    for(j in (i+1):n){
      U[i,j] <- (1/L[i,i]) * (A[i,j] - sum(L[i,1:(i-1)]*U[1:(i-1),j]))
      L[j,i] <- (1/U[i,i]) * (A[j,i] - sum(L[j,1:(i-1)]*U[1:(i-1),i]))
      L;U
    }
  }
  #Adım6
  L[n,n] <- U[n,n] <- (A[n,n]- sum(L[n,1:(n-1)]*U[1:(n-1),n]))
  L;U
  if(L[n,n]*U[n,n] == 0){
    cat("Çözüm tekildir.")
  }
  L;U
  #Adım7
  return(A)
}
LU(A)
A
# syf 428 den sonraki örneklerden çöz
