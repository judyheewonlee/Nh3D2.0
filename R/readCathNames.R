



readCathNames <- function() {
  
  filepathNames <- "../data/cath-names.txt"
  
  download.file(url = 
               "ftp://orengoftp.biochem.ucl.ac.uk/cath/releases/latest-release/cath-classification-data/cath-names.txt", 
              destfile = filepathNames)
  
  cathNames <- readLines(filepathNames)
  cathNames <- sub("\\s+", "|", cathNames)
  cathNames <- sub("\\s+", "|", cathNames)
  
  cathNames <- read.table(text = cathNames, fill = TRUE, 
                          row.names = NULL, sep = "|", quote = "",
                          stringsAsFactors = FALSE)
  
  colnames(cathNames) <- c("Category", "CATHid", "Description")
  
  return(cathNames)
  
}