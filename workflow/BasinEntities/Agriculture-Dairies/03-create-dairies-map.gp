# Create a GeoMapProject file for dairies
# - read the previously downloaded layer file
# - output to the web folder for use by the InfoMapper
# - layer view groups are added from 1st drawn (bottom) to last drawn (top)
#
# Define properties to control processing.
# - use relative paths so that the command file is portable
# - AssetsFolder is where map files exist for the InfoMapper tool
SetProperty(PropertyName="AppFolder",PropertyType="str",PropertyValue="../../../web")
SetProperty(PropertyName="MapsFolder",PropertyType="str",PropertyValue="${AppFolder}/data-maps")
SetProperty(PropertyName="MapFolder",PropertyType="str",PropertyValue="${MapsFolder}/BasinEntities/Agriculture-Dairies")
#
# Create a single map project and map for that project.
# - GeoMapProjectID:  DairiesProject
# - GeoMapID:  DairiesMap
CreateGeoMapProject(NewGeoMapProjectID="DairiesProject",ProjectType="SingleMap",Name="Colorado Dairies",Description="Colorado Dairies",Properties="author:'Open Water Foundation',specificationFlavor:'',specificationVersion:'1.0.0'")
CreateGeoMap(NewGeoMapID="DairiesMap",Name="Colorado Dairies",Description="Colorado Dairies",CRS="EPSG:4326",Properties="extentInitial:'ZoomLevel:-105.5,40.7,10',docPath:'dairies-map.md'")
AddGeoMapToGeoMapProject(GeoMapProjectID="DairiesProject",GeoMapID="DairiesMap")
# = = = = = = = = = =
# Background layers:  read layers and add a layer view group
# GeoLayerViewGroupID: BackgroundGroup
# - add tile servers from MapBox, Esri, and Google
#
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="BackgroundGroup",Name="Background Layers",Description="Background maps from image servers.",Properties="isBackground: true, selectedInitial: true")
#
# Mapbox background layers
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/mapbox/satellite-streets-v9/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxSatelliteLayer",Name="Satellite (MapBox)",Description="Satellite background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxSatelliteLayer",GeoLayerViewID="MapBoxSatelliteLayerView",Name="Satellite (MapBox)",Description="Satellite background map from MapBox.",Properties="selectedInital: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/mapbox/streets-v10/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxStreetsLayer",Name="Streets (MapBox)",Description="Streets background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxStreetsLayer",GeoLayerViewID="MapBoxStreetsLayerView",Name="Streets (MapBox)",Description="Streets background map from MapBox.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/v4/mapbox.streets-satellite/{z}/{x}/{y}.png?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxStreets&SatelliteLayer",Name="Streets & Satellite (MapBox)",Description="Streets and satellite background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxStreets&SatelliteLayer",GeoLayerViewID="MapBoxStreets&SatelliteLayerView",Name="Streets & Satellite (MapBox)",Description="Streets and satellite background map from MapBox.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/masforce/cjs108qje09ld1fo68vh7t1he/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWFzZm9yY2UiLCJhIjoiY2pzMTA0bmR5MXAwdDN5bnIwOHN4djBncCJ9.ZH4CfPR8Q41H7zSpff803g",GeoLayerID="MapBoxTopographicLayer",Name="Topographic (MapBox)",Description="Topographic background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxTopographicLayer",GeoLayerViewID="MapBoxTopographicLayerView",Name="Topographic (MapBox)",Description="Topographic Map",Properties="selectedInitial: false")
#
# Esri background layers
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Dark_Gray_Base/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriDarkGray",Name="Dark Gray (Esri)",Description="Dark Gray background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriDarkGray",GeoLayerViewID="EsriDarkGrayView",Name="Dark Gray (Esri)",Description="Dark Gray background map from Esri.",Properties="selectedInitial: false,separatorBefore:true")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriImagery",Name="Imagery (Esri)",Description="Imagery background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriImagery",GeoLayerViewID="EsriImageryView",Name="Imagery (Esri)",Description="Imagery background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriLightGray",Name="Light Gray (Esri)",Description="Light Gray background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriLightGray",GeoLayerViewID="EsriLightGrayView",Name="Light Gray (Esri)",Description="Light Gray background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/NatGeo_World_Map/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriNationalGeographic",Name="National Geographic (Esri)",Description="National Geographic background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriNationalGeographic",GeoLayerViewID="EsriNationalGeographicView",Name="National Geographic (Esri)",Description="National Geographic background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Shaded_Relief/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriShadedRelief",Name="Shaded Relief (Esri)",Description="Shaded Relief background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriShadedRelief",GeoLayerViewID="EsriShadedReliefView",Name="Shaded Relief (Esri)",Description="Terrain background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriStreets",Name="Streets (Esri)",Description="Streets background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriStreets",GeoLayerViewID="EsriStreetsView",Name="Streets (Esri)",Description="Streets background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Terrain_Base/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriTerrain",Name="Terrain (Esri)",Description="Terrain background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriTerrain",GeoLayerViewID="EsriTerrainView",Name="Terrain (Esri)",Description="Terrain background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriTopographic",Name="Topographic (Esri)",Description="Topographic background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriTopographic",GeoLayerViewID="EsriTopographicView",Name="Topographic (Esri)",Description="Topographic background map from Esri.",Properties="selectedInitial: false")
#
# Google background layers
ReadRasterGeoLayerFromTileMapService(InputUrl="http://mt0.google.com/vt/lyrs=s&x={x}&y={y}&z={z}",GeoLayerID="GoogleSatellite",Name="Satellite (Google)",Description="Satellite background map from Google.",Properties="attribution: 'Google',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="GoogleSatellite",GeoLayerViewID="GoogleSatelliteView",Name="Satellite (Google)",Description="Satellite background map from Google.",Properties="selectedInitial: false,separatorBefore:true")
ReadRasterGeoLayerFromTileMapService(InputUrl="http://mt0.google.com/vt/lyrs=m&x={x}&y={y}&z={z}",GeoLayerID="GoogleStreets",Name="Streets (Google)",Description="Streets background map from Google.",Properties="attribution: 'Google',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="GoogleStreets",GeoLayerViewID="GoogleStreetsView",Name="Streets (Google)",Description="Streets background map from Google.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="http://mt0.google.com/vt/lyrs=s,h&x={x}&y={y}&z={z}",GeoLayerID="GoogleHybrid",Name="Streets & Satellite (Google)",Description="Streets & satellite background map from Google.",Properties="attribution: 'Google',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="GoogleHybrid",GeoLayerViewID="GoogleHybridView",Name="Streets & Satellite (Google)",Description="Streets & satellite background map from Google.",Properties="selectedInitial: true")
ReadRasterGeoLayerFromTileMapService(InputUrl="http://mt0.google.com/vt/lyrs=p&x={x}&y={y}&z={z}",GeoLayerID="GoogleTerrain",Name="Terrain (Google)",Description="Terrain background map from Google.",Properties="attribution: 'Google',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="GoogleTerrain",GeoLayerViewID="GoogleTerrainView",Name="Terrain (Google)",Description="Terrain background map from Google.",Properties="selectedInitial: false")
# Other
ReadRasterGeoLayerFromTileMapService(InputUrl="https://basemap.nationalmap.gov/ArcGIS/rest/services/USGSTopo/MapServer/tile/{z}/{y}/{x}",GeoLayerID="USGSTopo",Name="USGS Topo (USGS)",Description="Topo background map from USGS.",Properties="attribution: 'USGS',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="USGSTopo",GeoLayerViewID="USGSTopoView",Name="USGS Topo (USGS)",Description="USGS Topo background map from USGS.",Properties="selectedInitial: false,separatorBefore:true")
# = = = = = = = = = =
# Colorado state boundary:  read layer and add to layer view group.
# StateBoundaryGroupID: StateBoundaryGroup
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="StateBoundaryGroup",Name="Colorado State Boundary",Description="Colorado state boundary from CDPHE.",Properties="selectedInitial: true",InsertPosition="Top")
#
ReadGeoLayerFromGeoJSON(InputFile="https://opendata.arcgis.com/datasets/4402a8e032ed49eb8b37fd729e4e8f03_9.geojson",GeoLayerID="StateBoundaryLayer",Name="Colorado State Boundary",Description="Colorado state boundary from CDPHE.")
AddGeoLayerViewToGeoMap(GeoLayerID="StateBoundaryLayer",GeoLayerViewID="StateBoundaryLayerView",Name="Colorado State Boundary",Description="Colorado state boundary from CDPHE",InsertPosition="Top",Properties="docPath:layers/co-state-boundary.md")
SetGeoLayerViewSingleSymbol(GeoLayerViewID="StateBoundaryLayerView",Name="State boundary symbol",Description="State boundary in black.",Properties="color:#000000,fillColor:#000000,fillOpacity:0.0,weight:2")
# = = = = = = = = = =
# Water district 3:  read layer and add to layer view group.
# GeoLayerViewGroupID: WaterDistrictsGroup
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="WaterDistrictsGroup",Name="CO DWR Water Districts",Description="Water District boundaries from the Colorado Division of Water Resources.",Properties="selectedInitial: true",InsertPosition="Top")
#
CopyFile(SourceFile="../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-3.geojson",DestinationFile="layers/co-dwr-water-district-3.geojson")
CopyFile(SourceFile="../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-3-classify-district.csv",DestinationFile="layers/co-dwr-water-district-3-classify-district.csv")
ReadGeoLayerFromGeoJSON(InputFile="layers/co-dwr-water-district-3.geojson",GeoLayerID="WaterDistrictLayer",Name="CO DWR Water District 3",Description="Water District 3 boundary from the Colorado Division of Water Resources.")
AddGeoLayerViewToGeoMap(GeoLayerID="WaterDistrictLayer",GeoLayerViewID="WaterDistrictLayerView",Name="CO DWR Water District 3",Description="Water District 3 boundary from the Colorado Division of Water Resources",InsertPosition="Top",Properties="docPath:layers/co-dwr-water-district-3.md")
SetGeoLayerViewCategorizedSymbol(GeoLayerViewID="WaterDistrictLayerView",Name="Colorize district",Description="Show Water District 3 in black.",ClassificationAttribute="DISTRICT",Properties="classificationFile:layers/co-dwr-water-district-3-classify-district.csv")
SetGeoLayerViewEventHandler(GeoLayerViewID="WaterDistrictLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:layers/co-dwr-water-district-3-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="WaterDistrictLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:layers/co-dwr-water-district-3-event-config.json")
# = = = = = = = = = =
# Dairies:  read layer and add to a layer view group.
# GeoLayerViewGroupID: DairiesGroup
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="DairiesGroup",Name="Colorado Dairies",Description="Colorado Dairies",Properties="selectedInitial: true",InsertPosition="Top")
#
ReadGeoLayerFromGeoJSON(InputFile="layers/dairies.geojson",GeoLayerID="DairiesLayer",Name="Colorado Dairies",Description="Colorado Dairies")
AddGeoLayerViewToGeoMap(GeoLayerID="DairiesLayer",GeoLayerViewID="DairiesLayerView",Name="Colorado Dairies",Description="Colorado Dairies",Properties="docPath:layers/dairies.md")
# For now use single symbol
# - TODO smalers 2020-05-22 need to enable a graduated symbol based on flow value
SetGeoLayerViewSingleSymbol(GeoLayerViewID="DairiesLayerView",Name="Colorado Dairies",Description="Colorado Dairies",Properties="symbolImage:/img/milk_bottle-32x37.png,imageAnchorPoint:Bottom")
# SetGeoLayerViewCategorizedSymbol(GeoLayerViewID="DairiesLayerView",Name="Colorado Dairies",Description="Poudre Basin dairies",ClassificationAttribute="county",Properties="classificationType:'SingleSymbol'")
SetGeoLayerViewEventHandler(GeoLayerViewID="DairiesLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:layers/dairies-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="DairiesLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:layers/dairies-event-config.json")
# = = = = = = = = = =
# Write the map project file and copy layers to the location needed by the web application.
# - follow InfoMapper conventions
WriteGeoMapProjectToJSON(GeoMapProjectID="DairiesProject",Indent="2",OutputFile="dairies-map.json")
CreateFolder(Folder="${MapFolder}/layers",CreateParentFolders="True",IfFolderExists="Ignore")
CopyFile(SourceFile="dairies-map.json",DestinationFile="${MapFolder}/dairies-map.json")
CopyFile(SourceFile="dairies-map.md",DestinationFile="${MapFolder}/dairies-map.md")
#
CopyFile(SourceFile="layers/co-dwr-water-district-3.geojson",DestinationFile="${MapFolder}/layers/co-dwr-water-district-3.geojson")
CopyFile(SourceFile="layers/co-dwr-water-district-3-classify-district.csv",DestinationFile="${MapFolder}/layers/co-dwr-water-district-3-classify-district.csv")
CopyFile(SourceFile="../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-3-event-config.json",DestinationFile="${MapFolder}/layers/co-dwr-water-district-3-event-config.json")
CopyFile(SourceFile="../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-3.md",DestinationFile="${MapFolder}/layers/co-dwr-water-district-3.md")
#
#CopyFile(SourceFile="layers/stream-reaches.geojson",DestinationFile="${MapFolder}/layers/stream-reaches.geojson")
#
CopyFile(SourceFile="layers/dairies.geojson",DestinationFile="${MapFolder}/layers/dairies.geojson")
CopyFile(SourceFile="layers/dairies.md",DestinationFile="${MapFolder}/layers/dairies.md")
CopyFile(SourceFile="layers/dairies-event-config.json",DestinationFile="${MapFolder}/layers/dairies-event-config.json")
#
CopyFile(SourceFile="../../SupportingData/Political-ColoradoStateBoundary/layers/co-state-boundary.md",DestinationFile="${MapFolder}/layers/co-state-boundary.md")
