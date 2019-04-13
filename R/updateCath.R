#' updateCath.R
#'
#' \code{updateCath} updates and/or creates the CATH data and 
#' the data frame containing the cath data.
#' 
#' @return The \code{cathTable} with the updated entries
#' 
#' @examples 
#' \dontrun{
#' 
#' # Generate a CathTable
#' cathTable <- generateCathTable()
#' 
#' # We want to update the table, so 
#' # we call the function
#' cathTable <- updateCath()
#' 
#' # You can also call this function
#' # to create the cathTable
#' 
#' }
#' 
#' @export


updateCath <- function() {
  # Run the necessary functions in order to update the cath data files

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
