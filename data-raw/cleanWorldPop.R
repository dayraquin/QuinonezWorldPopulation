library(readxl)
library(tidyverse)

Estimates <- read_excel("data-raw/World_Population.xlsx", sheet='ESTIMATES',
                        skip = 16)

WorldPopulation <- Estimates %>%
  filter(Type == "Country/Area")

WorldPopulation <- select(WorldPopulation, -c(Index, Variant, Notes, Type,
                                              "Country code", "Parent code"))

WorldPopulation <- WorldPopulation %>%
  pivot_longer(
    '1950':'2020',
    names_to = 'Year',
    values_to = 'Population'
  )

colnames(WorldPopulation) = c("Country", "Year", "Population")

WorldPopulation$Year = as.numeric(WorldPopulation$Year)
WorldPopulation$Population = as.numeric(WorldPopulation$Population)

usethis::use_data(WorldPopulation)
