#' readCathData.R
#' 
#'  \code{readCathData} reads the CATH list from the provided filepath and converts
#' it into a dataframe
#' 
#' @param filepaths (vector) A vector containing the filepaths to the CATH data files.
#' 
#' @return The CATH data in the form of a dataframe
#'

readCathData <- function(filepaths) {
  
  # if (!requireNamespace("Biostrings", quietly = TRUE)) {
  #   BiocManager::install("Biostrings", ask = FALSE, quiet = TRUE)
  # }
    
  # Read the cath-domain-file.txt as a table
  cathTable <- read.table(filepaths[1], stringsAsFactors = FALSE)
  cathTable$PDB <- strtrim(cathTable$V1, 4)
  
  # Rename columns
  colnames(cathTable)[[1]] <- "ID"
  colnames(cathTable)[[11]] <- "Length"
  colnames(cathTable)[[12]] <- "Resolution"
    
  # Read the cath-domain-seqs.fa file to fetch sequences
  CATHseqs <- Biostrings::readAAStringSet(filepaths[2])
  tempDF <- data.frame(ID = substr(names(CATHseqs), 12, 18),
                       Sequence = paste(CATHseqs),
                       stringsAsFactors = FALSE)
    
  # Add the sequences from the CATH database into the CATH table
  sel <- match(cathTable$ID, tempDF$ID)
  cathTable$Sequence <- tempDF[sel, ]$Sequence
  
  return (cathTable)
  
}

# [END]

