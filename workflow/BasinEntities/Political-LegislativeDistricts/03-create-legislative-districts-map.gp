# Create a GeoMapProject file for legislative districts for the Poudre Basin
# - read the previously downloaded layer file
# - focus on Poudre Basin
# - TODO smalers 2020-08-16 need to re-add county boundaries and county and federal districts
# - output to the web folder for use by the InfoMapper
# - layer view groups are added from 1st drawn (bottom) to last drawn (top)
#
# Define properties to control processing.
# - use relative paths so that the command file is portable
# - AssetsFolder is where map files exist for the InfoMapper tool
SetProperty(PropertyName="AppFolder",PropertyType="str",PropertyValue="../../../web")
SetProperty(PropertyName="MapsFolder",PropertyType="str",PropertyValue="${AppFolder}/data-maps")
SetProperty(PropertyName="MapFolder",PropertyType="str",PropertyValue="${MapsFolder}/BasinEntities/Political-LegislativeDistricts")
#
# Create a single map project and map for that project.
# - GeoMapProjectID:  LegislativeDistrictsProject
# - GeoMapID:  LegislativeDistrictsMap
CreateGeoMapProject(NewGeoMapProjectID="LegislativeDistrictsProject",ProjectType="SingleMap",Name="CO Legislative Districts",Description="Colorado legislative districts",Properties="author:'Open Water Foundation',specificationFlavor:'',specificationVersion:'1.0.0'")
CreateGeoMap(NewGeoMapID="LegislativeDistrictsMap",Name="Colorado Legislative Districts",Description="Colorado legislative districts",CRS="EPSG:4326",Properties="extentInitial:'ZoomLevel:-105.385,40,8',docPath:legislative-districts-map.md")
AddGeoMapToGeoMapProject(GeoMapProjectID="LegislativeDistrictsProject",GeoMapID="LegislativeDistrictsMap")
# = = = = = = = = = =
# Background layers:  read layers and add a layer view group
# GeoLayerViewGroupID: BackgroundGroup
# - add tile servers from MapBox, Esri, and Google
#
# Mapbox background layers
AddGeoLayerViewGroupToGeoMap(GeoMapID="LegislativeDistrictsMap",GeoLayerViewGroupID="BackgroundGroup",Name="Background Layers",Description="Background maps from image servers.",Properties="isBackground: true, selectedInitial: true")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/mapbox/satellite-streets-v9/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxSatelliteLayer",Name="Satellite (MapBox)",Description="Satellite background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxSatelliteLayer",GeoMapID="LegislativeDistrictsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxSatelliteLayerView",Name="Satellite (MapBox)",Description="Satellite background map from MapBox.",Properties="selectedInital: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/mapbox/streets-v10/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxStreetsLayer",Name="Streets (MapBox)",Description="Streets background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxStreetsLayer",GeoMapID="LegislativeDistrictsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxStreetsLayerView",Name="Streets (MapBox)",Description="Streets background map from MapBox.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/v4/mapbox.streets-satellite/{z}/{x}/{y}.png?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxStreets&SatelliteLayer",Name="Streets & Satellite (MapBox)",Description="Streets and satellite background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxStreets&SatelliteLayer",GeoMapID="LegislativeDistrictsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxStreets&SatelliteLayerView",Name="Streets & Satellite (MapBox)",Description="Streets and satellite background map from MapBox.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/masforce/cjs108qje09ld1fo68vh7t1he/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWFzZm9yY2UiLCJhIjoiY2pzMTA0bmR5MXAwdDN5bnIwOHN4djBncCJ9.ZH4CfPR8Q41H7zSpff803g",GeoLayerID="MapBoxTopographicLayer",Name="Topographic (MapBox)",Description="Topographic background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxTopographicLayer",GeoMapID="LegislativeDistrictsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxTopographicLayerView",Name="Topographic (MapBox)",Description="Topographic Map",Properties="selectedInitial: false")
#
# Esri background layers
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Dark_Gray_Base/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriDarkGray",Name="Dark Gray (Esri)",Description="Dark Gray background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriDarkGray",GeoMapID="LegislativeDistrictsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="EsriDarkGrayView",Name="Dark Gray (Esri)",Description="Dark Gray background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriImagery",Name="Imagery (Esri)",Description="Imagery background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriImagery",GeoMapID="LegislativeDistrictsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="EsriImageryView",Name="Imagery (Esri)",Description="Imagery background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriLightGray",Name="Light Gray (Esri)",Description="Light Gray background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriLightGray",GeoMapID="LegislativeDistrictsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="EsriLightGrayView",Name="Light Gray (Esri)",Description="Light Gray background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/NatGeo_World_Map/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriNationalGeographic",Name="National Geographic (Esri)",Description="National Geographic background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriNationalGeographic",GeoMapID="LegislativeDistrictsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="EsriNationalGeographicView",Name="National Geographic (Esri)",Description="National Geographic background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Shaded_Relief/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriShadedRelief",Name="Shaded Relief (Esri)",Description="Shaded Relief background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriShadedRelief",GeoMapID="LegislativeDistrictsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="EsriShadedReliefView",Name="Shaded Relief (Esri)",Description="Terrain background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriStreets",Name="Streets (Esri)",Description="Streets background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriStreets",GeoMapID="LegislativeDistrictsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="EsriStreetsView",Name="Streets (Esri)",Description="Streets background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Terrain_Base/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriTerrain",Name="Terrain (Esri)",Description="Terrain background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriTerrain",GeoMapID="LegislativeDistrictsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="EsriTerrainView",Name="Terrain (Esri)",Description="Terrain background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriTopographic",Name="Topographic (Esri)",Description="Topographic background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriTopographic",GeoMapID="LegislativeDistrictsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="EsriTopographicView",Name="Topographic (Esri)",Description="Topographic background map from Esri.",Properties="selectedInitial: false")
#
# Google background layers
ReadRasterGeoLayerFromTileMapService(InputUrl="http://mt0.google.com/vt/lyrs=s&x={x}&y={y}&z={z}",GeoLayerID="GoogleSatellite",Name="Satellite (Google)",Description="Satellite background map from Google.",Properties="attribution: 'Google',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="GoogleSatellite",GeoMapID="LegislativeDistrictsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="GoogleSatelliteView",Name="Satellite (Google)",Description="Satellite background map from Google.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="http://mt0.google.com/vt/lyrs=m&x={x}&y={y}&z={z}",GeoLayerID="GoogleStreets",Name="Streets (Google)",Description="Streets background map from Google.",Properties="attribution: 'Google',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="GoogleStreets",GeoMapID="LegislativeDistrictsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="GoogleStreetsView",Name="Streets (Google)",Description="Streets background map from Google.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="http://mt0.google.com/vt/lyrs=s,h&x={x}&y={y}&z={z}",GeoLayerID="GoogleHybrid",Name="Streets & Satellite (Google)",Description="Streets & satellite background map from Google.",Properties="attribution: 'Google',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="GoogleHybrid",GeoMapID="LegislativeDistrictsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="GoogleHybridView",Name="Streets & Satellite (Google)",Description="Streets & satellite background map from Google.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="http://mt0.google.com/vt/lyrs=p&x={x}&y={y}&z={z}",GeoLayerID="GoogleTerrain",Name="Terrain (Google)",Description="Terrain background map from Google.",Properties="attribution: 'Google',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="GoogleTerrain",GeoMapID="LegislativeDistrictsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="GoogleTerrainView",Name="Terrain (Google)",Description="Terrain background map from Google.",Properties="selectedInitial: false")
# Other
ReadRasterGeoLayerFromTileMapService(InputUrl="https://basemap.nationalmap.gov/ArcGIS/rest/services/USGSTopo/MapServer/tile/{z}/{y}/{x}",GeoLayerID="USGSTopo",Name="USGS Topo (USGS)",Description="Topo background map from USGS.",Properties="attribution: 'USGS',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="USGSTopo",GeoMapID="LegislativeDistrictsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="USGSTopoView",Name="USGS Topo (USGS)",Description="USGS Topo background map from USGS.",Properties="selectedInitial: true")
# = = = = = = = = = =
# Water division:  read layer and add to a layer view group.
# GeoLayerViewGroupID: WaterDistrictsGroup
CopyFile(SourceFile="../Administration-CoDwrWaterDistricts/layers/co-dwr-water-division.geojson",DestinationFile="layers/co-dwr-water-division.geojson")
# Don't copy because want to change output slightly
#CopyFile(SourceFile="../Administration-CoDwrWaterDistricts/layers/co-dwr-water-division-classify-division.csv",DestinationFile="layers/co-dwr-water-division-classify-division.csv")
ReadGeoLayerFromGeoJSON(InputFile="layers/co-dwr-water-division.geojson",GeoLayerID="WaterDivisionLayer",Name="CO DWR Division 1",Description="Water Division 1 boundary from the Colorado Division of Water Resources.")
AddGeoLayerViewGroupToGeoMap(GeoMapID="LegislativeDistrictsMap",GeoLayerViewGroupID="WaterDistrictsGroup",Name="CO DWR Division 1 Water Districts",Description="Water District boundaries for Division 1 from the Colorado Division of Water Resources.",Properties="selectedInitial: true",InsertPosition="Top")
AddGeoLayerViewToGeoMap(GeoLayerID="WaterDivisionLayer",GeoMapID="LegislativeDistrictsMap",GeoLayerViewGroupID="WaterDistrictsGroup",GeoLayerViewID="WaterDivisionLayerView",Name="CO DWR Division 1",Description="Boundary for Division 1 from the Colorado Division of Water Resources",Properties="docPath:layers/co-dwr-water-division.md",InsertPosition="Top")
SetGeoLayerViewCategorizedSymbol(GeoMapID="LegislativeDistrictsMap",GeoLayerViewGroupID="WaterDistrictsGroup",GeoLayerViewID="WaterDivisionLayerView",Name="Colorize divisions",Description="Symbol for the division",ClassificationAttribute="DIV",Properties="classificationFile:'layers/co-dwr-water-division-classify-division.csv'")
# = = = = = = = = = =
# Water district 3:  read layer and add to layer view group.
# GeoLayerViewGroupID: WaterDistrictsGroup
CopyFile(SourceFile="../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-3.geojson",DestinationFile="layers/co-dwr-water-district-3.geojson")
CopyFile(SourceFile="../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-3-classify-district.csv",DestinationFile="layers/co-dwr-water-district-3-classify-district.csv")
ReadGeoLayerFromGeoJSON(InputFile="layers/co-dwr-water-district-3.geojson",GeoLayerID="WaterDistrictLayer",Name="CO DWR Water District 3",Description="Water District 3 boundary from the Colorado Division of Water Resources.")
AddGeoLayerViewToGeoMap(GeoLayerID="WaterDistrictLayer",GeoMapID="LegislativeDistrictsMap",GeoLayerViewGroupID="WaterDistrictsGroup",GeoLayerViewID="WaterDistrictLayerView",Name="CO DWR Water District 3",Description="Water District 3 boundary from the Colorado Division of Water Resources",Properties="docPath:layers/co-dwr-water-district-3.md",InsertPosition="Top")
SetGeoLayerViewCategorizedSymbol(GeoMapID="LegislativeDistrictsMap",GeoLayerViewGroupID="WaterDistrictsGroup",GeoLayerViewID="WaterDistrictLayerView",Name="Colorize district",Description="Show Water District 3 in black.",ClassificationAttribute="DISTRICT",Properties="classificationFile:layers/co-dwr-water-district-3-classify-district.csv")
# = = = = = = = = = =
# Counties:  read layer and add to a layer view group.
# GeoLayerViewGroupID: CountiesGroup
#ReadGeoLayerFromGeoJSON(InputFile="layers/counties.geojson",GeoLayerID="CountiesLayer",Name="Colorado Counties",Description="Colorado Counties")
#AddGeoLayerViewGroupToGeoMap(GeoMapID="LegislativeDistrictsMap",GeoLayerViewGroupID="CountiesGroup",Name="Colorado Counties",Description="Colorado Counties",Properties="selectedInitial: true",InsertPosition="Top")
#AddGeoLayerViewToGeoMap(GeoLayerID="CountiesLayer",GeoMapID="LegislativeDistrictsMap",GeoLayerViewGroupID="CountiesGroup",GeoLayerViewID="CountiesLayerView",Name="Colorado Counties",Description="Colorado Counties",Properties="docPath:layers/counties.md")
#SetGeoLayerViewCategorizedSymbol(GeoMapID="LegislativeDistrictsMap",GeoLayerViewGroupID="CountiesGroup",GeoLayerViewID="CountiesLayerView",Name="Colorize counties",Description="Show each county the same color except those that overlap the Poudre",ClassificationAttribute="county",Properties="classificationType:'categorized',classificationFile:'layers/counties-classify-county.csv'")
#SetGeoLayerViewEventHandler(GeoMapID="LegislativeDistrictsMap",GeoLayerViewGroupID="CountiesGroup",GeoLayerViewID="CountiesLayerView",EventType="click",Properties="popupConfigPath:graphs/county-popup-config.json")
# = = = = = = = = = =
# State house districts:  read layer and add to a layer view group.
# GeoLayerViewGroupID: StateLegislativeDistrictsGroup
AddGeoLayerViewGroupToGeoMap(GeoMapID="LegislativeDistrictsMap",GeoLayerViewGroupID="StateLegislativeDistrictsGroup",Name="State Legislative Districts",Description="Colorado State legislative districts",Properties="selectedInitial: true",InsertPosition="Top")
AddGeoLayerViewGroupToGeoMap(GeoMapID="LegislativeDistrictsMap",GeoLayerViewGroupID="StateLegislativeDistrictsGroup",Name="State Legislative Districts",Description="Colorado State legislative districts",Properties="selectedInitial: true",InsertPosition="Top")
ReadGeoLayerFromGeoJSON(InputFile="layers/co-state-house-districts-2011.geojson",GeoLayerID="StateHouseLegislativeDistrictsLayer",Name="State House Districts (2011)",Description="Colorado State House districts (2011)")
AddGeoLayerViewToGeoMap(GeoLayerID="StateHouseLegislativeDistrictsLayer",GeoMapID="LegislativeDistrictsMap",GeoLayerViewGroupID="StateLegislativeDistrictsGroup",GeoLayerViewID="StateHouseDistrictsLayerView",Name="State House Districts (2011)",Description="Colorado State House districts from 2011 redistricting",Properties="docPath:layers/co-state-house-districts-2011.md")
SetGeoLayerViewCategorizedSymbol(GeoMapID="LegislativeDistrictsMap",GeoLayerViewGroupID="StateLegislativeDistrictsGroup",GeoLayerViewID="StateHouseDistrictsLayerView",Name="Colorize state house districts",Description="Show each district the same color except those that overlap the Poudre",ClassificationAttribute="District_N",Properties="classificationType:'categorized',classificationFile:'layers/co-state-house-districts-classify-district.csv'")
# Currently no graphs
#SetGeoLayerViewEventHandler(GeoMapID="LegislativeDistrictsMap",GeoLayerViewGroupID="StateLegislativeDistrictsGroup",GeoLayerViewID="StateHouseDistrictsLayerView",EventType="click",Properties="popupConfigPath:graphs/county-popup-config.json")
# = = = = = = = = = =
# State senate districts:  read layer and add to a layer view group.
# GeoLayerViewGroupID: StateLegislativeDistrictsGroup
ReadGeoLayerFromGeoJSON(InputFile="layers/co-state-senate-districts-2011.geojson",GeoLayerID="StateSenateLegislativeDistrictsLayer",Name="State Senate Districts (2011)",Description="Colorado State Senate districts (2011)")
AddGeoLayerViewToGeoMap(GeoLayerID="StateSenateLegislativeDistrictsLayer",GeoMapID="LegislativeDistrictsMap",GeoLayerViewGroupID="StateLegislativeDistrictsGroup",GeoLayerViewID="StateSenateDistrictsLayerView",Name="State Senate Districts (2011)",Description="Colorado State Senate districts from 2011 redistricting",Properties="docPath:layers/co-state-senate-districts-2011.md")
SetGeoLayerViewCategorizedSymbol(GeoMapID="LegislativeDistrictsMap",GeoLayerViewGroupID="StateLegislativeDistrictsGroup",GeoLayerViewID="StateSenateDistrictsLayerView",Name="Colorize state senate districts",Description="Show each district the same color except those that overlap the Poudre",ClassificationAttribute="District_N",Properties="classificationType:'categorized',classificationFile:'layers/co-state-senate-districts-classify-district.csv'")
# Currently no graphs
#SetGeoLayerViewEventHandler(GeoMapID="LegislativeDistrictsMap",GeoLayerViewGroupID="StateLegislativeDistrictsGroup",GeoLayerViewID="StateSenateDistrictsLayerView",EventType="click",Properties="popupConfigPath:graphs/county-popup-config.json")
# = = = = = = = = = =
# Write the map project file and copy layers to the location needed by the web application.
# - follow InfoMapper conventions
WriteGeoMapProjectToJSON(GeoMapProjectID="LegislativeDistrictsProject",Indent="2",OutputFile="legislative-districts-map.json")
CreateFolder(Folder="${MapFolder}/layers",CreateParentFolders="True",IfFolderExists="Ignore")
CopyFile(SourceFile="legislative-districts-map.json",DestinationFile="${MapFolder}/legislative-districts-map.json")
CopyFile(SourceFile="legislative-districts-map.md",DestinationFile="${MapFolder}/legislative-districts-map.md")
# -----
# Layers
CopyFile(SourceFile="layers/co-dwr-water-division.geojson",DestinationFile="${MapFolder}/layers/co-dwr-water-division.geojson")
CopyFile(SourceFile="layers/co-dwr-water-division-classify-division.csv",DestinationFile="${MapFolder}/layers/co-dwr-water-division-classify-division.csv")
#
CopyFile(SourceFile="layers/co-dwr-water-district-3.geojson",DestinationFile="${MapFolder}/layers/co-dwr-water-district-3.geojson")
CopyFile(SourceFile="layers/co-dwr-water-district-3-classify-district.csv",DestinationFile="${MapFolder}/layers/co-dwr-water-district-3-classify-district.csv")
#
#CopyFile(SourceFile="layers/counties.geojson",DestinationFile="${MapFolder}/layers/counties.geojson")
#CopyFile(SourceFile="layers/counties-classify-county.csv",DestinationFile="${MapFolder}/layers/counties-classify-county.csv")
#
CopyFile(SourceFile="layers/co-state-house-districts-2011.geojson",DestinationFile="${MapFolder}/layers/co-state-house-districts-2011.geojson")
CopyFile(SourceFile="layers/co-state-house-districts-classify-district.csv",DestinationFile="${MapFolder}/layers/co-state-house-districts-classify-district.csv")
CopyFile(SourceFile="layers/co-state-house-districts-2011.md",DestinationFile="${MapFolder}/layers/co-state-house-districts-2011.md")
#
CopyFile(SourceFile="layers/co-state-senate-districts-2011.geojson",DestinationFile="${MapFolder}/layers/co-state-senate-districts-2011.geojson")
CopyFile(SourceFile="layers/co-state-senate-districts-classify-district.csv",DestinationFile="${MapFolder}/layers/co-state-senate-districts-classify-district.csv")
CopyFile(SourceFile="layers/co-state-senate-districts-2011.md",DestinationFile="${MapFolder}/layers/co-state-senate-districts-2011.md")
