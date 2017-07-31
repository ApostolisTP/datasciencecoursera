pollutantmean <- function(directory, pollutant, id)
  
  setwd(directory)
  read.csv(file=c(id),col.names = pollutant,sep=",")