#'readXML.R
#'
#' @description Retrieve the XML data from the PDB web services
#' and generate a dataframe containing the RFree, RWork, RObserved,
#' and StructureID for a homology of interest
#' 
#' @param URL The URL to the XML data from the PDB webservices in the
#' form of a character vector
#' 
#' @return The dataframe containing the protein domain RFree, RWork and
#' RObserved values
#'

library(xml2)

readXML <- function(URL) {
  myXML <- read_xml(URL)
  xml_name(myXML)
  xml_children(myXML)
  
  myIDnodes <- xml_find_all(myXML, ".//dimStructure.structureId")
  myRFnodes <- xml_find_all(myXML, ".//dimStructure.rFree")
  myRWnodes <- xml_find_all(myXML, ".//dimStructure.rWork")
  myROnodes <- xml_find_all(myXML, ".//dimStructure.rObserved")
  
  myResData <- data.frame(IDs = as.character(xml_contents(myIDnodes)),
                          Rfree = as.character(xml_contents(myRFnodes)),
                          RWork = as.character(xml_contents(myRWnodes)),
                          RObserved = as.character(xml_contents(myROnodes)),
                          stringsAsFactors = FALSE)
  
  return (myResData)
  
}


# [END]
