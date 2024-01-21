#### Preamble ####
# Purpose: Downloads and saves the data from [https://open.toronto.ca/dataset/cost-of-living-in-toronto-for-low-income-households/]
# Author: Yuean Christi Wang
# Date: 18 January 2024
# Contact: yuean.wang@mail.utoronto.ca
# License: MIT
# Pre-requisites:

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
data1 <- read_csv("inputs/data/2022_Income Scenario_With Subsidies.csv")
data2 <- read_csv("inputs/data/2022 Income Scenario - Without Subsidies, Average Rent.csv")
data3 <- read_csv("inputs/data/2022 Income Scenario - Without Subsidies, Market Rent.csv")

#removing unwanted rows
d1 <- data1[-c(0:12, 16,17), ]
d1a <- d1[,-1:-2]
# Rename column heads
colnames(d1a)

names(d1a)[names(d1a) == "Scenario.1..Family.of.Four..Ontario.Works" ] <- "S1"
names(d1a)[names(d1a) == "Scenario.2..Family.of.Four..Full.Time.Minimum.Wage.Earner"  ] <- "S2"
names(d1a)[names(d1a) == "Scenario.3..Family.of.Four..Median.Income" ] <- "S3"
names(d1a)[names(d1a) == "Scenario.4..Single.Parent.Household.with.2.Children..Ontario.Works" ] <- "S4"
names(d1a)[names(d1a) == "Scenario.5..One.person.Household..Ontario.Works"] <- "S5"
names(d1a)[names(d1a) == "Scenario.6..One.Person.Household..Ontario.Disability.Support.Program" ] <- "S6"
names(d1a)[names(d1a) == "Scenario.7..One.Person.Household..Old.Age.Security..Guaranteed.Annual.Income.Supplement" ] <- "S7"
names(d1a)[names(d1a) == "Scenario.8..Married.Couple..Ontario.Disability.Support.Program" ] <- "S8"
names(d1a)[names(d1a) == "Scenario.9..Single.Person.Household..Full.Time.Minimum.Wage.Earner" ] <- "S9"
#renaming first column and assigning row names
d1a[1, 1] = "Total_income"
d1a[2, 1] = "Average_Monthly_Rent_expense"
d1a[3, 1] = "Food_expense"
d1a[4, 1] = "Total_expenditure"
d1a[5, 1] = "Funds_remaining"
d1a[6, 1] = "percent_income_rent"
d1a[7, 1] = "percent_income_requiredforhealthfood"
d1b <- data.frame(d1a, row.names = 1)
#transpose the data
d1c <-as.data.frame(t(d1b))
colnames(d1c)
# add a column to show  subsidy status
d1c <- cbind(d1c,category='with subsidies')
d1d <- tibble::rownames_to_column(d1c, "scenario")
####data2 

#removing unwanted rows
d2 <- data2[-c(0:12, 16,17), ]
d2a <- d2[,-1:-2]
# rename columns
colnames(d2a)
# Rename column
names(d2a)[names(d2a) == "Scenario.1..Family.of.Four..Ontario.Works" ] <- "S1"
names(d2a)[names(d2a) == "Scenario.2..Family.of.Four..Full.Time.Minimum.Wage.Earner"  ] <- "S2"
names(d2a)[names(d2a) == "Scenario.3..Family.of.Four..Median.Income" ] <- "S3"
names(d2a)[names(d2a) == "Scenario.4..Single.Parent.Household.with.2.Children..Ontario.Works" ] <- "S4"
names(d2a)[names(d2a) ==  "Scenario.5..One.person.Household..Ontario.Works"] <- "S5"
names(d2a)[names(d2a) == "Scenario.6..One.Person.Household..Ontario.Disability.Support.Program" ] <- "S6"
names(d2a)[names(d2a) == "Scenario.7..One.Person.Household..Old.Age.Security..Guaranteed.Annual.Income.Supplement" ] <- "S7"
names(d2a)[names(d2a) == "Scenario.8..Married.Couple..Ontario.Disability.Support.Program" ] <- "S8"
names(d2a)[names(d2a) == "Scenario.9..Single.Person.Household..Full.Time.Minimum.Wage.Earner" ] <- "S9"
#renaming first column and assigning row names
d2a[1, 1] = "Total_income"
d2a[2, 1] = "Average_Monthly_Rent_expense"
d2a[3, 1] = "Food_expense"
d2a[4, 1] = "Total_expenditure"
d2a[5, 1] = "Funds_remaining"
d2a[6, 1] = "percent_income_rent"
d2a[7, 1] = "percent_income_requiredforhealthfood"
d2b <- data.frame(d2a, row.names = 1)
#transpose the data
d2c <-as.data.frame(t(d2b))
colnames(d2c)
# add a column to show  subsidy status
d2c <- cbind(d2c,category='Without Subsidies, Average Rent')
d2d <- tibble::rownames_to_column(d2c, "scenario")
####data3

#removing unwanted rows
d3 <- data3[-c(0:12, 16,17), ]
d3a <- d3[,-1:-2]
# rename columns
colnames(d3a)
# Rename column
names(d3a)[names(d3a) == "Scenario.1..Family.of.Four..Ontario.Works" ] <- "S1"
names(d3a)[names(d3a) == "Scenario.2..Family.of.Four..Full.Time.Minimum.Wage.Earner"  ] <- "S2"
names(d3a)[names(d3a) == "Scenario.3..Family.of.Four..Median.Income" ] <- "S3"
names(d3a)[names(d3a) == "Scenario.4..Single.Parent.Household.with.2.Children..Ontario.Works" ] <- "S4"
names(d3a)[names(d3a) ==  "Scenario.5..One.person.Household..Ontario.Works"] <- "S5"
names(d3a)[names(d3a) == "Scenario.6..One.Person.Household..Ontario.Disability.Support.Program" ] <- "S6"
names(d3a)[names(d3a) == "Scenario.7..One.Person.Household..Old.Age.Security..Guaranteed.Annual.Income.Supplement" ] <- "S7"
names(d3a)[names(d3a) == "Scenario.8..Married.Couple..Ontario.Disability.Support.Program" ] <- "S8"
names(d3a)[names(d3a) == "Scenario.9..Single.Person.Household..Full.Time.Minimum.Wage.Earner" ] <- "S9"
#renaming first column and assigning row names
d3a[1, 1] = "Total_income"
d3a[2, 1] = "Average_Monthly_Rent_expense"
d3a[3, 1] = "Food_expense"
d3a[4, 1] = "Total_expenditure"
d3a[5, 1] = "Funds_remaining"
d3a[6, 1] = "percent_income_rent"
d3a[7, 1] = "percent_income_requiredforhealthfood"
d3b <- data.frame(d3a, row.names = 1)
#transpose the data
d3c <- as.data.frame(t(d3b))
colnames(d3c)
# add a column to show  subsidy status
d3c <- cbind(d3c,category= "Without Subsidies, Market Rent")
d3d <- tibble::rownames_to_column(d3c, "scenario")

#merging the data
cleaned_data <- rbind(d1d, d2d,d3d)

#### Save data ####
write_csv(cleaned_data, "outputs/data/analysis_data.csv")
