complete <- function(directory, id = 1:332) {
       
    # set working directory
    if(grep("specdata", directory) == 1) {
        directory <- ("./specdata/")
    }
    # get the length of id vector
    id.len <- length(id)
    comp_data <- rep(0, id_len)
    # find all files in the specdata folder
    all_files <- as.character( list.files(directory) )
    file_paths <- paste(directory, all_files, sep="")
    j <- 1 
    for (i in id) {
        current_file <- read.csv(file_paths[i], header=T, sep=",")
        complete_data[j] <- sum(complete.cases(current_file))
        j <- j + 1
    }
    result <- data.frame(id = id, nobs = complete_data)
    return(result)
} 

# tests
complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)
