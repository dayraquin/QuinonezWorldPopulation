library(tidyverse)
library(rvest)

page <- read_html('https://en.wikipedia.org/wiki/FIFA_World_Cup')

table <- page %>%
  html_nodes('table') %>%
  .[[4]] %>% html_table(header = TRUE, fill = TRUE)

colnames(table) <- c('Year', 'Hosts', 'Venues/Cities', 'Attendance',
                     'Matches','Average', 'Number', "Venue", "Games")

World_Cup <- table %>%
  select(Year, Hosts, Attendance, Matches, Average) %>%
  drop_na()

World_Cup <- World_Cup %>%
  filter(Year != "Year") %>%
  filter(Year != "2026") %>%
  filter(Year != "2030[n 1]") %>%
  filter(Year != "2034") %>%
  filter(Year != "Overall")

World_Cup$Attendance <- as.numeric(gsub(',', '',World_Cup$Attendance))
World_Cup$Average <- as.numeric(gsub(',', '',World_Cup$Average))

World_Cup$WorldCup <- paste0(World_Cup$Hosts, World_Cup$Year)
World_Cup$WorldCup <- gsub('\\s', '', World_Cup$WorldCup)

World_Cup <- World_Cup %>%
  select(Attendance, Matches, Average, WorldCup)

usethis::use_data(World_Cup)
