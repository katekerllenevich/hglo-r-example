rm(list=ls())
setwd("~/Documents/UMD/HGLO101/Codings/coding12")

library(ggplot2)
library(dplyr)
library(readr)

data <- read_csv("data.csv")

## filtering data
new_data <- data %>%
  filter(year == "2011")

## bar chart
new_data$cn <- factor(
  new_data$cn,
  labels = c("Australia", "Honduras", "Israel")
)

graph1 <- ggplot(new_data, aes(x=cn, y=gdp, fill=cn)) +
  geom_col() +
  labs(
    x = "Country",
    y = "GDP",
    title = "GDP by Country in 2011"
  ) +
  guides(fill = "none")

## line graph
data$cn <- factor(
  data$cn,
  labels = c("Australia", "Honduras", "Israel")
)

graph2 <- ggplot(data, aes(x=year, y=gdp, color=cn)) +
  geom_line() +
  labs(
    x = "Year",
    y = "GDP",
    color = "Country",
    title = "GDP over time by Country"
  )

graph3 <- ggplot(data, aes(x=year, y=gdp, color=cn)) +
  geom_point() +
  labs(
    x = "Year",
    y = "GDP",
    color = "Country",
    title = "GDP over time by Country"
  )