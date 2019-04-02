





fixMissingRValues <- function(cathTable) {
  
  # On average, Rfree values are approximately 0.038A greater than
  # Rwork. Additionally, RObserved values are approximately 0.0019A 
  # greater than RWork. We can estimate Rvalues through the mean differences
  # between the R factors. More information in the readMe.
  
  
  missingVariables <- cathTable[cathTable$RWork == "null" |
                                  cathTable$Rfree == "null" |
                                  cathTable$RObserved == "null", ]
  
  # Loop through the missing variables and replace them. Note that
  # rows with Rfactors missing for all entries will just be ranked as
  # NA.
  for (ID in missingVariables$ID) {
    
    sel <- missingVariables[missingVariables$ID == ID, ]
    
    # If RWork is missing
    if (sel$RWork == "null") {
      if (sel$Rfree != "null") {
        missingVariables$RWork <- as.numeric(sel$Rfree) - 0.038
      }
      
      else if (sel$RObserved != "null") {
        missingVariables$RWork <- as.numeric(sel$RObserved) - 0.0019
      }
    }
    
    # If RObserved is missing
    if (sel$RObserved == "null") {
      if (sel$Rfree != "null") {
        missingVariables$RObserved <- as.numeric(sel$Rfree) - 0.0361
      }
      
      else if (sel$RWork != "null") {
        missingVariables$RObserved <- as.numeric(sel$RWork) + 0.0019
      }
    }
    
    # If RFree is missing
    if (sel$Rfree == "null") {
      if (sel$RWork != "null") {
        missingVariables$Rfree <- as.numeric(sel$RWork) + 0.038
      }
      
      else if (sel$RObserved != "null") {
        missingVariables$Rfree <- as.numeric(sel$RObserved) + 0.0361
      }
    }
  }
    
  
  # Add the resolution values to the table
  indicies <- match(cathTable$ID, missingVariables$ID)
  cathTable$RWork <- missingVariables[indicies, ]$RWork
  cathTable$Rfree <- missingVariables[indicies, ]$Rfree
  cathTable$RObserved <- missingVariables[indicies, ]$RObserved
  
  return (cathTable)
  
}
  

#[END]

  
  