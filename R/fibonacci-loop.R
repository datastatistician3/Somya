 fibonacci_loop <- function( n ) {  
   if (n <= 2){
     return(1)
   } 
  fold = 1
  fold2 = 1
    
  for (i in 3:n) {
    fnew = fold + fold2
    fold2 = fold
    fold = fnew
  }
   return(fnew)
 }
 
 fibonacci_loop(3)
 