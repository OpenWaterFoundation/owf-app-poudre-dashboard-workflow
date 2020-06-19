#!/bin/sh

# Copy  files to 'info-mapper/src/assets/app' folder.
# Brute force way to provide content to InfoMapper and version control.
# A better way would be to symbolically link InfoMapper 'app' to this `web` folder,
# but that does not seem to work.
# Folder for this script is similar to:
#   /c/Users/user/owf-dev/InfoMapper-Poudre/git-repos/owf-infomapper-poudre/web

# Supporting functions, alphabetized.

checkHistoricalSimulationFolder() {
  # Make sure that the receiving folder exists
  folder=${appFolder}/data-maps/HistoricalSimulation
  if [ ! -d "${folder}" ]; then
    echo "Creating folder ${folder}"
    mkdir -p ${folder}
  fi
}

checkBasinEntitiesFolder() {
  # Make sure that the receiving folder exists
  folder=${appFolder}/data-maps/BasinEntities
  if [ ! -d "${folder}" ]; then
    echo "Creating folder ${folder}"
    mkdir -p ${folder}
  fi
}

checkCurrentConditionsFolder() {
  # Make sure that the receiving folder exists
  folder=${appFolder}/data-maps/CurrentConditions
  if [ ! -d "${folder}" ]; then
    echo "Creating folder ${folder}"
    mkdir -p ${folder}
  fi
}

checkHistoricalDataFolder() {
  # Make sure that the receiving folder exists
  folder=${appFolder}/data-maps/HistoricalData
  if [ ! -d "${folder}" ]; then
    echo "Creating folder ${folder}"
    mkdir -p ${folder}
  fi
}

copy_BasinEntities_Administrative_WaterDistricts() {
  checkBasinEntitiesFolder

  # Copy stream reaches map folder and files
  cp -rv ${scriptFolder}/data-maps/BasinEntities/Administrative-CoDwrWaterDistricts ${folder}
}

copy_BasinEntities_Agriculture_Dairies() {
  checkBasinEntitiesFolder

  # Copy dairies map folder and files
  cp -rv ${scriptFolder}/data-maps/BasinEntities/Agriculture-Dairies ${folder}
}

copy_BasinEntities_Agriculture_Ditches() {
  checkBasinEntitiesFolder

  # Copy ditches map folder and files
  cp -rv ${scriptFolder}/data-maps/BasinEntities/Agriculture-Ditches ${folder}
}

copy_BasinEntities_Education_Organizations() {
  checkBasinEntitiesFolder

  # Copy instream flow reaches map folder and files
  cp -rv ${scriptFolder}/data-maps/BasinEntities/Education-Organizations ${folder}
}

copy_BasinEntities_Environment_InstreamFlowReaches() {
  checkBasinEntitiesFolder

  # Copy instream flow reaches map folder and files
  cp -rv ${scriptFolder}/data-maps/BasinEntities/Environment-InstreamFlowReaches ${folder}
}

copy_BasinEntities_Environment_Organizations() {
  checkBasinEntitiesFolder

  # Copy environment organizations map folder and files
  cp -rv ${scriptFolder}/data-maps/BasinEntities/Environment-Organizations ${folder}
}

copy_BasinEntities_Industry_Breweries() {
  checkBasinEntitiesFolder

  # Copy breweries map folder and files
  cp -rv ${scriptFolder}/data-maps/BasinEntities/Industry-Breweries ${folder}
}

copy_BasinEntities_Municipal_Municipalities() {
  checkBasinEntitiesFolder

  # Copy breweries map folder and files
  cp -rv ${scriptFolder}/data-maps/BasinEntities/Municipal-Municipalities ${folder}
}

copy_BasinEntities_Physical_Counties() {
  checkBasinEntitiesFolder

  # Copy counties map folder and files
  cp -rv ${scriptFolder}/data-maps/BasinEntities/Physical-Counties ${folder}
}

copy_BasinEntities_Physical_StreamReaches() {
  checkBasinEntitiesFolder

  # Copy stream reaches map folder and files
  cp -rv ${scriptFolder}/data-maps/BasinEntities/Physical-StreamReaches ${folder}
}

copy_BasinEntities_Recreation_BoatingOrganizations() {
  checkBasinEntitiesFolder

  # Copy environment organizations map folder and files
  cp -rv ${scriptFolder}/data-maps/BasinEntities/Recreation-BoatingOrganizations ${folder}
}

copy_BasinEntities_WaterSupply_WaterProviders() {
  checkBasinEntitiesFolder

  # Copy environment organizations map folder and files
  cp -rv ${scriptFolder}/data-maps/BasinEntities/WaterSupply-WaterProviders ${folder}
}

copy_CurrentConditions_WaterSupply_Streamflow() {
  checkCurrentConditionsFolder

  # Copy current conditions streamflow folder and files
  cp -rv ${scriptFolder}/data-maps/CurrentConditions/WaterSupply-Streamflow ${folder}
}

copy_HistoricalData_Agriculture_IrrigatedLands() {
  checkHistoricalDataFolder

  # Copy irrigated lands map folder and files
  cp -rv ${scriptFolder}/data-maps/HistoricalData/Agriculture-IrrigatedLands ${folder}
}

