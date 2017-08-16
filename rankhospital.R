
rankhospital <- function(state, outcome, num = "best") {
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
  
  if (num == "best"){
    ans = sort(state_hospitals[which.min(data[data$State == state,col_ind])])[1]
  }
  
  if (num == "worst"){
    ans = sort(state_hospitals[which.max(data[data$State == state,col_ind])])[1]
  }
  
  if (is.numeric(num)) {

    ans  = state_hospitals[order( as.numeric(data[data$State == state,col_ind]), state_hospitals)][num]
  }
  
  ans
  
}

