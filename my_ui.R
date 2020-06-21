# install.packages("shiny")
library("shiny")
# install.packages("ggplot2")
library("ggplot2")
#install.packages("shinythemes")
library("shinythemes")

Home <- tabPanel(
  icon("home"),
  fluidRow(column(tags$img(src="bitcoin.jpg", width="200px",height="260px"),width=2),
           column(
             h4(p("Our projects looks to investigate the trends of cryptocurrency. Cryptocurrency is a digital 
               form of money/currency. In simple terms, it only has an electronic form. Like regular money, it 
               may be bought,traded, or accepted as payment, but it can also be mined. Cryptocurrency is mined 
               in a process in which transactions for the currency are verified, then added to the blockchain, 
               a constantly-growing database that exists on multiple computers at the same time. We seek to 
               investigate the 2 biggest cryptocurrencies (together they comprise over two thirds of market 
               share in June 2019): Bitcoin and Ethereum. We believe examining the most popular currencies 
               would allow us to spot trends of cryptocurrency in general. Currency usage in human civilization 
               has shifted from barter trading, to universal monetary standards such as the dollar, to recent 
               usage of cryptocurrency in many markets. Therefore, it could be interesting to examine what many 
               coin as the next big thing for currency's evolution.", 
                  style="text-align:left;color:black;background-color:lavender;padding:15px;border-radius:10px")),
             width = 8
           ),
           column(tags$img(src="ethereum.jpg", width="200px",height="260px"),width=2)),
  hr(),
  p(
    "We analyzed two historical datasets that span from 2017 to 2020, one each for the Bitcoin and Ethereum currencies.
    The data sets consist of daily prices, transactions, and volume. It was collected by data scientists and researchers
    at CryptoDataDownload, and has been updated daily since 2017. We previously used this data to create a data report, 
    which is linked below along with the links for the data sets.",
    br(),
    a("Bitcoin Data Set, ", href = "https://www.cryptodatadownload.com/cdd/Binance_BTCUSDT_d.csv"), 
    a("Ethereum Data Set, ", href = "https://www.cryptodatadownload.com/cdd/Binance_ETHUSDT_d.csv"),
    a("Data Report ", href = "https://info201a-wi20.github.io/project-report-samyakUW/")
  ),
  p(
    h3("Target questions:"), style="text-align:center"
  ),
  fluidRow(
    column(width = 1),
    column(
      h5(p("1. How do the values of cryptocurrencies Bitcoin and Ethereum change in comparison to their trading 
      volumes? This is significant as strong trends in both value and volume may be indicators of the rise 
      of digital currency as a replacement for the universal-standard physical currency we have today. Our 
      2 datasets for Bitcoin and Ethereum both contain multiple features each for value and volume that can
      represent them."),
         p("2. How do the price values of Bitcoin and Ethereum compare with each other over time? Bitcoin and 
      Ethereum are the 2 biggest currencies, and we look to examine if their price trends are related in 
      some way. As Bitcoin and Ethereum comprise a large amount of the cryptocurrency market share, this 
      could suggest trends for cryptocurrency itself, since price is influenced by things such as supply and 
      demand. Our datasets for the currencies have multiple features for measuring price value, but we will 
      use the feature Close that captures prices when the market closes for the day."),
         p("3. How do the trading volumes of Bitcoin and Ethereum compare with each other over time? Volume 
      represents, among other things, potential and interest in the currency. For example, if we see that 
      both currencies have increasing volume over time, we may believe that cryptocurrency may be getting 
      more popular, and that we may see even more investment in the near future. Our datasets for Bitcoin 
      and Ethereum have 2 features that measure volume, 1 for USD and 1 in terms of their own currency 
      (BTC/ETH). The USD feature was used as it would make more sense to an audience that likely has more 
      knowledge of USD than knowledge of cryptocurrency")), 
      width=10, style="text-align:justify;background-color:papayawhip;border-radius:10px"
    )),
  hr(),
  
  tags$style(".fa-database {color:#E87722}"),
  h3(p(em("Bitcoin Dataset "),icon("database",lib = "font-awesome"),style="color:black;text-align:center")),
  fluidRow(column(DT::dataTableOutput("RawDataBitcoin"), width = 12)),
  hr(),
  tags$style(".fa-database {color:#E87722}"),
  h3(p(em("Ethereum Dataset "),icon("database",lib = "font-awesome"),style="color:black;text-align:center")),
  fluidRow(column(DT::dataTableOutput("RawDataEthereum"), width = 12))
)

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