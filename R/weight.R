#' weight.R
#'
#' \code{weight} weighs the Resolution, Rfactor and
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

weight <- function(cathTable) {
  
  # Use rank() function in base R to rank generate sample ranks for each
  # protein domain in each homology group
  cathTable$Rank <- NA
  
  homologyGroup <- unique(cathTable$Homology)
  
  for (group in homologyGroup) {
    
    sel <- cathTable[cathTable$Homology == group,]
    
    # Ranking based off multi-objective optimization method
    ranks <- rank(3*rank(sel$Resolution) + 
      2*rank(sel$Rfree) + 
      1.5*rank(sel$RWork) + 
      1.5*rank(sel$RObserved) + 
      0.5*rank(sel$Clashscore) + 
      0.5*rank(sel$Ramachandran) + 
      0.5*rank(sel$RSRZ) + 
      0.5*rank(sel$Sidechain))
    
    cathTable[cathTable$Homology == group,]$Rank <- ranks
    
  }
  
  
  return(cathTable)
  
  
}

#[END]
