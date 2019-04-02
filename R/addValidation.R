#' addValidation.R
#' @name addValidation
#' @description Read and add the validation report numbers
#' into the cathTable and return it.
#' 
#' @param xmlFile A XML file path
#' @param ID The ID of the PDB ID 
#' @param cathTable The dataframe containing CATH data
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