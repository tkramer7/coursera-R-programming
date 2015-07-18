pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    ## NOTE: Do not round the result!
    #filename <- list.files(path=directory, pattern="*.csv")
    
    mean_vector <- c()
    
    for (i in id) {
      i
      filename = sprintf("%03d.csv", i)
      path <- paste(directory, filename, sep="/")
      # Read each file
      filedata <- read.csv(path)
      ## Select the passed in pollutant column
      coldata <- filedata[,pollutant]
      ## Ignore NAs
      coldata <- coldata[!is.na(coldata)]
      #append each file's pollutant column data in vector id
      mean_vector = c(mean_vector, coldata)
    }
    round(mean(mean_vector),3)
}
