#' readCathList.R
#'
#' @description Read the CATH list from the provided filepath and convert
#' it into a datatable
#' 
#' @param filepath A character vector containing the filepath to the 
#' CATH data as a form of text
#' 
#' @return The CATH data in the form of a dataframe
#'

readCathList <- function(filepath) {
  
  cathTable <- read.table(filepath)
  cathTable$V1 <- strtrim(cathTable$V1, 4)
  cathTable <- cathTable[!duplicated(cathTable$V1),]
  return (cathTable)
  
}

# [END]