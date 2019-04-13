#'readXML.R
#'
#' \code{readXML} retrieves the XML data from the PDB web services
#' and generate a dataframe containing the \code{RFree}, \code{RWork},
#' \code{RObserved}, and StructureID for a homology of interest
#' 
#' @param URL (string) The filepath to the XML data from the PDB
#' webservices in the form of a character vector
#' 
#' @return The modified dataframe containing the protein domain 
#' RFree, RWork and RObserved values
#'

readXML <- function(URL) {
  myXML <- xml2::read_xml(URL)
  
  myIDnodes <- xml2::xml_find_all(myXML, ".//dimStructure.structureId")
  myRFnodes <- xml2::xml_find_all(myXML, ".//dimStructure.rFree")
  myRWnodes <- xml2::xml_find_all(myXML, ".//dimStructure.rWork")
  myROnodes <- xml2::xml_find_all(myXML, ".//dimStructure.rObserved")
  
  myResData <- data.frame(IDs = 
                          tolower(as.character(xml2::xml_contents(myIDnodes))),
                          Rfree = 
                            as.character(xml2::xml_contents(myRFnodes)),
                          RWork = 
                            as.character(xml2::xml_contents(myRWnodes)),
                          RObserved = 
                            as.character(xml2::xml_contents(myROnodes)),
                          stringsAsFactors = FALSE)
  
  return (myResData)
  
}


# [END]
