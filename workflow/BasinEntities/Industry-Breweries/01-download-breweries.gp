# Download Poudre Basin breweries.
# - this should only need to be done periodically
# - use the file in the OWF GitHub account since it only contains Fort Collins breweries
# - save the file in 'downloads/' and then copy to 'layers/' folder
# - TODO smalers 2020-05-22 will need to clip to the Poudre if the dataset is expanded
WebGet(URL="https://raw.githubusercontent.com/OpenWaterFoundation/owf-data-co-breweries/master/data/Colorado-Breweries.geojson",OutputFile="downloads/breweries.geojson")
# Copy to the 'layers' folder.  If clipping to the Poudre is implemented, use a 02* command file.
CopyFile(SourceFile="downloads/breweries.geojson",DestinationFile="layers/breweries.geojson")
