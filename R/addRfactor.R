#' addRfactor.R
#'
#' \code{addRfactor} adds the Rfactors including
#' \code{Rfree}, \code{RWork}, and \code{RObserved} to the corresponding
#' domains in the CATH table
#' 
#' @param cathTable (data.frame) A dataframe containing domain entries 
#' from the CATH database
#' 
#' @param RfactorDF (data.frame) A dataframe containing the R factors and
#' the matching protein domains
#' 
#' @return The \code{cathTable} with the Rfactors added to each protein 
#' entry
#'

addRfactor <- function(cathTable, RfactorDF) {
  
  # Select matching PDB entries and assign the
  # corresponding Rfactors from the RfactorDF
  sel <- match(cathTable$PDB, RfactorDF$IDs)
  
  cathTable$Rfree <- RfactorDF[sel, ]$Rfree
  cathTable$RWork <- RfactorDF[sel, ]$RWork
  cathTable$RObserved <- RfactorDF[sel, ]$RObserved
  
  return(cathTable)
  
  
}

#[END]

