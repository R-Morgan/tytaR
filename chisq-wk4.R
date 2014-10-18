

#math <- data.frame(parent = c(rep(0, 30), rep(1, 100)), math = c(rep(0, 113), rep(1, 17)))

math <- matrix(c(21, 9, 92, 8), nrow = 2, byrow=T)
# Construct a matrix with the totals of each category. What is the difference
# between a matrix and dataframe in R? Try using the str() function a dataframe
# and a matrix. 

dimnames(math) <- list(c("Primarily Father", "Mother and Father"), 
                       c("No advanced Math", "Some Advanced Math"))

# This is a way to give names to each column and row in the matrix. The syntax
# here is a bit strange. You must call dimnames on the matrix, and then assign
# a list that consists of vectors of strings to those dimnames.
