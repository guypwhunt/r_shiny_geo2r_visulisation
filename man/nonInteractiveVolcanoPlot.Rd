% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dataVisualizationFunctions.R
\name{nonInteractiveVolcanoPlot}
\alias{nonInteractiveVolcanoPlot}
\title{A Function to Create a Volcano Plot of the Statistical Significance (-log10 P Value) Versus Magnitude of Change (log2 Fold Change) from Differential Gene Expression Analysis}
\usage{
nonInteractiveVolcanoPlot(fit2, dT, ct)
}
\arguments{
\item{fit2}{An object containing the results of differential gene expression analysis which can be obtained from the calculateFit2() function}

\item{dT}{An object that summarises if each gene is unregulated, down regulated or has a similar level of expression which can be obtained from the calculateDT() function}

\item{ct}{A integer indicating the column to select from the dT object}
}
\description{
This function allows you to plot a volcano plot of the statistical significance (-log10 P value) versus magnitude of change (log2 fold change) from differential gene expression analysis
}
\examples{
fig <- nonInteractiveVolcanoPlot(fit2, dT, ct)
}
\author{
Guy Hunt
}
\keyword{GEO}