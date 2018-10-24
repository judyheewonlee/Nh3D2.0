#remove any domains with less then 50 length



refineCathTable <- function(cathTable) {
  #Isolate domains with a seuqence length greater than 50 and
  #a resolution greater than 2.2A
  cathTable <- cathTable[cathTable$V11 > 50,]
  cathTable <- cathTable[cathTable$V12 > 2.2,]
  
  return(cathTable)
}