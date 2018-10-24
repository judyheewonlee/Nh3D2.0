#Read the CATH list from the provided filepath



readCathList <- function(filepath) {
  cathTable <- read.table(filepath)
  
  return (cathTable)
  
  
}