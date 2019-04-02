#' fetchVerifyData.R
#' @name fetchVerifyData 
#' @description Fetch verification data from the 
#' wwPDB site by downloading the XML file containing
#' stereochemical validation report data
#' 
#' @param cathTable The dataframe containing the CATH data
#' that will me modified
#'

fetchVerifyData <- function(cathTable) {
  
  cathTable$Clashscore <- NA
  cathTable$Ramachandran <- NA
  cathTable$RSRZ <- NA
  cathTable$Sidechain <- NA
  
  print(nrow(cathTable))
  for (pdbID in cathTable$PDB) {
    
    URL <- paste("ftp://ftp.wwpdb.org/pub/pdb/validation_reports/",
                 file.path(substr(pdbID, 2, 3), pdbID,
                 paste(pdbID, "_validation.xml.gz", sep = "")),
                 sep = "")
  
    tf <- tempfile()
    download.file(URL, tf)
    
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