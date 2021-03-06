% Generated by roxygen2: do not edit by hand
% Please edit documentation in
%   R/interactiveExploratoryDataAnalysisDataVisualizationFunctions.R
\name{interactiveBoxAndWhiskerPlot}
\alias{interactiveBoxAndWhiskerPlot}
\title{A Function to Create an Interactive Box and Whisker Plot from an Expression Object}
\usage{
interactiveBoxAndWhiskerPlot(ex, geoAccessionCode, platform)
}
\arguments{
\item{ex}{The GEO expression object which can be obtained from the extractExpressionData() function}

\item{geoAccessionCode}{A character string representing a GEO object for download and parsing}

\item{platform}{A character string representing the study's platform}
}
\description{
This function allows you to plot expression data into an interactive Box and Whisker Plot
}
\examples{
fig <- interactiveBoxAndWhiskerPlot(expressionData, "GSE18380", "GPL4694")
}
\seealso{
\code{\link[=extractExpressionData]{extractExpressionData()}} for expression object
}
\author{
Guy Hunt
}
\keyword{GEO}
