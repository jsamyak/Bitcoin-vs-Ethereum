# install.packages("shiny")
library("shiny")
# install.packages("ggplot2")
library("ggplot2")
#install.packages("shinythemes")
library("shinythemes")

my_ui <- shinyUI(
  fluidPage(
    theme = shinytheme("cerulean"),
    titlePanel("Analysing Different Factors that affect the Price of Cryptocurrencies"),
    h3("G7, Samyak Jain, Chris Ong, Minh tu Huynh"),
    navbarPage(
      "Trends in Cryptocurrencies!",
      Home,
      Question1,
      Question2,
      Question3, 
      Result
    )
  )
)