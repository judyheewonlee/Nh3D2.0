#' addValidation.R
#'
#' \code{addValidation} adds the stereochemical validation reports
#' into the \code{cathTable} by reading the given XML file.
#' This includes the \code{clashscore}, \code{Ramachandran Score},
#' \code{RSRZ score} and \code{percent outliers}.
#' 
#' @param xmlFile (vector) A XML file path that will be read
#' 
#' @param pdbID (string) The ID of the PDB ID 
#' 
#' @param cathTable (data.frame) A dataframe containing domain entries 
#' from the CATH database
#' 
#' @return The \code{cathTable} with the validation scores added to 
#' each protein entry
#'

addValidation <- function(xmlFile, pdbID, cathTable) {
  
  # The validation report xml files are formatted in a different way
  # then the XML files retrieved from the PDB API
  # They contain attributes
  
  # Read XML retrieved from fetchVerifyData()
  
  myXML <- xml2::read_xml(xmlFile)
  myXMLlist <- xml2::as_list(myXML)
  
  validationList <- attributes(myXMLlist$'wwPDB-validation-information'$Entry)

  cathTable[cathTable$PDB == pdbID,]$Clashscore <- validationList$clashscore
  cathTable[cathTable$PDB == pdbID,]$Ramachandran <- validationList$`percent-rama-outliers`
  cathTable[cathTable$PDB == pdbID,]$RSRZ <- validationList$`percent-RSRZ-outliers`
  cathTable[cathTable$PDB == pdbID,]$Sidechain <- validationList$`percent-rota-outliers`
  
  return(cathTable)
  
}

#[END]

