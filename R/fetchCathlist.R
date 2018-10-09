


fetchCathList <- function() {
  filepath <- "data/cath-domina-list.txt"
  download.file(url = 
                  "ftp://orengoftp.biochem.ucl.ac.uk/cath/releases/latest-release/cath-classification-data/cath-domain-list.txt", 
                destfile = filepath)
  
  return (filepath)
  
}