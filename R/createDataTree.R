#Generate a data tree for the refined CATH table

createDataTree <- function(table) {
  
  #Generate hierarchy using the data.tree package
  table$pathString <- paste("CATH",
                                    table$V2,
                                    table$V3,
                                    table$V4,
                                    sep = "/")
  #Generate the tree
  cathTree <- data.tree::as.Node(table)
  
  return (cathTree)
  
}


#[END]
  

  
  
  