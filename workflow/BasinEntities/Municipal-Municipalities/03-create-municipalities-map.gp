# Create a GeoMapProject file for municipalities
# - read the previously downloaded layer file
# - output to the web folder for use by the InfoMapper
# - layer view groups are added from 1st drawn (bottom) to last drawn (top)
#
# Define properties to control processing.
# - use relative paths so that the command file is portable
# - AssetsFolder is where map files exist for the InfoMapper tool
SetProperty(PropertyName="AppFolder",PropertyType="str",PropertyValue="../../../web")
SetProperty(PropertyName="MapsFolder",PropertyType="str",PropertyValue="${AppFolder}/data-maps")
SetProperty(PropertyName="MapFolder",PropertyType="str",PropertyValue="${MapsFolder}/BasinEntities/Municipal-Municipalities")
# Municipal boundaries causes the app to freeze.  Only include for testing.
SetProperty(PropertyName="IncludeBoundaries",PropertyType="str",PropertyValue="true")
#
# Create a single map project and map for that project.
# - GeoMapProjectID:  MunicipalitiesProject
# - GeoMapID:  MunicipalitiesMap
CreateGeoMapProject(NewGeoMapProjectID="MunicipalitiesProject",ProjectType="SingleMap",Name="Colorado Municipalities",Description="Colorado Municipalities",Properties="author:'Open Water Foundation',specificationFlavor:'',specificationVersion:'1.0.0'")
CreateGeoMap(NewGeoMapID="MunicipalitiesMap",Name="Colorado Municipalities",Description="Colorado Municipalities",CRS="EPSG:4326",Properties="extentInitial:'ZoomLevel:-105.5,40.7,10',docPath:'municipalities-map.md'")
AddGeoMapToGeoMapProject(GeoMapProjectID="MunicipalitiesProject",GeoMapID="MunicipalitiesMap")
# = = = = = = = = = =
# Background layers:  read layers and add a layer view group
# GeoLayerViewGroupID: BackgroundGroup
# - add tile servers from MapBox, Esri, and Google
#
# Mapbox background layers
AddGeoLayerViewGroupToGeoMap(GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="BackgroundGroup",Name="Background Layers",Description="Background maps from image servers.",Properties="isBackground: true, selectedInitial: true")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/mapbox/satellite-streets-v9/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxSatelliteLayer",Name="Satellite (MapBox)",Description="Satellite background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxSatelliteLayer",GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxSatelliteLayerView",Name="Satellite (MapBox)",Description="Satellite background map from MapBox.",Properties="selectedInital: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/mapbox/streets-v10/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxStreetsLayer",Name="Streets (MapBox)",Description="Streets background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxStreetsLayer",GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxStreetsLayerView",Name="Streets (MapBox)",Description="Streets background map from MapBox.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/v4/mapbox.streets-satellite/{z}/{x}/{y}.png?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxStreets&SatelliteLayer",Name="Streets & Satellite (MapBox)",Description="Streets and satellite background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxStreets&SatelliteLayer",GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxStreets&SatelliteLayerView",Name="Streets & Satellite (MapBox)",Description="Streets and satellite background map from MapBox.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/masforce/cjs108qje09ld1fo68vh7t1he/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWFzZm9yY2UiLCJhIjoiY2pzMTA0bmR5MXAwdDN5bnIwOHN4djBncCJ9.ZH4CfPR8Q41H7zSpff803g",GeoLayerID="MapBoxTopographicLayer",Name="Topographic (MapBox)",Description="Topographic background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxTopographicLayer",GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxTopographicLayerView",Name="Topographic (MapBox)",Description="Topographic Map",Properties="selectedInitial: false")
#
# Esri background layers
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Dark_Gray_Base/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriDarkGray",Name="Dark Gray (Esri)",Description="Dark Gray background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriDarkGray",GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="EsriDarkGrayView",Name="Dark Gray (Esri)",Description="Dark Gray background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriImagery",Name="Imagery (Esri)",Description="Imagery background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriImagery",GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="EsriImageryView",Name="Imagery (Esri)",Description="Imagery background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriLightGray",Name="Light Gray (Esri)",Description="Light Gray background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriLightGray",GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="EsriLightGrayView",Name="Light Gray (Esri)",Description="Light Gray background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/NatGeo_World_Map/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriNationalGeographic",Name="National Geographic (Esri)",Description="National Geographic background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriNationalGeographic",GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="EsriNationalGeographicView",Name="National Geographic (Esri)",Description="National Geographic background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Shaded_Relief/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriShadedRelief",Name="Shaded Relief (Esri)",Description="Shaded Relief background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriShadedRelief",GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="EsriShadedReliefView",Name="Shaded Relief (Esri)",Description="Terrain background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriStreets",Name="Streets (Esri)",Description="Streets background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriStreets",GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="EsriStreetsView",Name="Streets (Esri)",Description="Streets background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Terrain_Base/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriTerrain",Name="Terrain (Esri)",Description="Terrain background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriTerrain",GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="EsriTerrainView",Name="Terrain (Esri)",Description="Terrain background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriTopographic",Name="Topographic (Esri)",Description="Topographic background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriTopographic",GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="EsriTopographicView",Name="Topographic (Esri)",Description="Topographic background map from Esri.",Properties="selectedInitial: false")
#
# Google background layers
ReadRasterGeoLayerFromTileMapService(InputUrl="http://mt0.google.com/vt/lyrs=s&x={x}&y={y}&z={z}",GeoLayerID="GoogleSatellite",Name="Satellite (Google)",Description="Satellite background map from Google.",Properties="attribution: 'Google',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="GoogleSatellite",GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="GoogleSatelliteView",Name="Satellite (Google)",Description="Satellite background map from Google.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="http://mt0.google.com/vt/lyrs=m&x={x}&y={y}&z={z}",GeoLayerID="GoogleStreets",Name="Streets (Google)",Description="Streets background map from Google.",Properties="attribution: 'Google',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="GoogleStreets",GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="GoogleStreetsView",Name="Streets (Google)",Description="Streets background map from Google.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="http://mt0.google.com/vt/lyrs=s,h&x={x}&y={y}&z={z}",GeoLayerID="GoogleHybrid",Name="Streets & Satellite (Google)",Description="Streets & satellite background map from Google.",Properties="attribution: 'Google',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="GoogleHybrid",GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="GoogleHybridView",Name="Streets & Satellite (Google)",Description="Streets & satellite background map from Google.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="http://mt0.google.com/vt/lyrs=p&x={x}&y={y}&z={z}",GeoLayerID="GoogleTerrain",Name="Terrain (Google)",Description="Terrain background map from Google.",Properties="attribution: 'Google',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="GoogleTerrain",GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="GoogleTerrainView",Name="Terrain (Google)",Description="Terrain background map from Google.",Properties="selectedInitial: false")
# Other
ReadRasterGeoLayerFromTileMapService(InputUrl="https://basemap.nationalmap.gov/ArcGIS/rest/services/USGSTopo/MapServer/tile/{z}/{y}/{x}",GeoLayerID="USGSTopo",Name="USGS Topo (USGS)",Description="Topo background map from USGS.",Properties="attribution: 'USGS',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="USGSTopo",GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="USGSTopoView",Name="USGS Topo (USGS)",Description="USGS Topo background map from USGS.",Properties="selectedInitial: true")
# = = = = = = = = = =
# Water district 3:  read layer and add to layer view group.
# GeoLayerViewGroupID: WaterDistrictsGroup
CopyFile(SourceFile="../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-3.geojson",DestinationFile="layers/co-dwr-water-district-3.geojson")
CopyFile(SourceFile="../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-3-classify-district.csv",DestinationFile="layers/co-dwr-water-district-3-classify-district.csv")
ReadGeoLayerFromGeoJSON(InputFile="layers/co-dwr-water-district-3.geojson",GeoLayerID="WaterDistrictLayer",Name="CO DWR Water District 3",Description="Water District 3 boundary from the Colorado Division of Water Resources.")
AddGeoLayerViewGroupToGeoMap(GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="WaterDistrictsGroup",Name="CO DWR Water Districts",Description="Water District boundaries from the Colorado Division of Water Resources.",Properties="selectedInitial: true",InsertPosition="Top")
AddGeoLayerViewToGeoMap(GeoLayerID="WaterDistrictLayer",GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="WaterDistrictsGroup",GeoLayerViewID="WaterDistrictLayerView",Name="CO DWR Water District 3",Description="Water District 3 boundary from the Colorado Division of Water Resources",InsertPosition="Top")
SetGeoLayerViewCategorizedSymbol(GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="WaterDistrictsGroup",GeoLayerViewID="WaterDistrictLayerView",Name="Colorize district",Description="Show Water District 3 in black.",ClassificationAttribute="DISTRICT",Properties="classificationFile:layers/co-dwr-water-district-3-classify-district.csv")
# = = = = = = = = = =
# Stream reaches:  read layer and add to a layer view group.
# - TODO smalers 2020-05-22 evaluate whether to include this
# - TODO smalers 2020-05-22 for now copy the stream reaches but want to use shared layer
# GeoLayerViewGroupID: StreamReachesGroup
#CopyFile(SourceFile="../../BasinEntities/Physical-StreamReaches/layers/stream-reaches.geojson",DestinationFile="layers/stream-reaches.geojson")
#ReadGeoLayerFromGeoJSON(InputFile="layers/stream-reaches.geojson",GeoLayerID="StreamReachesLayer",Name="Poudre Stream Reaches",Description="Poudre Stream Reaches")
#AddGeoLayerViewGroupToGeoMap(GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="StreamReachesGroup",Name="Poudre Stream Reaches",Description="Poudre Stream Reaches",Properties="selectedInitial: true",InsertPosition="Top")
#AddGeoLayerViewToGeoMap(GeoLayerID="StreamReachesLayer",GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="StreamReachesGroup",GeoLayerViewID="StreamReachesLayerView",Name="Poudre Stream Reaches",Description="Poudre Stream Reaches")
#SetGeoLayerViewSingleSymbol(GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="StreamReachesGroup",GeoLayerViewID="StreamReachesLayerView",Name="Poudre Stream Reaches",Description="Poudre Stream Reaches",Properties="weight:2")
## SetGeoLayerViewCategorizedSymbol(GeoMapID="StreamReachesMap",GeoLayerViewGroupID="StreamReachesGroup",GeoLayerViewID="StreamReachesLayerView",Name="Poudre Stream Reaches",Description="Show stream reaches is blue lines",ClassificationAttribute="county",Properties="classificationType:'SingleSymbol'")
# = = = = = = = = = =
# Municipal boundaries:  read layer and add to a layer view group.
# - TODO smalers 2020-06-13 this seems to hang the app when in production
# GeoLayerViewGroupID: MunicipalBoundariesGroup
ReadGeoLayerFromGeoJSON(InputFile="layers/municipal-boundaries.geojson",GeoLayerID="MunicipalBoundariesLayer",Name="Colorado Municipal Boundaries",Description="Colorado Municipal Boundaries")
AddGeoLayerViewGroupToGeoMap(GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="MunicipalitiesGroup",Name="Colorado Municipalities",Description="Colorado Municipalities",InsertPosition="Top")
If(Name="IncludeBoundaries",Condition="${IncludeBoundaries} == true")
    AddGeoLayerViewToGeoMap(GeoLayerID="MunicipalBoundariesLayer",GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="MunicipalitiesGroup",GeoLayerViewID="MunicipalBoundariesLayerView",Name="Colorado Municipal Boundaries",Description="Colorado Municipal Boundaries",Properties="docPath:'layers/municipal-boundaries.md'")
    # For now use single symbol
    # - grey
    SetGeoLayerViewSingleSymbol(GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="MunicipalitiesGroup",GeoLayerViewID="MunicipalBoundariesLayerView",Name="Colorado Municipal Boundaries",Description="Colorado Municipal Boundaries",Properties="color:#595959,opacity:1.0,fillColor:#595959,fillOpacity:0.3,weight:2")
EndIf(Name="IncludeBoundaries")
# = = = = = = = = = =
# Municipalities:  read layer and add to a layer view group.
# GeoLayerViewGroupID: MunicipalitiesGroup
ReadGeoLayerFromGeoJSON(InputFile="layers/municipalities.geojson",GeoLayerID="MunicipalitiesLayer",Name="Colorado Municipalities",Description="Colorado Municipalities")
AddGeoLayerViewToGeoMap(GeoLayerID="MunicipalitiesLayer",GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="MunicipalitiesGroup",GeoLayerViewID="MunicipalitiesLayerView",Name="Colorado Municipalities",Description="Colorado Municipalities",InsertPosition="Top",Properties="docPath:'layers/municipalities.md'")
# For now use single symbol
# - TODO smalers 2020-05-22 need to enable a graduated symbol based on flow value
SetGeoLayerViewSingleSymbol(GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="MunicipalitiesGroup",GeoLayerViewID="MunicipalitiesLayerView",Name="Colorado Municipalities",Description="Colorado Municipalities",Properties="symbolImage:/img/group-2.png")
# SetGeoLayerViewCategorizedSymbol(GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="MunicipalitiesGroup",GeoLayerViewID="MunicipalitiesLayerView",Name="Colorado Municipalities",Description="Colorado Municipalities",ClassificationAttribute="county",Properties="classificationType:'SingleSymbol'")
# = = = = = = = = = =
# Write the map project file and copy layers to the location needed by the web application.
# - follow InfoMapper conventions
WriteGeoMapProjectToJSON(GeoMapProjectID="MunicipalitiesProject",Indent="2",OutputFile="municipalities-map.json")
CreateFolder(Folder="${MapFolder}/layers",CreateParentFolders="True",IfFolderExists="Ignore")
CopyFile(SourceFile="municipalities-map.json",DestinationFile="${MapFolder}/municipalities-map.json")
CopyFile(SourceFile="municipalities-map.md",DestinationFile="${MapFolder}/municipalities-map.md")
#
CopyFile(SourceFile="layers/co-dwr-water-district-3.geojson",DestinationFile="${MapFolder}/layers/co-dwr-water-district-3.geojson")
CopyFile(SourceFile="layers/co-dwr-water-district-3-classify-district.csv",DestinationFile="${MapFolder}/layers/co-dwr-water-district-3-classify-district.csv")
#
#CopyFile(SourceFile="layers/stream-reaches.geojson",DestinationFile="${MapFolder}/layers/stream-reaches.geojson")
#
## TODO smalers 2020-06-13 enable when it does not hang the app
If(Name="IncludeBoundaries2",Condition="${IncludeBoundaries} == true")
    CopyFile(SourceFile="layers/municipal-boundaries.geojson",DestinationFile="${MapFolder}/layers/municipal-boundaries.geojson")
    CopyFile(SourceFile="layers/municipal-boundaries.md",DestinationFile="${MapFolder}/layers/municipal-boundaries.md")
EndIf(Name="IncludeBoundaries2")
#
CopyFile(SourceFile="layers/municipalities.geojson",DestinationFile="${MapFolder}/layers/municipalities.geojson")
CopyFile(SourceFile="layers/municipalities.md",DestinationFile="${MapFolder}/layers/municipalities.md")
