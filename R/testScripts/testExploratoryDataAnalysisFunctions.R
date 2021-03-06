# The purpose of this script is to test all the functions used in the shiny app

# Change the below file path to the file path you save the repo to
setwd('C:/Users/guypw/OneDrive/Documents/geo2rShinyApp')

# Import Functions
source("R/backendDifferentialGeneExpressionDataFunctions.R")
source("R/backendExploratoryDataAnalysisDataFunctions.R")
source("R/interactiveDifferentialGeneExpressionDataVisualizationFunctions.R")
source("R/interactiveExploratoryDataAnalysisDataVisualizationFunctions.R")
source("R/nonInteractiveDifferentialGeneExpressionDataVisualizationFunctions.R")
source("R/nonInteractiveExploratoryDataAnalysisDataVisualizationFunctions.R")

# Import Libraries
library(plotly)
library(ggplot2)
library(stringr)

# Input Values
#logTransformation <- "Auto-Detect"
#knnTransformation <- "Yes"# Values can also be "Yes"

logTransformations <- list("Auto-Detect", "No")  #
knnTransformations <- list("Yes", "No") # Values can also be "Yes"
knn <- 2
pValueAdjustments <- list("Benjamini & Hochberg (False discovery rate)", "Benjamini & Yekutieli", "Bonferroni", "Holm", "None")
limmaPrecisionWeightss <- list("No", "Yes")
forceNormalizations <- list("No", "Yes")
platformAnnotations <- "NCBI generated"
significanceLevelCutOffs <- list(0.05, 0.2, 0.4, 0.6, 0.8, 1.0)

goodList <- list("GSE18385", "GSE18397", "GSE18400", "GSE18408", "GSE18423", "GSE18433", "GSE18434", "GSE18438","GSE18439","GSE18441", "GSE18442", "GSE18443","GSE18444","GSE18445","GSE18446","GSE18447","GSE18448", "GSE18449","GSE18450","GSE18451", "GSE25728", "GSE25734", "GSE25752", "GSE25721", "GSE25722", "GSE25724", "GSE25725", "GSE25727", "GSE25729", "GSE25731", "GSE25732", "GSE25733", "GSE25736","GSE25737","GSE25741","GSE25742","GSE25743","GSE25744","GSE25745","GSE25746", "GSE25755", "GSE25763","GSE25764","GSE25765","GSE25766","GSE25767","GSE25768","GSE25770","GSE25771","GSE25772","GSE25774","GSE25775","GSE25776","GSE25778","GSE25778", "GSE18380","GSE18382","GSE18383", "GSE18384", "GSE18386","GSE18387","GSE18388","GSE18389","GSE18390","GSE18391","GSE18392","GSE18393","GSE18394","GSE18396", "GSE18399", "GSE18403","GSE18404","GSE18407", "GSE18409","GSE18411","GSE18412","GSE18413","GSE18414","GSE18415","GSE18416","GSE18417","GSE18419","GSE18420","GSE18421","GSE18422", "GSE18424","GSE18426","GSE18427","GSE18428","GSE18430","GSE18431","GSE18432","GSE18435","GSE18437", "GSE18452","GSE18453","GSE18454","GSE18456","GSE18457","GSE18458", "GSE178351", "GSE25723")
badList <- list("GSE25758", "GSE25762", "GSE18459") # The first two have only 1 column, the third is just massive and the fourth errors on GEO2R

listOne <- goodList[1:10]
listTwo <- goodList[11:20]
listThree <- goodList[21:30]
listFour <- goodList[31:40]
listFive <- goodList[41:50]
listSix <- goodList[51:60]
listSeven <- goodList[61:70]
listEight <- goodList[71:80]
listNine <- goodList[81:90]
listTen <- goodList[91:105]
listEleven <- badList

