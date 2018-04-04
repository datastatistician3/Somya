#' @name calculate_postfix
#' @rdname funs
#' 
#' @title This function calculates postfix expression
#'
#' @description This program computes the value by accepting the string input which is space-delimited
#'              arithmetic expression in postfix notation.
#'
#' @param input_string A string with space-delimited integer arithmetic expression in postfix notation.
#' 
#' @param operator A string with mathematical operators 
#' 
#' @param char This function checkd if the character value is 
#' 
#' @param number checks if input is a number
#' @param x operand 1
#' @param y operator
#' @param z operand 2
#' @param input_vector input vector
#' @param values numeric values
#'
#' @return A integer value
#'
#' @author Som Bohora
#'
#' @examples
#' 
#' calculate_postfix("2 3 1 * + 9 - ")
NULL

# Check if the operators are valid
#' @rdname funs
check_valid_operators <- function(operator){
	# only allow valid four operators
	valid_chars = grepl("/|-|\\+|\\*|/|%", operator)

	if (!valid_chars) {
	  # throw an error if one of four valid operators are not entered.
		stop("Invalid expression. Please enter valid postfix expression.")
	}
}

# Function to check if the character value is +, -, *, /.
#' @rdname funs
check_operator <- function(char){
	if (char == "+" | char == "-" | char == "%%" | char == "/" | char == "*" ){
	  return(TRUE)
	} else {
	  return(FALSE)
	}
}

# Function to check whethern character is digit inbetween 0 to 9 or not.
#' @rdname funs
check_digit <- function(number){
	if (number >= '0')
	{
		return(TRUE)
	}	else {
		return(FALSE)
	}
}

# Function to execute tasks
#' @rdname funs
perform_operation <- function(z, x, y){
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

# Push method
#' @rdname funs
#' @export
push <- function(input_vector, values) {
  base::assign(as.character(substitute(input_vector)), c(input_vector, values), parent.frame())
  invisible()
  }

# Pop method
#' @rdname funs
#' @export
pop <- function(input_vector) {
  if(length(input_vector) == 0) {
    return(NA)
  }
  pop_output <- input_vector[length(input_vector)]
  assign(as.character(substitute(input_vector)), input_vector[-length(input_vector)], parent.frame())
  return(pop_output)
}

# main function to calculate postfix expression
#' @rdname funs
#' @export
calculate_postfix <- function(input_string){

  check_valid_operators(operator = input_string)

	store_vector <- as.integer(c())
	s <- unlist(strsplit(base::trimws(input_string), " "))

	check_illegal_char <- grepl("^[[:punct:]]\\d+|^\\d+[[:punct:]]|^[[:punct:]][[:punct:]]$", s)

	if (sum(check_illegal_char) > 0) {
	  stop("This is not valid postfix expression. Digits and operators cannot go together.")
	}

	for (i in 1:length(s)) {
		# check whether the operator is valid or not, and perform the following operations.
		if (check_operator(s[i]))
		{
			# Extract two last elements of the vector
			num1 = as.integer(pop(store_vector))
			num2 = as.integer(pop(store_vector))

			# Perform the operations
			output = perform_operation(s[i], num1, num2)

			# Pushes back the output to the vector
			push(store_vector,output)
		}
		# Check wheather the string is numeric or not.
		else if (check_digit(s[i]))
		{
		#pushes num back to the vector
		push(store_vector,s[i])
		}	else {
		  stop("This is not valid postfix expression.")
		}
	}
	#returns the final one integer output
	return(paste("The result is:", pop(store_vector)))
}


