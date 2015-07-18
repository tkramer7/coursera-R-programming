## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return a data frame of the form:
## id nobs
## 1  117
## 2  1041
## ...
## where 'id' is the monitor ID number and 'nobs' is the
## number of complete cases
complete <- function(directory, id = 1:332) {

    complete_vector <- c()
    id_vector <- c()

    for (i in id) {
        filename = sprintf("%03d.csv", i)
        path <- paste(directory, filename, sep="/")
        # Read each file
        filedata <- read.csv(path)
        #set the id number into a vector
        id_vector = c(id_vector, i)
        #count the number of complete cases (e.g. no NA's)
        cases = filedata[complete.cases(filedata),]
        #set the number of complete cases into the vector
        complete_vector = c(complete_vector, nrow(cases))
    }
    #create data frame for id's and complete cases
    df <- data.frame(id=id_vector, nobs=complete_vector)
    df
}