for(geoAccessionCode in listEleven) {
  for(logTransformation in logTransformations){
    for(knnTransformation in knnTransformations) {
  tryCatch({
# Get the GEO2R data for all platforms
#geoAccessionCode <- "GSE18388"
allGset <- getGeoObject(geoAccessionCode)

# Get a list of all the platforms
platforms <- extractPlatforms(allGset)
platform <- platforms[1]

# Extract the GEO2R data from the specified platform
gsetData <- extractPlatformGset(allGset, platform)

# Extract the experiment information
experimentInformation <- extractExperimentInformation(gsetData)

# Extract Sample Information
sampleInfo <- extractSampleInformation(gsetData)

# Extract expression data
expressionData <- extractExpressionData(gsetData)

#str(as.data.frame(expressionData[,7]))
#df <- expressionData[,colSums(is.na(expressionData))<nrow(expressionData)]


# Check data type
#typeof(expressionData) == "logical"

# Get column Details
columnInfo <- extractSampleDetails(gsetData)

# Is log transformation auto applied
autoLogInformation <- calculateAutoLogTransformApplication(expressionData)

# Get a list of all the columns
columns <- extractSampleNames(expressionData)

# Apply log transformation to expression data if necessary
dataInput <- calculateLogTransformation(expressionData, logTransformation)

# Perform KNN transformation on log expression data if necessary
knnDataInput <- calculateKnnImpute(dataInput, knnTransformation)

# Get a list of all the columns in the KNN output
knnColumns <- extractSampleNames(knnDataInput)

# Get knn output column Details
knnColumnInfo <- extractSampleDetails(gsetData)
knnColumnInfo <- knnColumnInfo[knnColumns,]

# Remove all incomplete rows
naOmitInput <- calculateNaOmit(knnDataInput)

# Perform Princomp PCA analysis on KNN transformation expression data
pcaPrincompDataInput <- calculatePrincompPca(naOmitInput)

# Perform Prcomp PCA analysis on KNN transformation expression data
pcaPrcompDataInput <- calculatePrcompPca(naOmitInput)


# Extract Experiment Information
extractedExperimentInformation <- convertExperimentInformation(experimentInformation)

# Non-Interactive Box-and-Whisker Plot
fig <- nonInteractiveBoxAndWhiskerPlot(ex = knnDataInput, geoAccessionCode = geoAccessionCode, platform = platform)

# Interactive Box-and-Whisker Plot
fig <- interactiveBoxAndWhiskerPlot(knnDataInput, geoAccessionCode, platform)
fig

# Non-Interactive Density Plot
fig <- nonInteractiveDesnityPlot(ex = naOmitInput, geoAccessionCode = geoAccessionCode, platform = platform)


# Interactive Density Plot
fig <- interactiveDensityPlot(naOmitInput, geoAccessionCode, platform)
fig

# 3D Interactive Density Plot
fig <- interactiveThreeDDesnityPlot(naOmitInput, geoAccessionCode, platform)
fig

# Non-Interactive UMAP
fig <- nonInteractiveUmapPlot(naOmitInput, knn, geoAccessionCode)


# Interactive UMAP
fig <- interactiveUmapPlot(naOmitInput, knn, geoAccessionCode)
fig

# Non-Interactive Mean Variance Plot
fig <- nonInteractiveMeanVariancePlot(naOmitInput, geoAccessionCode)

# Interactive Mean Variance Plot
fig <- interactiveMeanVariancePlot(naOmitInput, geoAccessionCode, gsetData)
fig

# Non-Interactive Princomp PCA Scree Plot
fig <- nonInteractivePcaScreePlot(pcaPrincompDataInput)
fig

# Interactive Princomp PCA Scree Plot
fig <- interactivePrincompPcaScreePlot(pcaPrincompDataInput, geoAccessionCode)
fig

# Non-Interactive Princomp PCA Individual Plot
fig <- nonInteractivePcaIndividualsPlot(pcaPrincompDataInput)


# Interactive Princomp PCA Individual Plot
fig <- interactivePrincompPcaIndividualsPlot(pcaPrincompDataInput, geoAccessionCode, gsetData)
fig

# Non-Interactive Princomp PCA Variables Plot
fig <- nonInteractivePcaVariablesPlot(pcaPrincompDataInput)

# Interactive Princomp PCA Variables Plot
fig <- interactivePrincompPcaVariablesPlot(pcaPrincompDataInput, geoAccessionCode)
fig

# Non-Interactive Princomp PCA Individual and Variables Bilot
fig <- nonInteractivePcaBiplotPlot(pcaPrincompDataInput)
fig

# Correlation Matrix of samples
fig <- interactiveHeatMapPlot(naOmitInput)
fig

# Interactive Prcomp PCA Scree Plot
fig <- interactivePrcompPcaScreePlot(pcaPrcompDataInput, geoAccessionCode)
fig

# Interactive Prcomp PCA Individual Plot
fig <- interactivePrcompPcaIndividualsPlot(pcaPrcompDataInput, geoAccessionCode, gsetData)
fig

# Interactive Prcomp PCA Variables Plot
fig <- interactivePrcompPcaVariablesPlot(pcaPrcompDataInput, geoAccessionCode)
fig

gc()


  }, error = function(e) {
    outputFile <-file(paste0(geoAccessionCode,"EDAOutput.txt"))
    write(as.character(geoAccessionCode),file = outputFile, append = TRUE, sep = "\n")
    close(outputFile)
    gc()

  })
    }
  }
}

library(GEOexplorer)
GEOexplorer::loadApp()
