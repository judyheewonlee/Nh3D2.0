





weightHomologies <- function(cathTable) {
  
  # Use rank() function in base R to rank generate sample ranks for each
  # protein domain in each homology group
  cathTable$Rank <- NA
  
  homologyGroup <- unique(cathTable$Homology)
  
  for (group in homologyGroup) {
    
    sel <- cathTable[cathTable$Homology == group,]
    
    # Fix missing Rvalues
    sel <- fixMissingRValues(sel)
    
    # Ranking based off milt-objective optimization method
    ranks <- 0.3*rank(sel$Resolution) + 0.2*rank(sel$Rfree) + 
      0.15*rank(sel$RWork) + 0.15*rank(sel$RObserved) + 
      0.05*rank(sel$Clashscore) + 0.05*rank(sel$Ramachandran) + 
      0.05*rank(sel$RSRZ) + 0.05*rank(sel$Sidechain)
    
    cathTable[cathTable$Homology == group,]$Rank <- ranks
    
  }
  
  
  return(cathTable)
  
  
}