





removeLowestResolution <- function(cathTable) {
  
  # Remove lowest resolution proteins from each homology group
  homologyList <- unique(cathTable$Homology)
  homologyDF <- data.frame()
  
  for (group in homologyList) {
    tmpDF <- selCathTable[cathTable$Homology == group, ]
    cutoff <- mean(tmpDF$Resolution)
    homologyDF <- rbind(homologyDF,
                        tmpDF[tmpDF$Resolution <= cutoff, ])
    
  }
  
  cathTable <- cathTable[cathTable$ID %in% homologyDF$ID, ]
  
  return(cathTable)
  
}

#[END]
