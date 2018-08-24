## Write all dataframes to different sheets in the same excel file

# df1 <- mtcars[1:20,]
# df2 <- mtcars[20:30,]
# df3 <- mtcars[1:25,]
# 
# df_list <- list(df1, df2, df3)
# 
# write_different_sheets <- function(df_list, file_name = "miechv_tables.xlsx"){
#   
#   xlsx::write.xlsx(df_list[[1]], file = file_name, sheetName="Table 1", row.names=FALSE)
# 
#   for (i in 2:length(df_list)) {
#     xlsx::write.xlsx(df_list[[i]], file = file_name, sheetName=paste("Table ", i), append = TRUE, row.names=FALSE)
#   }
#   message(length(df_list), " sheets are added to the excel file called ", file_name)
# }
# 
# write_different_sheets(df_list = df_list)


# df1 <- mtcars[1:5,]
# df2 <- mtcars[6:10,]
# df3 <- mtcars[11:15,]
# 
# getDF <- function(x, num = 5){
#   return(x[1:num,])
# }
# 
# final_df <- NULL
# for ( i in 1:2){
#   x <- getDF(mtcars,i)
#   final_df <-  rbind.data.frame(out, x)
# }
# 
# final_df <- NULL
# for (i in 1:length(db_list)) {
#   x <- getJSOAP(db_location[i],db_name[i])
#   final_df <- rbind.data.frame(final_df, x)
# }
# 
# myList <- list(getJSOAP(db_location[1],db_name[1]), getJSOAP(db_location[2],db_name[2]))
# do.call(rbind.data.frame, myList)