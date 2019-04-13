#' removeLowestResolution.R
#'
#' \code{removeLowestResolution} removes proteins entries that have
#' a resolution score lower than the mean in the homology group it
#' belongs to.
#' 
#' @param cathTable (data.frame) A dataframe containing domain entries 
#' from the CATH database
#' 
#' @return The \code{cathTable} with the lowest resolution scores 
#' in each homology group removed.
#'

removeLowestResolution <- function(cathTable) {
  
  # Remove lowest resolution proteins from each homology group
  homologyList <- unique(cathTable$Homology)
  homologyDF <- data.frame()
  
  for (group in homologyList) {
    tmpDF <- cathTable[cathTable$Homology == group, ]
    cutoff <- mean(tmpDF$Resolution)
    homologyDF <- rbind(homologyDF,
                        tmpDF[tmpDF$Resolution <= cutoff, ])
    
  }
  
  cathTable <- cathTable[cathTable$ID %in% homologyDF$ID, ]
  
  return(cathTable)
  
}

#[END]
