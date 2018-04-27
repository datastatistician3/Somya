#' @name evaluate_prefix
#' @rdname funs
#' 
#' @title This function calculates postfix expression
#'
#' @description This program computes the value by accepting the string input which is space-delimited
#'              arithmetic expression in prefix notation.
#'
#' @param expression A string with space-delimited integer arithmetic expression in prefix notation
#'
#' @return A integer value
#'
#' @author Som Bohora
#'
#' @examples
#' 
#' expr <- "+ 9 * - 2 5 + 3 2"
#' evaluate_prefix(expr)
NULL

# Function to check whethern character is digit inbetween 0 to 9 or not.
#' @rdname funs
check_digit <- function(number){
	if (number >= '0')
	{
	  return(TRUE)
	} else {
	  return(FALSE)
	}
}

# main function to calculate prefix expression
#' @rdname funs
#' @export
evaluate_prefix <- function(expression){
    stack <- as.vector(c())
    split_expr <- unlist(strsplit(base::trimws(expression), " "))

    check_illegal_char <- grepl("^[[:punct:]]\\d+|^\\d+[[:punct:]]|^[[:punct:]][[:punct:]]$", split_expr)

  	if (sum(check_illegal_char) > 0) {
  	  stop("This is not valid prefix expression. Digits and operators cannot go together.")
  	}

    for (j in length(split_expr):1) {
        #Push operand to stack
        if (check_digit(split_expr[j])){
            Somya::push(stack, split_expr[j])
        } else {

            #Operator encountered. Pop two elements from stack
            value1 = as.numeric(Somya::pop(stack))
            value2 = as.numeric(Somya::pop(stack))

            if (split_expr[j] == "+") {
              Somya::push(stack, (value1 + value2))
            } else if (split_expr[j] == "-") {
              Somya::push(stack, (value1 - value2))
            } else if (split_expr[j] == "*") {
              Somya::push(stack, (value1 * value2))
            } else if (split_expr[j] == "/") {
              Somya::push(stack, (value1 / value2))
            } else if (split_expr[j] == "%%") {
              Somya::push(stack, (value1 %% value2))
            } else {
              stop("Invalid operator, choose +, -, *, /, %%")
            }
        }
    }
     return(paste("The result is:", Somya::pop(stack)))
}
