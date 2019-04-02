



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
