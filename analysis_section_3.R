library(wbstats)
library(dplyr)
library(ggplot2)
library(tidyr)
library(maps)
library(mapproj)
library(knitr)


#####################
#### QUESTION 1 #####
#####################


bitcoin <-  read.csv("www/Binance_BTCUSDT_d.csv", stringsAsFactors = FALSE)
ethereum <- read.csv("www/Binance_ETHUSDT_d.csv", stringsAsFactors = FALSE)

high_low_price_bitcoin <- select(bitcoin, Date, High, Low)
high_low_price_bitcoin <- filter(high_low_price_bitcoin, High != 0, Low != 0)
high_low_price_ethereum <- select(ethereum, Date, High, Low)
high_low_price_ethereum <- filter(high_low_price_ethereum, High != 0, Low != 0)

meanCal <- function(year, coinType) {
  if(coinType == 1) {
    high_low_price_bitcoin <- filter(high_low_price_bitcoin, startsWith(Date, year))
    high_low_price_bitcoin <- mutate(high_low_price_bitcoin, difference = High - Low)
    return(as.character(mean(high_low_price_bitcoin$difference)))
  } else {
    high_low_price_ethereum <- filter(high_low_price_ethereum, startsWith(Date, year))
    high_low_price_ethereum <- mutate(high_low_price_ethereum, difference = High - Low)
    return(as.character(mean(high_low_price_ethereum$difference)))
  }
}

high_low <- function(year, coin_type) {
  if(coin_type == 1) {
    high_low_price_bitcoin <- filter(high_low_price_bitcoin, startsWith(Date, year))
    bitcoin_comparison <- ggplot(data = high_low_price_bitcoin) +
      geom_point(mapping = aes(x = Date, y = High, colour = "High"), color = "Blue", alpha = .5) +
      geom_point(mapping = aes(x = Date, y = Low, colour = "Low"), color = "Red", alpha = .5) +
      labs(
        title = "High and Low Price for Bitcoin",
        x = "Date",
        y = "Value in USD"
      ) +
      theme(axis.text.x=element_blank())
    return(bitcoin_comparison)
  } else {
    high_low_price_ethereum <- filter(high_low_price_ethereum, startsWith(Date, year))
    ethereum_comparison <- ggplot(data = high_low_price_ethereum) +
      geom_point(mapping = aes(x = Date, y = High, colour = "High"), color = "Blue", alpha = .5) +
      geom_point(mapping = aes(x = Date, y = Low, colour = "Low"), color = "Red", alpha = .5) +
      labs(
        title = "High and Low Price for Ethereum",
        x = "Date",
        y = "Value in USD"
      ) +
      theme(axis.text.x=element_blank())
    return(ethereum_comparison)
  }
}