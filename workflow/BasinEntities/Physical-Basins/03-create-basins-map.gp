# Create a GeoMapProject file for basins for the Poudre Basin
# - read the previously downloaded layer file
# - output to the web folder for use by the InfoMapper
# - layer view groups are added from 1st drawn (bottom) to last drawn (top)
#
# Define properties to control processing.
# - use relative paths so that the command file is portable
# - AssetsFolder is where map files exist for the InfoMapper tool
SetProperty(PropertyName="AppFolder",PropertyType="str",PropertyValue="../../../web")
SetProperty(PropertyName="MapsFolder",PropertyType="str",PropertyValue="${AppFolder}/data-maps")
SetProperty(PropertyName="MapFolder",PropertyType="str",PropertyValue="${MapsFolder}/BasinEntities/Physical-Basins")
#
# Create a single map project and map for that project.
# - GeoMapProjectID:  BasinsProject
# - GeoMapID:  BasinsMap
CreateGeoMapProject(NewGeoMapProjectID="BasinsProject",ProjectType="SingleMap",Name="Poudre Basins",Description="Poudre Basins",Properties="author:'Open Water Foundation',specificationFlavor:'',specificationVersion:'1.0.0'")
CreateGeoMap(NewGeoMapID="BasinsMap",Name="Poudre Basins",Description="Poudre Basins",CRS="EPSG:4326",Properties="extentInitial:'ZoomLevel:-105.5,40.7,10',docPath:basins-map.md")
AddGeoMapToGeoMapProject(GeoMapProjectID="BasinsProject",GeoMapID="BasinsMap")
# = = = = = = = = = =
# Background layers:  read layers and add a layer view group
# GeoLayerViewGroupID: BackgroundGroup
# - add tile servers from MapBox, Esri, and Google
#
# Mapbox background layers
AddGeoLayerViewGroupToGeoMap(GeoMapID="BasinsMap",GeoLayerViewGroupID="BackgroundGroup",Name="Background Layers",Description="Background maps from image servers.",Properties="isBackground: true, selectedInitial: true")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/mapbox/satellite-streets-v9/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxSatelliteLayer",Name="Satellite (MapBox)",Description="Satellite background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxSatelliteLayer",GeoMapID="BasinsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxSatelliteLayerView",Name="Satellite (MapBox)",Description="Satellite background map from MapBox.",Properties="selectedInital: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/mapbox/streets-v10/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxStreetsLayer",Name="Streets (MapBox)",Description="Streets background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxStreetsLayer",GeoMapID="BasinsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxStreetsLayerView",Name="Streets (MapBox)",Description="Streets background map from MapBox.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/v4/mapbox.streets-satellite/{z}/{x}/{y}.png?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxStreets&SatelliteLayer",Name="Streets & Satellite (MapBox)",Description="Streets and satellite background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxStreets&SatelliteLayer",GeoMapID="BasinsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxStreets&SatelliteLayerView",Name="Streets & Satellite (MapBox)",Description="Streets and satellite background map from MapBox.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/masforce/cjs108qje09ld1fo68vh7t1he/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWFzZm9yY2UiLCJhIjoiY2pzMTA0bmR5MXAwdDN5bnIwOHN4djBncCJ9.ZH4CfPR8Q41H7zSpff803g",GeoLayerID="MapBoxTopographicLayer",Name="Topographic (MapBox)",Description="Topographic background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxTopographicLayer",GeoMapID="BasinsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxTopographicLayerView",Name="Topographic (MapBox)",Description="Topographic Map",Properties="selectedInitial: false")
#
# Esri background layers
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Dark_Gray_Base/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriDarkGray",Name="Dark Gray (Esri)",Description="Dark Gray background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriDarkGray",GeoMapID="BasinsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="EsriDarkGrayView",Name="Dark Gray (Esri)",Description="Dark Gray background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriImagery",Name="Imagery (Esri)",Description="Imagery background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriImagery",GeoMapID="BasinsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="EsriImageryView",Name="Imagery (Esri)",Description="Imagery background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriLightGray",Name="Light Gray (Esri)",Description="Light Gray background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriLightGray",GeoMapID="BasinsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="EsriLightGrayView",Name="Light Gray (Esri)",Description="Light Gray background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/NatGeo_World_Map/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriNationalGeographic",Name="National Geographic (Esri)",Description="National Geographic background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriNationalGeographic",GeoMapID="BasinsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="EsriNationalGeographicView",Name="National Geographic (Esri)",Description="National Geographic background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Shaded_Relief/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriShadedRelief",Name="Shaded Relief (Esri)",Description="Shaded Relief background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriShadedRelief",GeoMapID="BasinsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="EsriShadedReliefView",Name="Shaded Relief (Esri)",Description="Terrain background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriStreets",Name="Streets (Esri)",Description="Streets background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriStreets",GeoMapID="BasinsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="EsriStreetsView",Name="Streets (Esri)",Description="Streets background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Terrain_Base/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriTerrain",Name="Terrain (Esri)",Description="Terrain background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriTerrain",GeoMapID="BasinsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="EsriTerrainView",Name="Terrain (Esri)",Description="Terrain background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriTopographic",Name="Topographic (Esri)",Description="Topographic background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriTopographic",GeoMapID="BasinsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="EsriTopographicView",Name="Topographic (Esri)",Description="Topographic background map from Esri.",Properties="selectedInitial: false")
#
# Google background layers
ReadRasterGeoLayerFromTileMapService(InputUrl="http://mt0.google.com/vt/lyrs=s&x={x}&y={y}&z={z}",GeoLayerID="GoogleSatellite",Name="Satellite (Google)",Description="Satellite background map from Google.",Properties="attribution: 'Google',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="GoogleSatellite",GeoMapID="BasinsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="GoogleSatelliteView",Name="Satellite (Google)",Description="Satellite background map from Google.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="http://mt0.google.com/vt/lyrs=m&x={x}&y={y}&z={z}",GeoLayerID="GoogleStreets",Name="Streets (Google)",Description="Streets background map from Google.",Properties="attribution: 'Google',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="GoogleStreets",GeoMapID="BasinsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="GoogleStreetsView",Name="Streets (Google)",Description="Streets background map from Google.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="http://mt0.google.com/vt/lyrs=s,h&x={x}&y={y}&z={z}",GeoLayerID="GoogleHybrid",Name="Streets & Satellite (Google)",Description="Streets & satellite background map from Google.",Properties="attribution: 'Google',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="GoogleHybrid",GeoMapID="BasinsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="GoogleHybridView",Name="Streets & Satellite (Google)",Description="Streets & satellite background map from Google.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="http://mt0.google.com/vt/lyrs=p&x={x}&y={y}&z={z}",GeoLayerID="GoogleTerrain",Name="Terrain (Google)",Description="Terrain background map from Google.",Properties="attribution: 'Google',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="GoogleTerrain",GeoMapID="BasinsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="GoogleTerrainView",Name="Terrain (Google)",Description="Terrain background map from Google.",Properties="selectedInitial: false")
# Other
ReadRasterGeoLayerFromTileMapService(InputUrl="https://basemap.nationalmap.gov/ArcGIS/rest/services/USGSTopo/MapServer/tile/{z}/{y}/{x}",GeoLayerID="USGSTopo",Name="USGS Topo (USGS)",Description="Topo background map from USGS.",Properties="attribution: 'USGS',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="USGSTopo",GeoMapID="BasinsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="USGSTopoView",Name="USGS Topo (USGS)",Description="USGS Topo background map from USGS.",Properties="selectedInitial: true")
# = = = = = = = = = =
# Water district 3:  read layer and add to layer view group.
# - put behind because otherwise obscures the basins
# - TODO smalers 2020-08-23 need a polyline version so can draw on top
# GeoLayerViewGroupID: WaterDistrictsGroup
CopyFile(SourceFile="../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-3.geojson",DestinationFile="layers/co-dwr-water-district-3.geojson")
CopyFile(SourceFile="../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-3-classify-district.csv",DestinationFile="layers/co-dwr-water-district-3-classify-district.csv")
ReadGeoLayerFromGeoJSON(InputFile="layers/co-dwr-water-district-3.geojson",GeoLayerID="WaterDistrictLayer",Name="CO DWR Water District 3",Description="Water District 3 boundary from the Colorado Division of Water Resources.")
AddGeoLayerViewGroupToGeoMap(GeoMapID="BasinsMap",GeoLayerViewGroupID="WaterDistrictsGroup",Name="CO DWR Water Districts",Description="Water District boundaries from the Colorado Division of Water Resources.",Properties="selectedInitial: true",InsertPosition="Top")
AddGeoLayerViewToGeoMap(GeoLayerID="WaterDistrictLayer",GeoMapID="BasinsMap",GeoLayerViewGroupID="WaterDistrictsGroup",GeoLayerViewID="WaterDistrictLayerView",Name="CO DWR Water District 3",Description="Water District 3 boundary from the Colorado Division of Water Resources",InsertPosition="Top")
SetGeoLayerViewCategorizedSymbol(GeoMapID="BasinsMap",GeoLayerViewGroupID="WaterDistrictsGroup",GeoLayerViewID="WaterDistrictLayerView",Name="Colorize district",Description="Show Water District 3 in black.",ClassificationAttribute="DISTRICT",Properties="classificationFile:layers/co-dwr-water-district-3-classify-district.csv")
# = = = = = = = = = =
# HUC2:  read layer and add to layer view group.
# GeoLayerViewGroupID: HUCsGroup
#
AddGeoLayerViewGroupToGeoMap(GeoMapID="BasinsMap",GeoLayerViewGroupID="HUCBasinsGroup",Name="Hydrologic Unit Code (HUC) Basins",Description="HUC Basin boundaries from the USGS.",Properties="selectedInitial: true",InsertPosition="Top")
# HUC 2 on bottom
ReadGeoLayerFromGeoJSON(InputFile="layers/huc2.geojson",GeoLayerID="HUC2BasinLayer",Name="HUC2 Basin: 10, Missouri",Description="HUC2 Basin boundaries from the USGS")
AddGeoLayerViewToGeoMap(GeoLayerID="HUC2BasinLayer",GeoMapID="BasinsMap",GeoLayerViewGroupID="HUCBasinsGroup",GeoLayerViewID="HUC2BasinsLayerView",Name="HUC2 Basin: 10, Missouri",Description="HUC2 Basin boundaries from the USGS",InsertPosition="Top",Properties="docPath:layers/huc2.md")
SetGeoLayerViewCategorizedSymbol(GeoMapID="BasinsMap",GeoLayerViewGroupID="HUCBasinsGroup",GeoLayerViewID="HUC2BasinsLayerView",Name="Colorize HUC2",Description="Transparent polygon.",ClassificationAttribute="HUC2",Properties="classificationFile:layers/huc2-classify-huc2.csv")
# HUC 4 next on top
ReadGeoLayerFromGeoJSON(InputFile="layers/huc4.geojson",GeoLayerID="HUC4BasinLayer",Name="HUC4 Basin: 1019, Platte",Description="HUC4 Basin boundaries from the USGS")
AddGeoLayerViewToGeoMap(GeoLayerID="HUC4BasinLayer",GeoMapID="BasinsMap",GeoLayerViewGroupID="HUCBasinsGroup",GeoLayerViewID="HUC4BasinsLayerView",Name="HUC4 Basin: 1019, Platte",Description="HUC4 Basin boundaries from the USGS",InsertPosition="Top",Properties="docPath:layers/huc4.md")
SetGeoLayerViewCategorizedSymbol(GeoMapID="BasinsMap",GeoLayerViewGroupID="HUCBasinsGroup",GeoLayerViewID="HUC4BasinsLayerView",Name="Colorize HUC4",Description="Transparent polygon.",ClassificationAttribute="HUC4",Properties="classificationFile:layers/huc4-classify-huc4.csv")
# HUC 8 next on top
ReadGeoLayerFromGeoJSON(InputFile="layers/huc8.geojson",GeoLayerID="HUC8BasinLayer",Name="HUC8 Basin: 10190007, Cache la Poudre",Description="HUC8 Basin boundaries from the USGS")
AddGeoLayerViewToGeoMap(GeoLayerID="HUC8BasinLayer",GeoMapID="BasinsMap",GeoLayerViewGroupID="HUCBasinsGroup",GeoLayerViewID="HUC8BasinsLayerView",Name="HUC8 Basin: 10100007, Cache la Poudre",Description="HUC8 Basin boundaries from the USGS",InsertPosition="Top",Properties="docPath:layers/huc8.md")
SetGeoLayerViewCategorizedSymbol(GeoMapID="BasinsMap",GeoLayerViewGroupID="HUCBasinsGroup",GeoLayerViewID="HUC8BasinsLayerView",Name="Colorize HUC8",Description="Transparent polygon.",ClassificationAttribute="HUC8",Properties="classificationFile:layers/huc8-classify-huc8.csv")
# HUC 10 next on top
ReadGeoLayerFromGeoJSON(InputFile="layers/huc10.geojson",GeoLayerID="HUC10BasinLayer",Name="Cache la Poudre HUC10 Basins",Description="HUC10 Basin boundaries from the USGS")
AddGeoLayerViewToGeoMap(GeoLayerID="HUC10BasinLayer",GeoMapID="BasinsMap",GeoLayerViewGroupID="HUCBasinsGroup",GeoLayerViewID="HUC10BasinsLayerView",Name="Cache la Poudre HUC10 Basins",Description="HUC10 Basin boundaries from the USGS",InsertPosition="Top",Properties="docPath:layers/huc10.md")
SetGeoLayerViewCategorizedSymbol(GeoMapID="BasinsMap",GeoLayerViewGroupID="HUCBasinsGroup",GeoLayerViewID="HUC10BasinsLayerView",Name="Colorize HUC10",Description="Transparent polygon.",ClassificationAttribute="HUC10",Properties="classificationFile:layers/huc10-classify-huc10.csv")
# HUC 12 next on top
ReadGeoLayerFromGeoJSON(InputFile="layers/huc12.geojson",GeoLayerID="HUC12BasinLayer",Name="Cache la Poudre HUC12 Basins",Description="HUC12 Basin boundaries from the USGS")
AddGeoLayerViewToGeoMap(GeoLayerID="HUC12BasinLayer",GeoMapID="BasinsMap",GeoLayerViewGroupID="HUCBasinsGroup",GeoLayerViewID="HUC12BasinsLayerView",Name="Cache la Poudre HUC 12 Basins",Description="HUC12 Basin boundaries from the USGS",InsertPosition="Top",Properties="docPath:layers/huc12.md")
SetGeoLayerViewCategorizedSymbol(GeoMapID="BasinsMap",GeoLayerViewGroupID="HUCBasinsGroup",GeoLayerViewID="HUC12BasinsLayerView",Name="Colorize HUC12",Description="Transparent polygon.",ClassificationAttribute="HUC12",Properties="classificationFile:layers/huc12-classify-huc12.csv")
# = = = = = = = = = =
# Stream reaches:  read layer and add to a layer view group.
# - TODO smalers 2020-05-22 for now copy the stream reaches but want to use shared layer
# GeoLayerViewGroupID: StreamReachesGroup
CopyFile(SourceFile="../../BasinEntities/Physical-StreamReaches/layers/stream-reaches.geojson",DestinationFile="layers/stream-reaches.geojson")
ReadGeoLayerFromGeoJSON(InputFile="layers/stream-reaches.geojson",GeoLayerID="StreamReachesLayer",Name="Poudre Stream Reaches",Description="Poudre Stream Reaches")
AddGeoLayerViewGroupToGeoMap(GeoMapID="BasinsMap",GeoLayerViewGroupID="StreamReachesGroup",Name="Poudre Stream Reaches",Description="Poudre Stream Reaches",Properties="selectedInitial: true",InsertPosition="Top")
AddGeoLayerViewToGeoMap(GeoLayerID="StreamReachesLayer",GeoMapID="BasinsMap",GeoLayerViewGroupID="StreamReachesGroup",GeoLayerViewID="StreamReachesLayerView",Name="Poudre Stream Reaches",Description="Poudre Stream Reaches",Properties="highlightEnabled:true")
SetGeoLayerViewSingleSymbol(GeoMapID="BasinsMap",GeoLayerViewGroupID="StreamReachesGroup",GeoLayerViewID="StreamReachesLayerView",Name="Poudre Stream Reaches",Description="Poudre Stream Reaches",Properties="color:#6297f7,width:2")
# = = = = = = = = = =
# Write the map project file and copy layers to the location needed by the web application.
# - follow InfoMapper conventions
WriteGeoMapProjectToJSON(GeoMapProjectID="BasinsProject",Indent="2",OutputFile="basins-map.json")
CreateFolder(Folder="${MapFolder}/layers",CreateParentFolders="True",IfFolderExists="Ignore")
CopyFile(SourceFile="basins-map.json",DestinationFile="${MapFolder}/basins-map.json")
CopyFile(SourceFile="basins-map.md",DestinationFile="${MapFolder}/basins-map.md")
#
CopyFile(SourceFile="layers/huc2.geojson",DestinationFile="${MapFolder}/layers/huc2.geojson")
CopyFile(SourceFile="layers/huc2-classify-huc2.csv",DestinationFile="${MapFolder}/layers/huc2-classify-huc2.csv")
CopyFile(SourceFile="layers/huc2.md",DestinationFile="${MapFolder}/layers/huc2.md")
#
CopyFile(SourceFile="layers/huc4.geojson",DestinationFile="${MapFolder}/layers/huc4.geojson")
CopyFile(SourceFile="layers/huc4-classify-huc4.csv",DestinationFile="${MapFolder}/layers/huc4-classify-huc4.csv")
CopyFile(SourceFile="layers/huc4.md",DestinationFile="${MapFolder}/layers/huc4.md")
#
CopyFile(SourceFile="layers/huc8.geojson",DestinationFile="${MapFolder}/layers/huc8.geojson")
CopyFile(SourceFile="layers/huc8-classify-huc8.csv",DestinationFile="${MapFolder}/layers/huc8-classify-huc8.csv")
CopyFile(SourceFile="layers/huc8.md",DestinationFile="${MapFolder}/layers/huc8.md")
#
CopyFile(SourceFile="layers/huc10.geojson",DestinationFile="${MapFolder}/layers/huc10.geojson")
CopyFile(SourceFile="layers/huc10-classify-huc10.csv",DestinationFile="${MapFolder}/layers/huc10-classify-huc10.csv")
CopyFile(SourceFile="layers/huc10.md",DestinationFile="${MapFolder}/layers/huc10.md")
#
CopyFile(SourceFile="layers/huc12.geojson",DestinationFile="${MapFolder}/layers/huc12.geojson")
CopyFile(SourceFile="layers/huc12-classify-huc12.csv",DestinationFile="${MapFolder}/layers/huc12-classify-huc12.csv")
CopyFile(SourceFile="layers/huc12.md",DestinationFile="${MapFolder}/layers/huc12.md")
#
CopyFile(SourceFile="layers/co-dwr-water-district-3.geojson",DestinationFile="${MapFolder}/layers/co-dwr-water-district-3.geojson")
CopyFile(SourceFile="layers/co-dwr-water-district-3-classify-district.csv",DestinationFile="${MapFolder}/layers/co-dwr-water-district-3-classify-district.csv")
#
CopyFile(SourceFile="layers/stream-reaches.geojson",DestinationFile="${MapFolder}/layers/stream-reaches.geojson")