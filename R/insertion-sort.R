insertion_sort <- function(vector){
  for (i in 1:length(vector)) {
    save_value = vector[i]
    j = i
    while ((j > 1) && (vector[j - 1] > save_value)) {
      vector[j] = vector[j - 1]
      j = j - 1
    }
    vector[j] = save_value
  }
  return(vector)
}

x <- c(2,1,4,7,5,4,2,1,3,1,9,8,7)
insertion_sort(x)

