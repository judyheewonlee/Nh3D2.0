% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fetchVerifyData.R
\name{fetchVerifyData}
\alias{fetchVerifyData}
\title{fetchVerifyData.R}
\usage{
fetchVerifyData(cathTable)
}
\arguments{
\item{cathTable}{(data.frame) A dataframe containing domain entries 
from the CATH database}
}
\value{
The \code{cathTable} with the stereochemical validation added 
to each protein entry
}
\description{
\code{fetchVerifyData} fetches verification data from the 
wwPDB site by downloading the XML file containing
stereochemical validation report data. The function calls
\code{addValidation} in order to extract the XML components
and add them to the \code{cathTable}.
}
