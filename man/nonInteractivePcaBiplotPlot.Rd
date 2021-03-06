% Generated by roxygen2: do not edit by hand
% Please edit documentation in
%   R/nonInteractiveExploratoryDataAnalysisDataVisualizationFunctions.R
\name{nonInteractivePcaBiplotPlot}
\alias{nonInteractivePcaBiplotPlot}
\title{A Function to Create a Scatter Plot that contains both the Individuals and Variables from the PCA outputs of an Expression Object}
\usage{
nonInteractivePcaBiplotPlot(pcaEx)
}
\arguments{
\item{pcaEx}{A PCA object which can be obtained from the calculatePrincompPca() function}
}
\description{
This function allows you to plot PCA expression results into an Scatter Plot contains both the Individuals and Variables
}
\examples{
fig <- nonInteractivePcaBiplotPlot(pcaPrincompDataInput)
}
\seealso{
\code{\link[=calculatePrincompPca]{calculatePrincompPca()}} for Princomp Pca expression object
}
\author{
Guy Hunt
}
\keyword{GEO}
