complete <- function(directory, id=1:332) {
  ##getting files from the directory
  
  directory <- list.files("specdata", full.names = TRUE)
  
  ##making a data frame using the files
  
  mydata <- data.frame()
  for (i in id) {
    mydata <- rbind(mydata, read.csv(directory[i]))
  }
  
  ##counting the number of complete observations
  
  comcas <- mydata[complete.cases(mydata[ , c("Date", "sulfate", "nitrate", "ID")]), ]
  
  nobs <- table(comcas$ID)
 
  mydataframe <- data.frame(nobs)

  colnames(mydataframe) <- c("id", "nobs")
  
  mydataframe
}

##haven't solved the issue where the output is automatically displayed in ascending order instead of as requested