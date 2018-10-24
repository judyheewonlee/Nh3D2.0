library(xml2)

readXML <- function(URL) {
  myXML <- read_xml(URL)
  xml_name(myXML)
  xml_children(myXML)
  
  myIDnodes         <- xml_find_all(myXML, ".//dimStructure.structureId")
  myResolutionNodes <- xml_find_all(myXML, ".//dimStructure.resolution")
  
  myResData <- data.frame(IDs = as.character(xml_contents(myIDnodes)),
                          res = as.character(xml_contents(myResolutionNodes)),
                          stringsAsFactors = FALSE)
  
  
}