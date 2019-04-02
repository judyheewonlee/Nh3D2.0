#' fetchCathData.R
#'
#' @description Fetch the CATH chain list from the CATH database in the form
#' of a textfile
#' 
#' @return The path to the downloaded CATH chain list text file containing
#' the CATH hierarchy data
#'

fetchCathData <- function() {
  filepaths <- c("../data/cath-domain-list.txt",
                 "../data/cath-domain-seqs.fa")
  
  download.file(url = 
                  "ftp://orengoftp.biochem.ucl.ac.uk/cath/releases/latest-release/cath-classification-data/cath-domain-list.txt", 
                destfile = filepaths[1])
  
  download.file(url = "ftp://orengoftp.biochem.ucl.ac.uk/cath/releases/latest-release/sequence-data/cath-domain-seqs.fa",
                  destfile = filepaths[2])
  
  return (filepaths)
  
}

# [END]