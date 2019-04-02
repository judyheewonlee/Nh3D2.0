






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

