complete <- function(directory, id = 1:332) { 
    
    # Store the directory location of the files
    file_directory <- directory
	
	df1 <- data.frame("id"=id)
	
	# create a character vector of the file names
    file_names <- list.files(path=file_directory, pattern = "*.csv")
    # add the file_directory to the file_names
    file_names <- paste(file_directory, "/", file_names, sep='')
    
    # Import the nominated files to a data frame
    spec_df <- do.call(rbind, lapply(file_names[id], read.csv))
    
    # Remove rows with 'NA'
    spec_df <- spec_df[complete.cases(spec_df),]
    
    # count the rows grouped by ID
    spec_df <- data.frame(table(spec_df[,4]))
    colnames(spec_df) <- c("id", "nobs")
    spec_df[order(match(spec_df[,1],df1[,1])),]
    
    # nice try but this code does not pass the submit test
    # need to add a loop like the one I used in Corr
    # probably should redo the whole jiz
    
    
}

