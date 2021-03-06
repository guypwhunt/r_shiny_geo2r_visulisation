% Generated by roxygen2: do not edit by hand
% Please edit documentation in
%   R/backendDifferentialGeneExpressionDataFunctions.R
\name{convertAdjustment}
\alias{convertAdjustment}
\title{A Function to Convert the UI P-Value Adjustment into the Backend P-Value Adjustment}
\usage{
convertAdjustment(adjustment)
}
\arguments{
\item{adjustment}{A string character containing the adjustment to the P-value. The values can be: "Benjamini & Hochberg (False discovery rate)", "Benjamini & Yekutieli", "Bonferroni", "Hochberg", "Holm", "Hommel"or "None"}
}
\description{
This function converts the P-value adjustment value from the UI into the value required by the backend
}
\examples{
adjustment <- convertAdjustment("Benjamini & Hochberg (False discovery rate)")
}
\author{
Guy Hunt
}
\keyword{GEO}
