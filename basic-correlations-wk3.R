

library(foreign)                             #Enables use of foreign package
library(ggplot2)
library(GGally)


academicData1 <- read.spss(file="~/psy_621/assignment_3/Lesson 31 Exercise File 1.sav", to.data.frame=T)
academicData2 <- read.spss(file="~/psy_621/assignment_3/Lesson 31 Exercise File 2.sav", to.data.frame=T)

#Now that we've read the data in here, let's do some analysis.

pairs(academicData1)
# While I don't often recommend using base graphics functions, this is a handy 
# function that displays a chart of scatter plots -- very nice if you're looking
# to do a brief visual analysis of several different continuous vectors in a 
# dataframe.

ggpairs(academicData1)
#There is, however, a very nice ggplot2 equivalent, but it requires the package
#"GGally". This is a package with some ggplot2 helper functions -- install this
# package if it isn't already on your system.  If we had a factor, such as
# gender, we could easily add some colour to this chart. This is provides us with
# both a visual and numeric correlational analysis.

cor(academicData1)
# If you need only the Pearson PM correlations, then this function will get you
# there.  What is the type (i.e., class) of the resulting array?  How would you 
# test to see whether these correlations are significant?
#
#
#
#
#
#
#
#
#
#
#
# Keep going!
#
#
#
#
#
#
#
#
#
#

with(academicData1, cor.test(NUM_PUBS, CITES))
# What is happening here? Comment specifically on the the use of with() and its
# argument structure.  What is the first argument?  The second?
#
# Comment on Pearson's Product Moment Correlation Coefficient and its relation to
# the covariance operation.
#
#
# Within our data set, we have a number of different variables that we might want
# to correlate with each other; however, the amount of correlations increases 
# very quickly with each variable. We can, however, automate it!
#
# This is where we get to use those notorious things, for() loops! In the first
# few tiems of trying to learn programming, for loops were a major stumbling
# point.  for() loops are simply a way of doing something to all elements of
# vector (or potentially another type of data structure).

x <- c(1:10)
# Storing this vector of allows for a sort of limite on the number of times the 
# loop will run.

