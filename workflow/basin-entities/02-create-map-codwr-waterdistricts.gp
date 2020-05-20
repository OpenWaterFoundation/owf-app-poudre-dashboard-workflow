# Create a GeoMapProject file for Division 1 water districts
# - read the previously downloaded layer file
# - output to the dist/info-mapper folder for use by the InfoMapper
# - layer view groups are added from 1st drawn (bottom) to last drawn (top)
#
# Define properties to control processing.
# - use relative paths so that the command file is portable
# - AssetsFolder is where map files exist for the InfoMapper tool
SetProperty(PropertyName="AssetsFolder",PropertyType="str",PropertyValue="../../dist/info-mapper")
SetProperty(PropertyName="MapsFolder",PropertyType="str",PropertyValue="${AssetsFolder}/data-maps")
SetProperty(PropertyName="MapFolder",PropertyType="str",PropertyValue="${MapsFolder}/Entities/Administrative-WaterDistricts")
#
# Create a single map project and map for that project.
# - GeoMapProjectID:  WaterDistrictsProject
# - GeoMapID:  WaterDistrictsMap
CreateGeoMapProject(NewGeoMapProjectID="WaterDistrictsProject",ProjectType="SingleMap",Name="CO Division 1 Water Districts",Description="Colorado Division 1 water districts for water administration.",Properties="author:'Open Water Foundation',specificationFlavor:'',specificationVersion:'1.0.0'")
CreateGeoMap(NewGeoMapID="WaterDistrictsMap",Name="CO Division 1 Water Districts",Description="Colorado Division 1 water districts for water administration.",CRS="EPSG:4326",Properties="extentInitial:'ZoomLevel:-105.385,40,8'")
AddGeoMapToGeoMapProject(GeoMapProjectID="WaterDistrictsProject",GeoMapID="WaterDistrictsMap")
# = = = = = = = = = =
# Background layers:  read layers and add a layer view group
# GeoLayerViewGroupID: BackgroundGroup
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/masforce/cjs108qje09ld1fo68vh7t1he/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWFzZm9yY2UiLCJhIjoiY2pzMTA0bmR5MXAwdDN5bnIwOHN4djBncCJ9.ZH4CfPR8Q41H7zSpff803g",GeoLayerID="MapBoxTopographicLayer",Name="Topographic (MapBox)",Description="Topographic background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/mapbox/satellite-streets-v9/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxSatelliteLayer",Name="Satellite (MapBox)",Description="Satellite background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/mapbox/streets-v10/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxStreetsLayer",Name="Streets (MapBox)",Description="Streets background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/v4/mapbox.streets-satellite/{z}/{x}/{y}.png?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxStreets&SatelliteLayer",Name="Streets & Satellite (MapBox)",Description="Streets and satellite background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewGroupToGeoMap(GeoMapID="WaterDistrictsMap",GeoLayerViewGroupID="BackgroundGroup",Name="Background Layers",Description="Background maps from image servers.",Properties="isBackground: true, selectedInitial: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxTopographicLayer",GeoMapID="WaterDistrictsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxTopographicLayerView",Name="Topographic (MapBox)",Description="Topographic Map",Properties="selectedInitial: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxSatelliteLayer",GeoMapID="WaterDistrictsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxSatelliteLayerView",Name="Satellite (MapBox)",Description="Satellite background map from MapBox.",Properties="selectedInital: false")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxStreetsLayer",GeoMapID="WaterDistrictsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxStreetsLayerView",Name="Streets (MapBox)",Description="Streets background map from MapBox.",Properties="selectedInitial: false")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxStreets&SatelliteLayer",GeoMapID="WaterDistrictsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxStreets&SatelliteLayerView",Name="Streets & Satellite (MapBox)",Description="Streets and satellite background map from MapBox.",Properties="selectedInitial: false")
# = = = = = = = = = =
# Water districts:  read layers and add to a layer view group.
# GeoLayerViewGroupID: WaterDistrictsGroup
ReadGeoLayerFromGeoJSON(InputFile="layers/co-dwr-water-districts-division1.geojson",GeoLayerID="WaterDistrictsLayer",Name="CO DWR Division 1 Water Districts",Description="Water District boundaries for Division 1 from the Colorado Division of Water Resources.")
AddGeoLayerViewGroupToGeoMap(GeoMapID="WaterDistrictsMap",GeoLayerViewGroupID="WaterDistrictsGroup",Name="CO DWR Division 1 Water Districts",Description="Water District boundaries for Division 1 from the Colorado Division of Water Resources.",Properties="selectedInitial: true")
AddGeoLayerViewToGeoMap(GeoLayerID="WaterDistrictsLayer",GeoMapID="WaterDistrictsMap",GeoLayerViewGroupID="WaterDistrictsGroup",GeoLayerViewID="WaterDistrictsLayerView",Name="CO DWR Division 1 Water Districts",Description="Water District boundaries for Division 1 from the Colorado Division of Water Resources")
SetGeoLayerViewCategorizedSymbol(GeoMapID="WaterDistrictsMap",GeoLayerViewGroupID="WaterDistrictsGroup",GeoLayerViewID="WaterDistrictsLayerView",Name="Colorize districts",Description="Show each water district in a different color.",ClassificationAttribute="DISTRICT",Properties="classification:'categorized',classificationField:'',classificationFile:layers/co-dwr-water-districts-division1-classify-district.csv'',color:black,fillOpacity:0.4,opacity:1.0,size:'',sizeUnits:pixels,symbolShape:square,weight:1.5")
# = = = = = = = = = =
# Write the map project file and copy layers to the location needed by the web application.
# - follow InfoMapper conventions
WriteGeoMapProjectToJSON(GeoMapProjectID="WaterDistrictsProject",Indent="2",OutputFile="codwr-waterdistricts.json")
CopyFile(SourceFile="codwr-waterdistricts.json",DestinationFile="${MapFolder}/codwr-waterdistricts.json")
CopyFile(SourceFile="layers/co-dwr-water-districts-division1.geojson",DestinationFile="${MapFolder}/layers/co-dwr-water-districts-division1.geojson")
# CopyFile(SourceFile="layers/co-dwr-water-districts-division1-classify-district.csv",DestinationFile="${MapFolder}/layers/co-dwr-water-districts-division1-classify-district.csv")
CopyFile(SourceFile="layers/co-dwr-water-districts-division1-classify-district.csv",DestinationFile="${MapFolder}/layers/co-dwr-water-districts-division1-classify-district.csv")