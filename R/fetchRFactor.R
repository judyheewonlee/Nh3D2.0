#' fetchRFactor.R
#' 
#' @description Fetch the R Facotr values from RestfulWebservices from the PDB
#' 
#' @return A dataframe RFactorDF that contains the R facotr vlaues for each PDB domain
#' 
#' 

fetchRFactor <- function(cathTable) {
  
  RfactorDF <- data.frame()
  cathTable$Rfree <- NA
  cathTable$RWork <- NA
  cathTable$RObserved <- NA

  # Code to split dataframe referenced by 
  # https://stackoverflow.com/questions/7060272/split-up-a-dataframe-by-number-of-rows
  # Split the cathTable into sets of 1500 rows
  chunk <- 1500
  rows <- nrow(cathTable)
  r  <- rep(1:ceiling(rows/chunk),each=chunk)[1:rows]
  sptCathTable <- split(cathTable, r)
  
  #Fetch the XML data for each split data frame
  for (i in 1:length(sptCathTable)) {
    
    url <- paste("https://www.rcsb.org/pdb/rest/customReport.xml?pdbids=",
                 paste(sptCathTable[[i]]$PDB, collapse = ","),
                 "&customReportColumns=structureId,rFree,rWork,rObserved",
                  sep = "")
    myRefData <- readXML(url)
    RfactorDF <- rbind(RfactorDF, myRefData)
  }
  
  cathTable <- addRfactor(cathTable, RfactorDF)
  
  return (cathTable)
}

#[END]