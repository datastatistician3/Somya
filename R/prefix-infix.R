#R program to evaluate a prefix expression.

check_digit <- function(x){
	if (x >= '0')
	{
	return(TRUE)
	} else {
	return(FALSE)
	}
}
 
evaluate_prefix <- function(expression){
    stack <- as.vector(c())
    split_expr <- unlist(strsplit(base::trimws(expression), " "))
    
    check_illegal_char <- grepl("^[[:punct:]]\\d+|^\\d+[[:punct:]]|^[[:punct:]][[:punct:]]$", split_expr)
  	
  	if (sum(check_illegal_char) > 0) {
  	  stop("This is not valid prefix expression. Digits and operators cannot go together.")
  	}
 
    for (j in length(split_expr):1) {
        #Push operand to stack
        #To convert expression[j] to digit subtract #'0' from expression[j].
        if (check_digit(split_expr[j])){
            push(stack, split_expr[j])
        } else {
 
            #Operator encountered
            #Pop two elements from stack
            o1 = as.numeric(pop(stack))
            o2 = as.numeric(pop(stack))
 
            #Use switch case to operate on o1 and o2 and perform o1 O o2.
            if (split_expr[j] == "+") {
              push(stack, (o1 + o2))
            } else if (split_expr[j] == "-") {
              push(stack, (o1 - o2))
            } else if (split_expr[j] == "*") {
              push(stack, (o1 * o2))
            } else if (split_expr[j] == "/") {
              push(stack, (o1 / o2))
            } else if (split_expr[j] == "%%") {
              push(stack, (o1 %% o2))
            } else {
              stop("Invalid operator, choose +, -, *, /, %%")
            } 
        }
    }
     return(paste("The result is:", pop(stack)))
}
 
#Driver code
expr = "+ 9 * - 2 5 + 3 2 ]"
unlist(strsplit(base::trimws(expr), " "))
print(evaluate_prefix(expr))

push <- function(input_vector, values) {
  assign(as.character(substitute(input_vector)), c(input_vector, values), parent.frame())
  invisible()
  }

pop <- function(input_vector) {
  if(length(input_vector) == 0) {
    return(NA)
  }
  pop_output <- input_vector[length(input_vector)]
  assign(as.character(substitute(input_vector)), input_vector[-length(input_vector)], parent.frame())
  return(pop_output)
}
