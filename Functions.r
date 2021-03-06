# Read the latest vesrion of the covid data.
covid_data <- read.csv("https://covid.ourworldindata.org/data/owid-covid-data.csv")


# Exploring

str(covid_data)

range(covid_data$date)

# Some Ajustments are needed

covid_data$date <-as.Date(x = unlist(covid_data$date), format = "%Y-%m-%d")

covid_data$continent <- factor(covid_data$continent)

covid_data$location <- factor(covid_data$location)

# the makePlot function makes a presentation-ready plot of a given
# country and variable.

makePlot <- function( country ,  variable = "new_cases"  ) {
    
    # Create the table containing only the data for the choosen country 
    
    plottingData <- covid_data[covid_data$location == country,]
    
    # Create the plot for the choosen variable againt the date.
    
    library(ggplot2) 
    
    ggplot(data = plottingData, aes(x = date , y = plottingData[,variable])) + 
        geom_point(color = "Red" , size = I(3) ) + 
        
        #setting some themes and ajustments for the plot to be ready.
        
        ylab(gsub(pattern = "_" , replacement = " " , x = variable)) + 
        ggtitle(label =  gsub(pattern = "_" , replacement = " " , x = variable),     
                subtitle = paste(country , "Covid-19")
        )     +
        
        theme(plot.title = element_text(hjust = 0.5),plot.subtitle = element_text(hjust = 0.5))
    
}


makePlot("Tunisia",variable = "new_deaths_per_million")
makePlot("India",variable = "new_deaths_per_million")
makePlot("France",variable = "new_deaths_per_million")


# The Comparison plotting Function 

comparePlots <- function(vector_of_countries , variable = "new_cases" , facets = T){
    
    if( facets == T ) {
        library(ggplot2)
        plottingData <- covid_data[covid_data$location %in% vector_of_countries,  ]
        ggplot(data = plottingData , aes(x = date , y = plottingData[,variable] , color = location))+
            geom_point() + 
            facet_wrap(facets = plottingData$location)+
            ylab(gsub(pattern = "_" , replacement = " " , x = variable)) + 
            ggtitle(label =  gsub(pattern = "_" , replacement = " " , x = variable),     
                    subtitle = "Covid-19"
            )     +
            
            theme(plot.title = element_text(hjust = 0.5),plot.subtitle = element_text(hjust = 0.5))
        
        
    } else {
        plottingData <- covid_data[covid_data$location %in% vector_of_countries,  ]
        ggplot(data = plottingData , aes(x = date , y = plottingData[,variable]  , color = location))+
            geom_point() + 
            ylab(gsub(pattern = "_" , replacement = " " , x = variable)) + 
            ggtitle(label =  gsub(pattern = "_" , replacement = " " , x = variable),     
                    subtitle = "Covid-19"
            )     +
            
            theme(plot.title = element_text(hjust = 0.5),plot.subtitle = element_text(hjust = 0.5))
    }
    
    
    
    
    
}


comparePlots(c("Tunisia","Germany","Italy"),variable = "new_deaths_per_million" , facet = F)
comparePlots(c("Tunisia","Germany","Italy"),variable = "new_deaths_per_million" , facet = T)

# The distinguish a country from a continent function.

distinguishFrom <- function(country , continent , variable) {
    
    
    fromData <- covid_data[covid_data$continent == continent,]
    distgData <- covid_data[covid_data$location == country,]
    
    library(ggplot2)
    
    ggplot(data = fromData, aes(x = date , y = fromData[, variable])) +
        
        geom_point(color = "Red", size = I(3) , alpha = 0.3)  +
        
        geom_point(data = distgData , 
                   aes(x = date , y = distgData[, variable]), 
                   color = "Blue" ,
                   size = I(3) , alpha = 0.6 ) + 
        
        
        ylab(gsub(pattern = "_" , replacement = " " , x = variable)) +
        ggtitle(label =  gsub(pattern = "_" , replacement = " " , x = variable),
                subtitle = paste(country , continent , sep = " relatively to ") ) +
        
        theme(plot.title = element_text(hjust = 0.5),plot.subtitle = element_text(hjust = 0.5))
    
    
}

distinguishFrom(country = "Tunisia",continent = "Africa",variable = "new_cases")
distinguishFrom("Tunisia", continent = "Africa" , variable = "new_deaths_per_million")


































