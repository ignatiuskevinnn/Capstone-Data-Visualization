# Memanggil Library
library(shiny)
library(shinydashboard)
library(flexdashboard)
library(dplyr)
library(lubridate)
library(ggplot2)
library(scales)
library(plotly)
library(glue)

# Import Data
ramen <- read.csv("data/ramen-ratings.csv")
ramen[,c("Style", "Country", "Stars")] <- lapply(ramen[, c("Style", "Country", "Stars")], as.factor)

# Data Top 10 Country with Most Ramen Brand
ramen10 <- ramen %>% 
  group_by(Country) %>% 
  tally %>% 
  arrange(desc(n)) %>% 
  slice(1:10)

# Data 5 Stars Ramen Packaging Style
ramen5 <- filter(.data = ramen, Stars == "5")
ramenstyle <- ramen5 %>% 
  group_by(Country)

# Tema Visualisasi
theme_algo <- theme(
  panel.background = element_rect(fill = "white"),
  panel.grid.major = element_line(colour = "white"),
  plot.title = element_text(family = "", 
                            size = 20, 
                            color = "Black")
)

theme_algo2 <- theme(
  panel.background = element_rect(fill = "White"),
  panel.grid.major = element_line(colour = "White"),
  panel.grid.minor = element_blank(),
  plot.title = element_text(family = "", 
                            size = 20, 
                            color = "Black")
)
