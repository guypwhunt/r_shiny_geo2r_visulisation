% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/backendExploratoryDataAnalysisDataFunctions.R
\name{extractGeoData}
\alias{extractGeoData}
\title{A GEO Data Sourcing Function}
\usage{
extractGeoData(geoAccessionCode, platform)
}
\arguments{
\item{geoAccessionCode}{A character string representing a GEO object for download and parsing}

\item{platform}{The study's platform}
}
\description{
This function allows you to source a GEO Object from GEO when you know the specific Geo Accession code and platform
}
\examples{
extractGeoData("GSE18380", "GPL4694")
}
\author{
Guy Hunt
}
\keyword{GEO}
