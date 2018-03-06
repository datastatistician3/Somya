find_max <- function(arr) {
   max = arr[1]
   
   for (i in 1:length(arr)) {
     if (arr[i] > max)
       max = arr[i]
   }
   return(max)
}

find_max(c(2,3,200,5,6,7))
