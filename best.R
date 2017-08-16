best <- function(state, outcome) {
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character",na.strings = c("NA", "Not Available"))
  data<-na.omit(data)
  if (length(which(data$State == state))  == 0)
    stop("invalid state")
  if (length(which(c("heart failure","heart attack","pneumonia") == outcome))  == 0 )
    stop("invalid outcome")
  
  if (outcome == "heart attack"){  col_ind <- 11} 
  if (outcome == "heart failure"){  col_ind <- 17}
  if (outcome == "pneumonia"){  col_ind <- 23}
  
  state_hospitals = data$Hospital.Name[data$State == state]
  min_out_hsp = sort(state_hospitals[which.min(data[data$State == state,col_ind])])[1]
  min_out_hsp
}