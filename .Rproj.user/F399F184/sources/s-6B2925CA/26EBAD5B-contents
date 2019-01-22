#' fetchCathlist.R
#'
#' @description Fetch the CATH chain list from the CATH database in the form
#' of a textfile
#' 
#' @return The path to the downloaded CATH chain list text file containing
#' the CATH hierarchy data
#'

fetchCathList <- function() {
  filepath <- "data/cath-domina-list.txt"
  download.file(url = 
                  "ftp://orengoftp.biochem.ucl.ac.uk/cath/releases/latest-release/cath-classification-data/cath-domain-list.txt", 
                destfile = filepath)
  
  return (filepath)
  
}

# [END]