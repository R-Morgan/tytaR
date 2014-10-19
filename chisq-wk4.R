

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


id <- rep(1:130) 

mathLvl <- c(rep(0, 21), rep(1, 9), rep(0, 92), rep(1,8))
mathLvl <- factor(mathLvl, levels = c(0, 1), labels = c("noAdvMath", "someAdvMath"))

parent <- c(rep(0, 30), c(rep(1, 100)))
parent <- factor(parent, levels = c(0, 1), labels = c("father", "hetCouple"))

math.df <- data.frame(id, mathSkill, parent)
# These functions are how we can create some data to work with in addition to 
# the matrix assembled above.  
#
# Before launching into an explanation of the code, it is worth discussing the
# set of habits that are useful to cultivate when coding. First, read the 
# documentation. You should be looking at R's internal set of function help files
# frequently. Few coders can hold every single function they need in memory and
# remember all the nuances of each one's argument structure. I frequently code 
# with a documentation page open. Similarly, sites such as StackOverflow are a 
# great resource for understanding error messages.

#################
#VISUALISATION  #
#################
#
# Now that the data are in a couple of useful formats, it's time for exploratory
# data analysis. However, it's 

p <- ggplot(math.df, aes(x = mathLvl)) 
p + geom_bar(aes(fill = parent))

math.rs <- rowSums(math.df)



chisq.test(math, correct = F)
# The moment we've all been waiting for, the actual Chi Square Test!  What does
# it mean that the test is significant?
#


