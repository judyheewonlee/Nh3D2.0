#'Nh3D.R
#
# Purpose: Non-Homologous 3D dataset based off the CATH database. 
# A BCB430 course project
# Version: 1.0.0
# Version history: 1.0.0
# Date: March 24 2019
# Author: Heewon Lee (heewon.lee@mail.utoronto.ca)
# License: MIT
#
#  Output: A dataframe containing the best representative PDB domains in each
#  homology group according to the CATH database.
#  Dependencies: BiocManager, Biostrings, msa
#' 
#' \code{Nh3D} is the main function to Nh3D2.0.
#' Calling this function will generate a dataset with the best representatives
#' for each topology group where all homologies in each group are non-homologous.
#' It calls several helper functions in order to generate the database.
#' 
#' @return A dataframe containing the best representative PDB domains in each
#' homology group according to the CATH database.
#'
#'
#' @export

Nh3D <- function(cathTable, class, architecture = NULL, topology = NULL, 
                 homology = NULL) {
  
  # Check if CathTable exists
  if (is.null(cathTable)) {
    stop("Please run generateCathTable() and input the saved dataframe into the
         parameter for cathTable.")
    
  }
  
  if (is.null(class)) {
    stop("Please provide a CATH class identifier that you would like to retrieve 
         the non-homologous 3D protein set for. All identifiers are provided
         in the reuslting dataframe from the generateCathKeyDF() function.")
    
  }
  
  ###UPDATE THIS SECTION WITH PARAMETER CHANGES
  
  selCathTable <- cathTable[cathTable$V2 == class,]
  
  if (!is.null(architecture)) {
    selCathTable <- selCathTable[selCathTable$V3 == architecture,]
  }
  
  if (!is.null(topology)) {
    selCathTable <- selCathTable[selCathTable$V4 == topology,]
  }
  
  if (!is.null(homology)) {
    selCathTable <- selCathTable[selCathTable$V5 == homology,]
  }
  
  selCathTable <- addCathCat(selCathTable)
  
  message("Retrieving RFactor data from the PDB...")
  #Fetch R factor data from PDB fetch services for each protein in the 
  #generated cathtable
  selCathTable <- fetchRFactor(selCathTable)
  
  selCathTable <- removeLowestResolution(selCathTable)
  
  message("Retrieving stereochemical verification data. This
          will take a couple minutes...")
  selCathTable <- fetchVerifyData(selCathTable)

  selCathTable <- weightHomologies(selCathTable)
  
  return (selCathTable)
}

#[END]

