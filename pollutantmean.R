pollutantmean <- function(directory, pollutant, id = 1:332) { 

    # Store the directory location of the files
    file_directory <- directory
	
	# create a character vector of the file names
    file_names <- list.files(path=file_directory, pattern = "*.csv")
    file_names <- paste(file_directory, "/", file_names, sep='')
    
    # Import the nominated files to a data frame
    spec_df <- do.call(rbind, lapply(file_names[id], read.csv))
    
    
    # Enter the pollutant as "sulfate" or "nitrate"
    # "nitrate" is the default value
    # Test the entered pollutant and assign the column number
    stink <- if(pollutant == "sulfate") 2 else 3
    
    # return the mean of the selected pollutant
    mean(spec_df[,stink], na.rm = TRUE)
    
}

