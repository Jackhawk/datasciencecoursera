corr <- function(directory, threshold = 0) {
    
	# Empty vector to store correlation results
    avect <- numeric(0)
        
	# Character vector of the file names
    file_names <- list.files(path=directory, pattern = "*.csv", full.names=TRUE)
    
    # I wanted to use this instead of 1:332 (fix later)
    # len_files <- length(file_names)
    
    for (i in 1:332)  {
        # Import the nominated files to a data frame
        spec_df <- read.csv(file_names[i])
    
        # Return complete cases only
        spec_df <- spec_df[complete.cases(spec_df),]
        
        # count the number of complete observations
        obs <- nrow(spec_df)
    
        # calculate nitrate\sulfate correlation where observations
        # are greater than the threshold
        y <- if (obs > threshold) cor(spec_df[,2], spec_df[,3])
    
        # append the results to the storage vector
        avect <- append(avect, y)    
    }
    # return the storage vector
    avect
}