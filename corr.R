corr <- function(directory, threshold = 0) {
    #using the complete function, get all complete cases in all files
    complcases <- complete(directory, id = 1:332)
    #since our criteria is the # of nobs over a threshold, set that vector
    nobs_over_threshold <- subset(complcases, nobs > threshold)
    #final vector for correlated pollutants
    corr_vector <- c()
    
    for (i in nobs_over_threshold$id) {
        filename = sprintf("%03d.csv", i)
        path <- paste(directory, filename, sep="/")
        # Read each file
        filedata <- read.csv(path)
        #
        complete_pollutants_cases <- filedata[complete.cases(filedata),]
        complete_pollutants_count <- nrow(complete_pollutants_cases)
        if (complete_pollutants_count > threshold) {
            corr_vector = c(corr_vector, cor(complete_pollutants_cases$nitrate, complete_pollutants_cases$sulfate))
        }
    }
    corr_vector
}