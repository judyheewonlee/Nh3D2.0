#' refineCathTable.R
#'
#' @description Remove any domains in the cathTable that have a domain length less than 50
#' and a resolution value greater than 2.2A. 
#' 
#' @param cathTable A dataframe containing the modified cath hierarchy data
#' 
#' @return The refined and modified cathTable only containing domains that have
#' a length greater than 50bp and a resolution less than 2.2A.
#'

refineCathTable <- function(cathTable) {
  #Isolate domains with a sequence length greater than 50 and
  #a resolution less than 2.2A
  cathTable <- cathTable[cathTable$Length > 50,]
  cathTable <- cathTable[cathTable$Resolution < 2.2,]
  
  return(cathTable)
  
}

# [END]