copyMainConfig() {
  # Make sure that folders exist
  if [ ! -d "${appFolder}" ]; then
    echo "Creating folder ${appFolder}"
    mkdir -p ${appFolder}
  fi

  # Main application configuration file
  cp -v ${scriptFolder}/app-config.json ${appFolder}
  # Content pages
  cp -rv ${scriptFolder}/content-pages ${appFolder}
  # Images
  cp -rv ${scriptFolder}/img ${appFolder}
}

runInteractive() {
  while true; do
    echo ""
    echo "Enter an option to update application data.  Menus are listed in order of application."
    echo ""
    echo "App. Config & Content:    c.     Copy main configuration files."
    echo "Basin Entities:          ec.     Copy Physical - Counties files."
    echo "                         es.     Copy Physical - StreamReaches files."
    echo "                         ew.     Copy Administrative - CoDwrWaterDistricts files."
    echo "                         eda.    Copy Agriculture - Dairies files."
    echo "                         edi.    Copy Agriculture - Ditches files."
    echo "                         edu.    Copy Education - Organizations files."
    echo "                         ei.     Copy Environment - InstreamFlowReaches files."
    echo "                         eeo.    Copy Environment - Organizations files."
    echo "                         ebrew.  Copy Industry - Breweries files."
    echo "                         emuni.  Copy Municipal - Municipalities files."
    echo "                         eboat.  Copy Recreation - BoatingOrganizations files."
    echo "                         ewp.    Copy WaterSupply - WaterProviders files."
    echo ""
    echo "Historical Data:         hl.     Copy IrrigatedLands map files."
    echo ""
    echo "Current Conditions:      cs.     Copy Streamflow map files."
    echo ""
    echo "                          a.     Run all copy commands from above."
    echo "                          q.     Quit"
    echo ""
    read -p "Enter command: " answer

    # Organize the following by menu item

    if [ "${answer}" = "a" ]; then
      # Basin Entities
      copy_BasinEntities_Physical_Counties
      copy_BasinEntities_Physical_StreamReaches
      copy_BasinEntities_Administrative_WaterDistricts
      copy_BasinEntities_Agriculture_Dairies
      copy_BasinEntities_Agriculture_Ditches
      copy_BasinEntities_Education_Organizations
      copy_BasinEntities_Environment_InstreamFlowReaches
      copy_BasinEntities_Environment_Organizations
      copy_BasinEntities_Industry_Breweries
      copy_BasinEntities_Recreation_Boating
      copy_BasinEntities_WaterSupply_WaterProviders
      # Historical Data
      copy_HistoricalData_Agriculture_IrrigatedLands
      # Current Conditions
      copy_CurrentConditions_WaterSupply_Streamflow
    elif [ "${answer}" = "c" ]; then
      copyMainConfig
    elif [ "${answer}" = "q" ]; then
      break

    # Basin Entities

    elif [ "${answer}" = "ec" ]; then
      copy_BasinEntities_Physical_Counties
    elif [ "${answer}" = "es" ]; then
      copy_BasinEntities_Physical_StreamReaches
    elif [ "${answer}" = "ew" ]; then
      copy_BasinEntities_Administrative_WaterDistricts
    elif [ "${answer}" = "eda" ]; then
      copy_BasinEntities_Agriculture_Dairies
    elif [ "${answer}" = "edi" ]; then
      copy_BasinEntities_Agriculture_Ditches
    elif [ "${answer}" = "edu" ]; then
      copy_BasinEntities_Education_Organizations
    elif [ "${answer}" = "ei" ]; then
      copy_BasinEntities_Environment_InstreamFlowReaches
    elif [ "${answer}" = "eeo" ]; then
      copy_BasinEntities_Environment_Organizations
    elif [ "${answer}" = "ebrew" ]; then
      copy_BasinEntities_Industry_Breweries
    elif [ "${answer}" = "emuni" ]; then
      copy_BasinEntities_Municipal_Municipalities
    elif [ "${answer}" = "eboat" ]; then
      copy_BasinEntities_Recreation_BoatingOrganizations
    elif [ "${answer}" = "ewp" ]; then
      copy_BasinEntities_WaterSupply_WaterProviders

    # Historical Data

    elif [ "${answer}" = "hl" ]; then
      copy_HistoricalData_Agriculture_IrrigatedLands

    # Current Conditions

    elif [ "${answer}" = "cs" ]; then
      copy_CurrentConditions_WaterSupply_Streamflow

    fi
  done
  return 0
}

# Entry point into script.

scriptFolder=$(cd $(dirname "$0") && pwd)
repoFolder=$(dirname $scriptFolder)
gitReposFolder=$(dirname $repoFolder)
infoMapperRepoFolder=${gitReposFolder}/owf-app-info-mapper-ng
infoMapperFolder=${infoMapperRepoFolder}/info-mapper
appFolder=${infoMapperFolder}/src/assets/app

echo "Folders for application:"
echo "scriptFolder=${scriptFolder}"
echo "repoFolder=${repoFolder}"
echo "gitReposFolder=${gitReposFolder}"
echo "infoMapperRepoFolder=${infoMapperRepoFolder}"
echo "infoMapperFolder=${infoMapperRepoFolder}"
echo "appFolder=${appFolder}"

# Run interactively. with script exit from that function
runInteractive