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

# Now it's time to read some data files into R! This can be accomplished with
# a variety of read() functions. The comments immediately below each command
# explain them.

demographs <- read.spss(file="~/psy_621/assigment_2/demographs.sav")
# This line reads your .sav (the spss file format) and stores it in the variable
# demographs.  You should replace the file= " " argument with the path to your
# own copy of the file. One common mistake in this step of the process is to
# forget the quotation marks -- if for some reason you can't get the file to
# load, check your quotes.

myCSV <- read.csv(file="/path/to/file.csv", head=T)
#This is an example of how to read a comma separate value (CSV) file. Again, the
# file path MUST be quoted. You will also notice a second argument of the
# function: 'head'. The 'head' option tells R that you want it to treat the
# first row of the csv as the labels for the columns.

