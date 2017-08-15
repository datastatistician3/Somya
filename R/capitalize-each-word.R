capitalize_each_word <- function(x){
  g <- l <- j <- list()
  g <- stringr::str_split(x, pattern = "[_|.| ]")
  for ( i in 1:length(g)){
    l[[i]] <- paste(Hmisc::capitalize(g[[i]]), collapse = " ")
    j[[i]] <- paste(l[[i]], collapse = " ")
}
  return(unlist(j))
}