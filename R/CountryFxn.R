#' Extracting a certain country population stats and producing a graph.
#'
#' This function will take in a string that will be of a country within the data
#' set and extract that row from the data and produce a graph that displays how
#' the population of that area has increased/decreased or stayed stagnant
#' through out the time lapse of 1950-2020.
#'
#'
#' @param country A character string
#' @return A graph produced from the \code{country} statistics
#' @examples
#' CountryPopulation('Italy')
#' @export

CountryPopulation <- function(country) {
  if(!(country %in% WorldPopulation$Country)){
    stop('Error Message: Country Not Found')
  }
  Country <- WorldPopulation[WorldPopulation$Country == country,]

  graph <- ggplot(Country, aes(x = Year, y = Population)) +
    geom_line() +
    labs(title = paste(country,
                       "Population Through Time"), x = "Year", y = "Population")

  return(graph)
}
