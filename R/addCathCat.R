#' addCathCat.R
#'
#' \code{addCathCat} adds to the cathTable dataframe the CATH 
#' hierarchy key of each protein homology in the cathtable
#' 
#' @param cathTable (data.frame) A dataframe containing the
#'  modified cath hierarchy data
#' 
#' @return The modified dataframe containing the keys to the hierarchy
#'

addCathCat <- function(cathTable) {

  # Add the homology and topology CATH code to 
  # cathTable
  cathTable$Class <- cathTable$V2
  cathTable$Architecture <- paste(cathTable$V2, cathTable$V3,
                                    sep = ".")
  cathTable$Topology <- paste(cathTable$V2, cathTable$V3, 
                              cathTable$V4, sep = ".")
  cathTable$Homology <- paste(cathTable$V2, cathTable$V3, 
                                   cathTable$V4, cathTable$V5,
                                   sep = ".")
  
  
  return(cathTable)
}


#[END]
  

  
  
  