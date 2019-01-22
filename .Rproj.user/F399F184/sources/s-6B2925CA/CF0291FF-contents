#' Nh3D.R
#'
#' @description
#' The main function to Nh3D2.0
#' Calling this function will generate a dataset with the best representatives
#' for each topology group where all homologies in each group are non-homologous.
#'
#' @export

Nh3D <- function() {
  
  #Call fetchCathList to retrieve the latest version of the Cath file
  filepath <- fetchCathList()
  
  #Call readCathList to read the table in the cath list domain file
  #and retrieve a table of the data
  cathTable <- readCathList(filepath)
  
  #Isolate CATH domains that have a sequence length greater than 50
  #and resolution greater than 2.2A
  cathTable <- refineCathTable(cathTable)
  
  #Create a subcategory 'key' to organize cath hierarchy
  cathTable <- createKeyTable(cathTable)
  
  #Fetch R factor data from PDB fetch services for each protein in the 
  #generated cathtable
  RfactorDF <- data.frame()
  RfactorDF <- fetchRFactor(cathTable)
  
  return (cathTable)
}

#[END]

