##########################################################################
# Copyright, 2014, Arianna Morgan                                       ##
########################################################################## 
## The programmes in this repository are free software: you can         ##
## redistribute them and/or modify them under the terms of the GNU      ##
## General Public License as published by the Free Software Foundation, ## 
## either version 3 of the License, or (at your option) any later       ##
## version.                                                             ##
##                                                                      ##
## These program are distributed in the hope that they will be useful,  ##
## but WITHOUT ANY WARRANTY; without even the implied warranty of       ##
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the        ##
## GNU General Public License for more details.                         ##   
##########################################################################

library(foreign)               # Enables the use of the foreign pack.
                               # require() will also work

library(psych)                 #Enables the use of another package we will need

# Now it's time to read some data files into R! This can be accomplished with
# a variety of read() functions. The comments immediately below each command
# explain them.

exams <- read.spss(file="~/psy_621/assigment_2/exam2.sav", to.data.frame = T)
# This line reads your .sav (the spss file format) and stores it in the variable
# exams.  You should replace the file= " " argument with the path to your
# own copy of the file. This tells R where the file is on your machine. The 
# argrument coerces the resulting object to a dataframe.  Not setting this 
# option to T results in a list, which is harder to work with in R. 
#
# A common mistake in this step of the process is to forget the quotation marks:
# If for some reason you can't get the file to load, check your quotes. This is
# file we will be working with for (most) of the rest of this script. If you get
# an error reading this file into R, check to see if it is actually in your 
# workspace, because it may not matter

myCSV <- read.csv(file="/path/to/file.csv", head=T)
#This is an example of how to read a comma separate value (CSV) file. Again, the
# file path MUST be quoted. You will also notice a second argument of the
# function: 'head'. The 'head' option tells R that you want it to treat the
# first row of the csv as the labels for the columns. Sometimes it can be easier
# convert SPSS files into CSVs and work with them that way.

describe(exams$grade)
# This function provides basic descriptive statistics about the specified vector.
# In order to columns of a data.frame, the df's name must be followed by the '$'
# and the name of the column

mean(exam$grade)
# The above line calls mean on the specified vector. Do this with some other
# descriptive statistic (e.g. standard deviation or variance). If it's not obvious
# how to this, use DuckDuckGo to find out how.

with(exams, describe(grade))
# There is another way to achieve the same results: with(). This function allows
# the ability to use just the column headings in the specifications. You'll
# notice that there are no '$'s in this call. with() takes two arguments: the
# first is the data frame within which to operate, and two is the function one
# wishes to evaluate. Notice too, that the second argument of with() takes its
# own argument

describe(exams)
# What happens when you call describe on the whole data frame?


describeBy(exams$grade, group = exams$sex)
# Let's break the use of this down. The describeBy() function comes from the
# psych package we loaded in earlier. It may be helpful to look at describeBy's 
# documentation page. The elements separated by commas (in this case at least)
# are called 'arguments' -- these are the elements that the function needs to
# operate.  In this call there are 2 arguments -- what are they?  What happens
# when you call this function?

########
# EC   #
########
# Restructure the previous function call so that you don't have to use the ' $'
# symbol. Hint: use with().




# No peaking!






with(exams, describeBy(exams, group = sex))
# This handy function does the same thing as the last one!  That is to say, it
# provides descriptive statistics for each of the variables, but it divides the
# output into 2 groups -- one for males and another for females! Very cool.  
#
# However, there is anothere issue in this data set -- not everyoen has a grade.
# Why is this?  How can it be addressed?

###############################################################################

# Now that we've doen a little descriptive statistical analysis, let's do some
# graphing. I really, really think ggplot2 is the way to go.  It's what is called
# a high-level library -- it abstracts a bit a way from the particulars of 
# setting needed for setting up the plotting environment. If you end up really
# needing to work with lattice, you'll probably be at a stage where it won't be
# so hard to use.

library(ggplot2)
# Imports the ggplot2 package

ggplot(exams, aes(x = sex, y = grade)) + geom_boxplot()
# ggplot() is the main function from the ggplot2 package. The main function is a
# little bit strange. The first argument is the data frame where your data 
# reside. The second is the aes() function. This is the 'aesthetic mapping'
# function. It's used to assign variables to axes on graphs, as well as other
# sorts of visual effects like colour, linetype, dot type, etc.
#
# Run this and see what happens.  You can save the result from the right panel
# in RStudio, if you'd like.
#
# What do the whiskers on the boxplot mean?  What does it mean that the female
# box is more stretched out than the male?

ggplot(exams, aes(x = sex, y = grade)) + geom_boxplot(aes(fill = sex))
# This addition of aes(fill = sex) to the boxplot specification automatically
# files in the colours of each category.

p1 <- ggplot(exams, aes(x = sex, y = grade)) 
p1 + geom_boxplot(aes(fill = sex))
# Explain what you think is going on here. Why might this be useful?

###############################################################################
# Now we're going to play with a bit of categorical data.


demog <- read.spss(file="~/psy_621/assigment_2/demographs.sav", to.data.frame = T)
# This makes a new data frame for us to work with.

str(demog)
# I love the str() function because it tells so much about the structure of your
# vector/matrix/dataframe. You can learn the type of each column and learn the 
# object's size. What are the types of the columns of the data.frame?  Compare 
# the types of 'exams' and 'demog'.

summary(demog)
# The summary() function is quite useful. This function can be called on a
# variety of data types. Try using both str() and summary() on new objects that
# result from reading in .sav and .csv files.

p2 <- ggplot(demog, aes(x = gender))
p2 + geom_histogram()
# This pair of statements output a ggplot histogramme! How can we change the
# colour of the bars? Remember the aesthetic mapping function!

p2 + geom_histogram(aes(fill = educ))
# Here's a neato trick with fill.  Fill allows for more information to be
# in histogrammes and other types of bar graphs.

p3 <- ggplot(demog, aes(x = educ))
p3 + geom_histogram(aes(fill = gender)) + coord_flip()
# Here, the x variable and the fill have been switched up, leading to a more
# readable graph.  The final argument, coord_flip() turn the graph on its side!

########
# EC   #
########
#
# Having seen some of how one constrcts graphs with ggplot2, describe the syntax
# of a ggplot2 command.
#
# A fantastic resource for ggplot2's geom_bar can be found at:
# http://docs.ggplot2.org/current/geom_bar.html). This is a portion of the
# ggplot2 book that it's author, Hadley Wickham, has put online. Use this page
# to construct other graphs with the histogram or bar geoms. 
#
# Another useful exercise would be to use ggplot2's facet feature to display two
# separate graphs.  For instance, one could output a graph of education for both
# men and women. Research facet_wrap() to learn how to do this.
