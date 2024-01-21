#### Preamble ####
# Purpose: Tests... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(ggplot2)
library(dplyr)
library(tidyverse)
library(scales)

#### T ####
data <- read_csv("outputs/data/analysis_data.csv")
colnames(data)
## Grouped Barplot
### total income 
ggplot(data, aes(fill=category, y=Funds_remaining, x=scenario)) + 
  geom_bar(position="dodge", stat="identity", ) +
  scale_fill_grey(start = 0.25, end = 0.75)
##total expenditure 
ggplot(data, aes(fill=category, Total_expenditure, x=scenario)) + 
  geom_bar(position="dodge", stat="identity", ) +
  scale_fill_grey(start = 0.25, end = 0.75)
#percentage of income required for rent
ggplot(data, aes(fill=category, y=percent_income_rent, x=scenario)) + 
  geom_bar(position="dodge", stat="identity", ) +
  scale_fill_grey(start = 0.25, end = 0.75)
#percentage of income required to purchase healthy food
ggplot(data, aes(fill=category, y=percent_income_requiredforhealthfood, x=scenario)) + 
  geom_bar(position="dodge", stat="identity", ) +
  scale_fill_grey(start = 0.25, end = 0.75)
