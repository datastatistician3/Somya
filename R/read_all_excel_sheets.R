read_all_sheets <- function(excel_file_name){
  sheetNames <- readxl::excel_sheets(excel_file_name)
  listSheet <- list()
  for(i in 1:length(sheetNames)) {
    listSheet[[i]] <- readxl::read_excel(excel_file_name, sheet = sheetNames[i], col_names = TRUE)
  }
  names(listSheet) <- sheetNames
  return(listSheet)
}

# read_all_sheets(excel_file_name =  excel_file_name)
