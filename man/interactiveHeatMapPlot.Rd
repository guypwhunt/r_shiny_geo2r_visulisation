% Generated by roxygen2: do not edit by hand
% Please edit documentation in
%   R/interactiveExploratoryDataAnalysisDataVisualizationFunctions.R
\name{interactiveHeatMapPlot}
\alias{interactiveHeatMapPlot}
\title{A Function to Create an Interactive Heat Map of the Correlations between Samples}
\usage{
interactiveHeatMapPlot(ex)
}
\arguments{
\item{ex}{The GEO expression object which can be obtained from the extractExpressionData() function}
}
\description{
This function allows you to plot an interactive heat map of the correlations between samples in an expression object
}
\examples{
fig <- interactiveHeatMapPlot(expressionData)
}
\author{
Guy Hunt
}
\keyword{GEO}
