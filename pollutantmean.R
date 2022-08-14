pollutantmean <- function(directory, pollutant, id = 1:332)
{
  ##getting files from the directory
  
  directory <- list.files("specdata", full.names = TRUE)
  
  ##making a data frame using the files
  
  mydata <- data.frame()
  for (i in id) {
    mydata <- rbind(mydata, read.csv(directory[i]))
  }
  
  ##extracting "pollutant" column
  
  pollutant <- if (pollutant == "sulfate") {
    pollutant <- mydata$sulfate
  }
  else if (pollutant == "nitrate") {
    pollutant <- mydata$nitrate
  }
  
  ##calculating the mean of pollutants
  
  mean(pollutant, na.rm = TRUE)
}