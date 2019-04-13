#' fetchVerifyData.R
#' 
#' \code{fetchVerifyData} fetches verification data from the 
#' wwPDB site by downloading the XML file containing
#' stereochemical validation report data. The function calls
#' \code{addValidation} in order to extract the XML components
#' and add them to the \code{cathTable}.
#' 
#' @param cathTable (data.frame) A dataframe containing domain entries 
#' from the CATH database
#' 
#' @return The \code{cathTable} with the stereochemical validation added 
#' to each protein entry
#'
#'

fetchVerifyData <- function(cathTable) {
  
  cathTable$Clashscore <- NA
  cathTable$Ramachandran <- NA
  cathTable$RSRZ <- NA
  cathTable$Sidechain <- NA
  
  for (pdbID in cathTable$PDB) {
    
    URL <- paste("ftp://ftp.wwpdb.org/pub/pdb/validation_reports/",
                 file.path(substr(pdbID, 2, 3), pdbID,
                 paste(pdbID, "_validation.xml.gz", sep = "")),
                 sep = "")
  
    tf <- tempfile()
    download.file(URL, tf, quiet = TRUE, mode = "wb")
    
    # Unzip it in the temp folder
    xmlFile <- R.utils::gunzip(filename = tf, destname = "tdir",
                              temporary = TRUE, remove = TRUE, 
                              overwrite = TRUE)
    
    cathTable <- addValidation(xmlFile, pdbID, cathTable)
    
    # Unlink the temporary file and directory
    rm(tf)
    
  }
  
  return(cathTable)
  
}

#[END]
