# Description: This Program compute the value by accepting the string input which is space-delimited 
#                 arithmetic expression in postfix notation.

check_valid_operators <- function(input_string){
	# only allow valid four operators
	validChars = grepl("/|-|\\+|\\*|/|%", input_string)

	if (!validChars) {
	  # throw an error if one of four valid operators are not entered.
		stop("Invalid expression. Please enter valid postfix expression.")
	}
}

# Function to check if the character value is +, -, *, /.
checkOperator <- function(char){
	if (char == "+" | char == "-" | char == "%%" | char == "/" | char == "*" ){
	  return(TRUE)
	} else {
	  return(FALSE)
	}
}

# Function to check whethern character is digit inbetween 0 to 9 or not.
checkDigit <- function(x){
	if (x >= '0')
	{
		return(TRUE)
	}	else {
		return(FALSE)
	}
}

# Function to execute tasks 
executeTasks <- function(z, x, y){
  if (z == "+") {
    return(x + y)
  } else if (z == "-") {
    return(y - x)
  } else if (z == "*") {
    return(x * y)
  } else if (z == "/") {
    return(y / x)
  } else if (z == "%%") {
    return(y %% x)
  } else {
      stop("Invalid operator, choose +, -, *, /, %%")
  } 
}

# Function to calculate postfix expression and gives result
calculate_postfix <- function(input_str){
  
  check_valid_operators(input_string = input_str)

	storeVector <- as.integer(c())
	s <- unlist(strsplit(base::trimws(input_str), " "))
	
	check_illegal_char <- grepl("^[[:punct:]]\\d+|^\\d+[[:punct:]]|^[[:punct:]][[:punct:]]$", s)
	
	if (sum(check_illegal_char) > 0) {
	  stop("This is not valid postfix expression. Digits and operators cannot go together.")
	}
	
	for (i in 1:length(s)) {
		# check whether the operator is valid or not, and perform the following operations.
		if (checkOperator(s[i]))
		{
			# Extract two last elements of the vector
			num1 = as.integer(pop(storeVector))
			num2 = as.integer(pop(storeVector))
			
			# Perform the operations
			output = executeTasks(s[i], num1, num2)
			
			# Pushes back the output to the vector
			push(storeVector,output)	
		}
		# Check wheather the string is numeric or not.
		else if (checkDigit(s[i]))
		{
		#pushes num back to the vector
		push(storeVector,s[i])
		}	else {
		  stop("This is not valid postfix expression.")
		}
	}
	#returns the final one integer output
	return(paste("The result is:", pop(storeVector)))
}


push <- function(x, values) {
  assign(as.character(substitute(x)), c(x, values), parent.frame())
  invisible()
  }

pop <- function(x) {
  if(length(x) == 0) {
    return(NA)
  }
  popret <- x[length(x)]
  assign(as.character(substitute(x)), x[-length(x)], parent.frame())
  return(popret)
}
