#' fetchCathData.R
#'
#' \code{fetchCathData} fetches the CATH chain list from the 
#' CATH database in the form of a textfile
#' 
#' @return The path to the downloaded CATH chain list text file containing
#' the CATH hierarchy data
#'

fetchCathData <- function() {
  
  tempCath <- tempfile()
  tempSeqs <- tempfile()
  
  filepaths <- c(tempCath, tempSeqs)
  
  cathDomainUrl <- paste("ftp://orengoftp.biochem.ucl.ac.uk/cath/releases/",
                         "latest-release/cath-classification-data/cath",
                         "-domain-list.txt",
                         sep = "")
  cathSeqUrl <- paste("ftp://orengoftp.biochem.ucl.ac.uk/cath/releases/",
                      "latest-release/sequence-data/cath-domain-seqs.fa",
                      sep = "")
  
  download.file(url = cathDomainUrl, destfile = filepaths[1])
  
  download.file(url = cathSeqUrl, destfile = filepaths[2])
  
  return (filepaths)
  
}

# [END]

