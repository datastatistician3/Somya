quickSort <- function(array, low, high){
   i = low
   j = high
   pivot = as.integer(array[(i + j) / 2])
  
  while (i <= j)
  {
    while (array[i] < pivot)
      i <- i + 1
    while (array[j] > pivot)
      j <- j - 1
    if (i <= j)
    {
      temp = array[i]
      array[i] = array[j]
      array[j] = temp
      i <- i + 1
      j <- j - 1
    }
  }
  if (j > low)
    quickSort(array, low, j)
  if (i < high)
    quickSort(array, i, high)
   return(array)
}

array1 = c(95, 45, 48, 98, 1, 485, 65, 478, 1, 2325)
quickSort(array1,1, 10)
