#' getBestDomains.R
#' 
#' \code{getBestDomains} retrieves the n best representative 
#' domains from a provided cathTable that have been ran with
#' \code{Nh3D}. 
#'
#' @param cathTable (data.frame) A data frame that contains 
#' the processed cath data from the \code{Nh3D} function.
#' 
#' @param n (numeric) The number of representatives the 
#' user would like to retrieve. 
#' 
#' @return A dataframe containing the select best representatives
#' within a CATH identifier based on their ranking.
#'
#' @examples 
#' \dontrun{
#' 
##' # We first generate a cathTable in our local global env.
#' cathTable <- generateCathTable()
#'  
#' # We then select a topology group that we would like to retrieve a dataset of
#' # non-homologous proteins for. 
#' 
#' class <- 1
#' architecture <- 10
#' topology <- 220
#' 
#' # Run Nh3D with the parameters
#' myTable <- Nh3D(cathTable, class  = class, architecture = architecture, 
#' topology = topology)
#' 
#' # Get the best domains
#' getBestDomains(myTable, 4)
#' 
#' }
#'
#' @export

getBestDomains <- function(cathTable, n = 3) {
  
  bestDomains <- cathTable[order(cathTable$Rank),]
  bestDomains <- unique(bestDomains)
  
  if (n > nrow(bestDomains)) {
    stop("There are not enough entries to get the number
         of entries you requested. Please input a different
         value for 'n'.")
    
  }
  
  bestDomains <- bestDomains[1:n, ]
  
  return (bestDomains)
}


#[END]