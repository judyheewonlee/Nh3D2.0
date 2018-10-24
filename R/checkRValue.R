#Insert a topology class node and retrieve the R free and R factor
#data for each domain in the topology. If the R free and R factor
# values meet the required threshold, add it to the domain attributes.
# If not, then remove the child domain node from the parent topology node


checkRValues <- function(node) {
  #Retrieve the name of the domain for each domain in the
  #topology group
  for (i in node$children) {
    domain <- toString(node$i$V1)
    domain <- substring(domain, 1, 4)
    
    
  }
  
  
}