#' readCathNames.R
#' 
#'  \code{readCathNames} reads the \code{cath-names.txt} file from the 
#'  CATH database to create a dataframe containing the names of each 
#'  protein domain in CATH and the corresponding descriptions and 
#'  CATH identifier.
#' 
#' @return The names, CATH identifier and description of each CATH 
#' protein domain.
#' 

readCathNames <- function() {
  
  filepathNames <- tempfile()
  
  cathNamesUrl <- paste("ftp://orengoftp.biochem.ucl.ac.uk/cath/releases/",
                        "latest-release/cath-classification-data/cath-names.txt",
                        sep = "")
  
  download.file(url = cathNamesUrl, destfile = filepathNames)
  
  cathNames <- readLines(filepathNames)
  cathNames <- sub("\\s+", "|", cathNames)
  cathNames <- sub("\\s+", "|", cathNames)
  
  cathNames <- read.table(text = cathNames, fill = TRUE, 
                          row.names = NULL, sep = "|", quote = "",
                          stringsAsFactors = FALSE)
  
  colnames(cathNames) <- c("Category", "CATHid", "Description")
  
  unlink(cathNamesUrl)
  
  return(cathNames)
  
}

#[END]