for (i in x){                            # For each i in x
  print(sprintf("This is i: %d\n", i)    # Do this command)
  i <- i + 1                             # Increment i
}

# Bad example much too abstract and C-like

for (publications in academicData1$NUM_PUBS){ 
  print(publications)
}

# What has happened here? This is a rather silly example  -- why is that?
#
#
#
#
#
#
#
#
#
#
#
#
#
#
# The previous for() loop has a similar effect to simply entering:

academicData1$NUM_PUBS

# There are, however, differences. The for() loop prints each faculty member's
# number of publications as a 1 x 1 vector on each line. Entering the vector
# directly into console/prompt displays the publication number in a 50 x 1
# vector.
#
# A neat thing about for() loops is that the publications is an arbitrary name
# in the loop. We could replace it with 'pubs', 'p', 'fnord',  or 'i' -- whatever you
# like!

colnames <- names(academicData1)            # Assigns column names to a variable
iterations <-  c(1:length(colnames))        # Determines how many times we run
                                            # the loop. More after the loop.

for (i in iterations){                      # For each i(tem) in iterations
    print(colnames[i])
    print(mean(academicData1[ , i]))
    print(sd(academicData1[ , i]))
    print(paste("Iteration:", i))
}

# Let's break this down line by line. In 110, we need to set the number of times
# the loop will run. By measuring the length of the names of the columns, we can
# determine this. I hope 'why' exactly this is will become more apparent. 
#
# In 113 is the for() loop declaration -- as stated above, 'i' is an arbitrary
# variable.
#
# In 114 is the first command executed in the loop. It prints out the element of
# 'colnames' specified by 'i' -- e.g., colnames[1], colnames[2], and so on.
#
# Line 115 prints a function we've already seen -- mean(). In R, it is sometimes
# possible to nest functions like this. For instance, here, we are taking the
# mean of one column in the dataframe 'academicData1'. Instead of accessing the
# data in each column with it's English name (e.g. CITES), we use R's capability
# to specify it like acadmicData[ , 1].
#
# Line 116 does a similar thing with sd().
#
# Line 117 is a bit strange. We need to concatenate a string with an integer and
# print it out to the the console. To do this, you can use paste(). It doesn't
# have a fixed argument structure, so you may want to experiment with it or look
# at examples of paste() usage.
#
# Now that we've gone through this for() loop, describe the output.
#
#
#
#
#
#
# One fantastic thing about computes is how they allow for repeated use of 
# sequences of operations. For instance, sd() is a sequence of calculations that
# comes predefined. We can define ouor own functions in R! Yay!
#
# Here's how we do that to the previous sequences.

meanAndSD <- function(dataframe){ 
    colnames <- names(dataframe)            # Assigns column names to a variable
    iterations <-  c(1:length(colnames))        # Determines how many times we run

    for (i in iterations){                      # For each i(tem) in iterations
        print(colnames[i])
        print(mean(dataframe[ , i]))
        print(sd(dataframe[ , i]))
        print(paste("Iteration:", i))
    }
}

# As is evident, much of the code is the same as that above. However, now we
# have defined a function. Enter it into the console and call it on the dataframe
# have been using:

meanAndSD(academicData1)


# Perhaps the most mysterious parts of the function declaration exist in the 
# first line. 'meanAndSD' is the name of the function. What is in the function()
# portion, 'dataframe', is another placeholder name. Putting 'dataframe' there
# tells the function to expect a single argument, but the name itself does not
# have any effect on the function. I find it useful to give meaningful names to
# arguments like this. For instance, one could put in 'einneerwww', and so long
# as that exact sequences goes wherever 'dataframe' is within our function, it
# would work. Try it to prove it to yourself.

# Now we'll want some graphics that are more specific than the ggpairs() function
# provides. We'll use the academicData2 set for this.

for (i in iterations){ 
    for (j in i:length(iterations)){ 
        if (i == j) next

        print(cor.test(academicData1[ ,i], academicData1 [ , j]))
    }
}
#
p <- ggplot(academicData2, aes(x = HISTGPA, y = SCIENGPA))
# What is happening here?  Why store the base plot in a variable?

p + geom_point()
# Yay!  Now we've added some points to the plot. Still, though, it would be nice
# to have some more information, such as a line that models the correlation 
# between the two variables

p + geom_point() + geom_smooth(method = "lm")
# This command does just that! geom_smooth() portion of the command is what does
# this. What do you notice about the 'method' argument? What happens if you
# leave it out entirely? Research what this method of smoothing is.
# 

socHistCor <- with(academicData2, cor(SOCGPA, HISTGPA))

p + geom_point() + geom_smooth(method = "lm") + annotate("text", label =
                                                         paste("r = ", round(socHistCor, 4)), 
                                                               x = 0.75, y = 2)

# Describe what is happening here. NB the use of paste() in this graphing
# command. Why do we need to use it?

academicData2 <- within(academicData2, { 
       mathSciAvg <- (MATHGPA + SCIENGPA) / 2
       socHistAvg <- (SOCGPA  + HISTGPA) / 2
})

# This is another way to work with a dataframe to add variables. Sometimes this
# can be a better way to do these manipulations without having to use the '$'
# Now, construct a ggplot2 scatter plot of the new averages.
#
#
#
#
#
#
#
#
#

p2 <- ggplot(academicData2, aes(x = mathSciAvg, y = socHistAvg))
# Here is the base plot. Add the appropriate geom(s) to get a scatter plot with
# a line of best fit.
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
p2 + geom_point() + geom_smooth(method = "lm") + ylab("Social Studies and History Avg GPA")
# For production purposes, it is useful to label your axes and graphs.  The above
# command shows how to add one to the y-axis. How do you suppose one could do so
# for the x-axis?  Find out how to add a title to a ggplot.




