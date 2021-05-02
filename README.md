# Covid-19 Data Analysis

This repository will contain Covid-19 Analysis conducted by me using R programming.

the data was downloaded from this site https://ourworldindata.org/coronavirus-source-data


## First task 

My first task will be to create functions easy to use in order to avoid repetetion of the ggplot routine, 
for visualizing data change over time for a given variable and a given country (or countries).

# - makePlot(country,variable) : 

makePlot() is a function that takes an arbitrary country and a vraiable ( new_cases , new_deaths , total_cases...)  and return a presentation-ready plot of that variable over time(date)

# - distinguishFrom(country , continent , variable)

the distinguishFrom function take as argument a country a continent and a variable, and produceses a scatter-plot of the variable over time for the given continent in 'Red' and for choosen country in 'Blue' so you can distinguish a country from it's continent.

# - comparePlots(countries , variable ) 

The comparePlots is my favorite. it's a function that takes a vector of countries as input and the variable you want to compare, and produces a facet scatter-plot showing the given countries changes over time of the choosen variable.  there is also a third argument to this functions which is facets and it's set to true,
if you want to see the two(or more) countries data in one plot, you can set factes = FALSE, and that's all.


you will find a file named functions.r in this repo which contain the code for these 3 function and a furthermore explanation of the usage of the functions.

