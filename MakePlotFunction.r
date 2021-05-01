# Reading Data 

covid_data <- read.csv("C:/Users/Hamza/Desktop/COVID_R/dataset/2020-01-01_2021-04-28-covid-data.csv")

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
                ylab(gsub(pattern = "_" , replacement = " " , x = variable)) + 
        ggtitle(label =  gsub(pattern = "_" , replacement = " " , x = variable),     
                      subtitle = paste(country , "Covid-19")
                )     +
                
                theme(plot.title = element_text(hjust = 0.5),plot.subtitle = element_text(hjust = 0.5))
              
}

# Testing 

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


































