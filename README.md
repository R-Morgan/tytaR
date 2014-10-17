tytaR is my R teaching/tutoring repository. 'Tytar' is a Finnish-English
bilingual pun. Currently, the intended audience is anyone taking Portland State
University's PSY 621, Univariate Statistics class. 

Very special thanks to Joel Steele, Todd Bodner, and Wendy Viola, who developed
the materials that inspired these lessons. These lessons were extremely helpful
when I was learning R. I have drawn heavily on Steele et al.'s lessons; however,
there are some significant differences in these lessons from the original.

I have also been heavily inspired by Zed A. Shaw's Learn Code the Hard Way,
approach. At the heart of my programming teaching philosophy is the idea that
the sooner new users are practicing the act of programming, the easier it will
be to learn. To this end, I have reserved comments on particular functions until
after the command -- I suggest running each command, trying to figure out what
they do, then reading the explanatory comment. My approach differs from Shaw's,
at least for this project, because of the nature of R. R is a  high-level,
speciality language, so one will rarely do system's programming with it. I have
never used a main() in R, nor have I written programmes in the way I would in
Haskell, Python, or C. R is so interactive that I am trying out this experimental
method.

1) I have elected to construct most of the graphs with Hadley Wickham's excellent
ggplot2 library. While lattice is an amazing and powerful graphing library, I 
strongly believe that using a higher level library will help new statisticians
and programmers making elegant graphs more quickly.  Many colleagues who have 
tried to learn R have found lattice to be a bit difficult to work with because
of how much specification is necessary to construct even basic graphs.

2) I use the <- as the assignment operator, rather than the '='. This is a tiny
difference that does not make a huge difference in the actual operation of the
commands, but it is considered the stylistically correct way to to this by the
R-tian community.

3) I am *ridiculously* explicit about the parts of many lines of code in here.
There is around a 5 to 1 ratio of explanation to code. Experienced programmers
may find this off-putting. To this I say, tough. If you already can programme,
this is not necessarily the best learning materials for you. The intended
audience, students taking social-science oriented quantitative analysis courses
at PSU, are generally not programming already. 
