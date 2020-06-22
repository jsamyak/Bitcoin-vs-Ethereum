library("shiny")
library("ggplot2")
library("dplyr")
library("DT")

source("analysis_section_3.R")

server <- function(input, output) {
  output$highLowAnalysis <- renderPlot({
    high_low(as.character(input$year1), input$coinType1)
  })
  
  output$priceAnalysis <- renderPlot({
    coinTypeTemp1 <- paste(input$coinType2, collapse = ", ")
    price(as.character(input$year2), coinTypeTemp1)
  })
  
  output$volumeAnalysis <- renderPlot({
    coinTypeTemp2 <- paste(input$coinType3, collapse = ", ")
    volume(as.character(input$year3), coinTypeTemp2)
  })
}

