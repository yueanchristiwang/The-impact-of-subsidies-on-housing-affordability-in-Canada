#### Preamble ####
# Purpose: Downloads and saves the data from [https://open.toronto.ca/dataset/cost-of-living-in-toronto-for-low-income-households/]
# Author: Yuean Christi Wang
# Date: 18 January 2024
# Contact: yuean.wang@mail.utoronto.ca
# License: MIT
# Pre-requisites:
# Any other information needed?


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(dplyr)

#### Download data ####

# get package
package <- show_package("52182614-1f0b-42be-aca4-3f86dc8e004c")
package

# get all resources for this package
resources <- list_package_resources("52182614-1f0b-42be-aca4-3f86dc8e004c")
# identify data store resources; by default, Toronto Open Data sets data store resource format to CSV
datastore_resources <- filter(resources, tolower(format) %in% c('csv'))
# load data
#data1 = with subsidies 
data1 <- filter(datastore_resources, row_number()==1) %>% get_resource()
#data2 - without subsidies, average rent
data2 <- filter(datastore_resources, row_number()==2) %>% get_resource()
#data3 - without subsidies,market rent
data3 <- filter(datastore_resources, row_number()==3) %>% get_resource()

#### Save data #### 
write.csv(data1, "inputs/data/2022_Income Scenario_With Subsidies.csv")
write.csv(data2, "inputs/data/2022 Income Scenario - Without Subsidies, Average Rent.csv")
write.csv(data3, "inputs/data/2022 Income Scenario - Without Subsidies, Market Rent.csv")

