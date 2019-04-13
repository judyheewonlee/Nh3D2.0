#' weightHomologies.R
#'
#' \code{weigthHomologies} weighs the Resolution, Rfactor and
#' Stereochemical validation scores for each protein entry in 
#' each homology of the provided \code{cathTable}. Weighting 
#' is based off the multi-objective optimization method in 
#' finding the optimal values in statistics.
#' 
#' @param cathTable (data.frame) A dataframe containing domain entries 
#' from the CATH database
#' 
#' @return The \code{cathTable} with the ranks of each protein entry in each
#' homology group added.
#'
#'

weightHomologies <- function(cathTable) {
  
  # Use rank() function in base R to rank generate sample ranks for each
  # protein domain in each homology group
  cathTable$Rank <- NA
  
  homologyGroup <- unique(cathTable$Homology)
  
  for (group in homologyGroup) {
    
    sel <- cathTable[cathTable$Homology == group,]
    
    # Fix missing Rvalues
    sel <- fixMissingRValues(sel)
    
    # Ranking based off multi-objective optimization method
    ranks <- 0.3*rank(sel$Resolution) + 0.2*rank(sel$Rfree) + 
      0.15*rank(sel$RWork) + 0.15*rank(sel$RObserved) + 
      0.05*rank(sel$Clashscore) + 0.05*rank(sel$Ramachandran) + 
      0.05*rank(sel$RSRZ) + 0.05*rank(sel$Sidechain)
    
    cathTable[cathTable$Homology == group,]$Rank <- ranks
    
  }
  
  
  return(cathTable)
  
  
}

#[END]
