#' createKeyTable.R
#'
#' @description Add to the cathTable dataframe the CATH hierarchy key of each protein 
#' homology in the cathtable
#' 
#' @param cathTable A dataframe containing the modified cath hierarchy data
#' 
#' @return The modified dataframe containing the keys to the hierarchy
#'

createKeyTable <- function(cathTable) {

  for (i in 1:nrow(cathTable)) {
    cathTable$key[i] <- paste(cathTable$V2[i], cathTable$V3[i], 
                              cathTable$V4[i],
                          sep = ".")
    
  }
  
  return(cathTable)
}


#[END]
  

  
  
  