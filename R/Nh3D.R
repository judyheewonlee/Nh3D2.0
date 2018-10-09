



Nh3D <- function() {
  
  #Call fetchCathList to retrieve the latest version of the Cath file
  filepath <- fetchCathlist()
  
  #Call readCathList to read the table in the cath list domain file
  #and retrieve a table of the data
  cathList <- readCathList(filepath)
  
  
  
}