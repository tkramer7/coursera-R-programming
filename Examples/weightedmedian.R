weightmedian <- function(directory, day) {
     dat <- data.frame()
     files <- list.files(directory, full.names = TRUE)
     for (i in 1:5) {dat <- rbind(dat, read.csv(files[i]))}
     dat_subset <- dat[which(dat[, "Day"] == day),]
     
         median(dat_subset[, "Weight"], na.rm=TRUE)
     }