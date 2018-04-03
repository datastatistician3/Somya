# # Description: This Program compute the value by accepting the string input which is space-delimited 
# #                 arithmetic expression in postfix notation.
# 
# check_valid_operators <- function(input_string){
# 	# only allow valid four operators
# 	valid_chars = grepl("/|-|\\+|\\*|/|%", input_string)
# 
# 	if (!valid_chars) {
# 	  # throw an error if one of four valid operators are not entered.
# 		stop("Invalid expression. Please enter valid postfix expression.")
# 	}
# }
# 
# # Function to check if the character value is +, -, *, /.
# check_operator <- function(char){
# 	if (char == "+" | char == "-" | char == "%%" | char == "/" | char == "*" ){
# 	  return(TRUE)
# 	} else {
# 	  return(FALSE)
# 	}
# }
# 
# # Function to check whethern character is digit inbetween 0 to 9 or not.
# check_digit <- function(x){
# 	if (x >= '0')
# 	{
# 		return(TRUE)
# 	}	else {
# 		return(FALSE)
# 	}
# }
# 
# # Function to execute tasks 
# perform_operation <- function(z, x, y){
#   if (z == "+") {
#     return(x + y)
#   } else if (z == "-") {
#     return(y - x)
#   } else if (z == "*") {
#     return(x * y)
#   } else if (z == "/") {
#     return(y / x)
#   } else if (z == "%%") {
#     return(y %% x)
#   } else {
#       stop("Invalid operator, choose +, -, *, /, %%")
#   } 
# }
# 
# # Function to calculate postfix expression and gives result
# calculate_postfix <- function(input_str){
#   
#   check_valid_operators(input_string = input_str)
# 
# 	store_vector <- as.integer(c())
# 	s <- unlist(strsplit(base::trimws(input_str), " "))
# 	
# 	check_illegal_char <- grepl("^[[:punct:]]\\d+|^\\d+[[:punct:]]|^[[:punct:]][[:punct:]]$", s)
# 	
# 	if (sum(check_illegal_char) > 0) {
# 	  stop("This is not valid postfix expression. Digits and operators cannot go together.")
# 	}
# 	
# 	for (i in 1:length(s)) {
# 		# check whether the operator is valid or not, and perform the following operations.
# 		if (check_operator(s[i]))
# 		{
# 			# Extract two last elements of the vector
# 			num1 = as.integer(pop(store_vector))
# 			num2 = as.integer(pop(store_vector))
# 			
# 			# Perform the operations
# 			output = perform_operation(s[i], num1, num2)
# 			
# 			# Pushes back the output to the vector
# 			push(store_vector,output)	
# 		}
# 		# Check wheather the string is numeric or not.
# 		else if (check_digit(s[i]))
# 		{
# 		#pushes num back to the vector
# 		push(store_vector,s[i])
# 		}	else {
# 		  stop("This is not valid postfix expression.")
# 		}
# 	}
# 	#returns the final one integer output
# 	return(paste("The result is:", pop(store_vector)))
# }
# 
# 
# push <- function(input_vector, values) {
#   assign(as.character(substitute(input_vector)), c(input_vector, values), parent.frame())
#   invisible()
#   }
# 
# pop <- function(input_vector) {
#   if(length(input_vector) == 0) {
#     return(NA)
#   }
#   pop_output <- input_vector[length(input_vector)]
#   assign(as.character(substitute(input_vector)), input_vector[-length(input_vector)], parent.frame())
#   return(pop_output)
# }
