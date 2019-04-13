#' generateCathTable.R
#' 
#' \code{generateCathTable} is a function in the Nh3D2.0 package. It generates
#' a data frame that contains the entire CATH domains and their entries. 
#' This \code{cathTable} is required in order to run the \code{Nh3D} function.
#' 
#' @return A dataframe containing the CATH domains and some annotations including
#' the group identifiers (class, architecture, topology and homology), protein
#' sequence length, and resolution.
#' 
#' @examples
#' \dontrun{
#' 
#' # Generate the cathTable
#' cathTable <- generateCathTable()
#' 
#' (cathTable)
#' 
#' }
#' 
#' @export

generateCathTable <- function() {
  
  # Retrieve the CATH data from the FTP server from CATH
  filepaths <- fetchCathData()
  
  #Call readCathList to read the table in the cath list domain file
  #and retrieve a table of the data
  cathTable <- readCathData(filepaths)
  
  #Isolate CATH domains that have a sequence length greater than 50
  #and resolution greater than 2.2A
  cathTable <- refineCathTable(cathTable)
  
  return(cathTable)
  
}


#[END]
