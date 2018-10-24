



Nh3D <- function() {
  
  #Call fetchCathList to retrieve the latest version of the Cath file
  filepath <- fetchCathlist()
  
  #Call readCathList to read the table in the cath list domain file
  #and retrieve a table of the data
  cathTable <- readCathList(filepath)
  
  #Isolate CATH domains that have a sequence length greater than 50
  #and resolution greater than 2.2A
  refineCathTable(cathTable)
  
  #Create a data tree to generate CATH hierarchy in the cathTable
  cathTree <- createDataTree(cathTable)
  
  
  
  
}