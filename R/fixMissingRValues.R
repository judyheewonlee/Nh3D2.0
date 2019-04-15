#' fixMissingRValues.R
#' 
#' \code{fixMissingRValues} Replace "null" R factor values with
#' estimated R factor values in the CathTable
#'
#' \code{fixMissingRValues} Outputs the \code{cathTable} with
#' missing Rfactor values replaced if at least one of the
#' \code{RObserved}, \code{RWork}, or \code{RFree} is not "null".
#' If no R factors are available, they will be left as \code{NA}.
#'
#' @param cathTable (data.frame) Data frame containing annotated cath data
#' that will have Rfactor values replaced
#' 
#' @return (data.frame) The \code{cathTable} with "null" R factor
#' values replaced
#' 

fixMissingRValues <- function(cathTable) {
  
  # On average, Rfree values are approximately 0.038A greater than
  # Rwork. Additionally, RObserved values are approximately 0.0019A 
  # greater than RWork. We can estimate Rvalues through the mean differences
  # between the R factors. More information in the readMe.
  
  # Set "null" strings to 0 for R formalities
  cathTable <- data.frame(lapply(cathTable, function(x) {
    gsub("null", 0, x)
  }), stringsAsFactors = FALSE)

  missingVariables <- cathTable[(cathTable$RWork == 0) |
                                 (cathTable$Rfree == 0) |
                                  (cathTable$RObserved == 0), ]
  
  # Loop through the missing variables and replace them. Note that
  # rows with Rfactors missing for all entries will just be ranked as
  # NA.
  for (ID in missingVariables$ID) {
    
    sel <- missingVariables[missingVariables$ID == ID, ]
    
    # If RWork is missing
    if (sel$RWork == 0) {
      if (!(sel$Rfree == 0)) {
        missingVariables$RWork <- as.numeric(sel$Rfree) - 0.038
      }
      
      else if (!(sel$RObserved == 0)) {
        missingVariables$RWork <- as.numeric(sel$RObserved) - 0.0019
      }
    }
    
    # If RObserved is missing
    if (sel$RObserved == 0) {
      if (!(sel$Rfree == 0)) {
        missingVariables$RObserved <- as.numeric(sel$Rfree) - 0.0361
      }
      
      else if (!(sel$RWork == 0)) {
        missingVariables$RObserved <- as.numeric(sel$RWork) + 0.0019
      }
    }
    
    # If RFree is missing
    if (sel$Rfree == 0) {
      if (!(sel$RWork == 0)) {
        missingVariables$Rfree <- as.numeric(sel$RWork) + 0.038
      }
      
      else if (!(sel$RObserved == 0)) {
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

  
  