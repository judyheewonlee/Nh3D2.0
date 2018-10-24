
library(xml2)
URL <- "https://www.rcsb.org/pdb/rest/customReport.xml?pdbids=1stp,2jef,1cdg,2imm&customReportColumns=structureId,structureTitle,experimentalTechnique,resolution,rAll,rFree,rWork,rObserved"
myXML <- read_xml(URL)
xml_name(myXML)
xml_children(myXML)

myIDnodes         <- xml_find_all(myXML, ".//dimStructure.structureId")
myResolutionNodes <- xml_find_all(myXML, ".//dimStructure.resolution")

myResData <- data.frame(IDs = as.character(xml_contents(myIDnodes)),
                        res = as.character(xml_contents(myResolutionNodes)),
                        stringsAsFactors = FALSE)



