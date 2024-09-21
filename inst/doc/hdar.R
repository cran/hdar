## ----eval = FALSE-------------------------------------------------------------
#  # Install stable hdar from CRAN
#  if(!require("hdar")){install.packages("hdar")}
#  # or develop version from GitHub
#  # devtools::install_github("eea/hdar@develop")
#  
#  # Load the hdar package
#  library(hdar)

## ----eval=FALSE---------------------------------------------------------------
#  # Define your username and password
#  username <- "your_username"
#  password <- "your_password"
#  
#  # Create an instance of the Client class and save credentials to a config file
#  # The save_credentials parameter is optional and defaults to FALSE
#  client <- Client$new(username, password, save_credentials = TRUE)

## ----eval=FALSE---------------------------------------------------------------
#  # Create an instance of the Client class without passing credentials
#  client <- Client$new()

## ----eval=FALSE---------------------------------------------------------------
#  # Example method to check authentication by getting the auth token
#  client$get_token()

## ----eval=FALSE---------------------------------------------------------------
#  client$show_terms()

## ----eval=FALSE---------------------------------------------------------------
#  client$terms_and_conditions()
#                                                term_id accepted
#  1                           Copernicus_General_License     TRUE
#  2                          Copernicus_Sentinel_License     TRUE
#  3                       EUMETSAT_Core_Products_Licence     TRUE
#  4                     EUMETSAT_Copernicus_Data_Licence     TRUE
#  5  Copernicus_DEM_Instance_COP-DEM-GLO-90-F_Global_90m     TRUE
#  6  Copernicus_DEM_Instance_COP-DEM-GLO-30-F_Global_30m     TRUE
#  7                             Copernicus_ECMWF_License     TRUE
#  8       Copernicus_Land_Monitoring_Service_Data_Policy     TRUE
#  9            Copernicus_Marine_Service_Product_License     TRUE
#  10                        CNES_Open_2.0_ETALAB_Licence     TRUE

## ----eval=FALSE---------------------------------------------------------------
#  # retrieving the full list can take about 2 minutes!
#  all_datasets <- client$datasets()
#  
#  # list all datasets IDs on WEkEO
#  sapply(filtered_datasets,FUN = function(x){x$dataset_id})

## ----eval=FALSE---------------------------------------------------------------
#  pattern <- "Seasonal Trajectories"
#  filtered_datasets <- client$datasets(pattern)
#  
#  # list dataset IDs
#  sapply(filtered_datasets,FUN = function(x){x$dataset_id})
#  [1] "EO:EEA:DAT:CLMS_HRVPP_VPP-LAEA" "EO:EEA:DAT:CLMS_HRVPP_ST"       "EO:EEA:DAT:CLMS_HRVPP_ST-LAEA"
#  [4] "EO:EEA:DAT:CLMS_HRVPP_VPP"
#  
#  pattern <- "Baltic"
#  filtered_datasets <- client$datasets(pattern)
#  
#  # list dataset IDs
#  sapply(filtered_datasets,FUN = function(x){x$dataset_id})
#   [1] "EO:MO:DAT:BALTICSEA_ANALYSISFORECAST_BGC_003_007:cmems_mod_bal_bgc-pp_anfc_P1D-i_202311"
#   [2] "EO:MO:DAT:NWSHELF_MULTIYEAR_PHY_004_009:cmems_mod_nws_phy-sst_my_7km-2D_PT1H-i_202112"
#   [3] "EO:MO:DAT:OCEANCOLOUR_BAL_BGC_L4_MY_009_134:cmems_obs-oc_bal_bgc-plankton_my_l4-multi-1km_P1M_202211"
#   [4] "EO:MO:DAT:SST_BAL_PHY_SUBSKIN_L4_NRT_010_034:cmems_obs-sst_bal_phy-subskin_nrt_l4_PT1H-m_202211"
#   [5] "EO:MO:DAT:BALTICSEA_MULTIYEAR_PHY_003_011:cmems_mod_bal_phy_my_P1Y-m_202303"
#   [6] "EO:MO:DAT:OCEANCOLOUR_BAL_BGC_L3_NRT_009_131:cmems_obs-oc_bal_bgc-transp_nrt_l3-olci-300m_P1D_202207"
#   [7] "EO:MO:DAT:BALTICSEA_MULTIYEAR_BGC_003_012:cmems_mod_bal_bgc_my_P1Y-m_202303"
#   [8] "EO:MO:DAT:SST_BAL_SST_L4_REP_OBSERVATIONS_010_016:DMI_BAL_SST_L4_REP_OBSERVATIONS_010_016_202012"
#   [9] "EO:MO:DAT:BALTICSEA_ANALYSISFORECAST_PHY_003_006:cmems_mod_bal_phy_anfc_PT15M-i_202311"
#  [10] "EO:MO:DAT:OCEANCOLOUR_BAL_BGC_L3_MY_009_133:cmems_obs-oc_bal_bgc-plankton_my_l3-multi-1km_P1D_202207"
#  [11] "EO:MO:DAT:SST_BAL_PHY_L3S_MY_010_040:cmems_obs-sst_bal_phy_my_l3s_P1D-m_202211"
#  [12] "EO:MO:DAT:SEAICE_BAL_SEAICE_L4_NRT_OBSERVATIONS_011_004:FMI-BAL-SEAICE_THICK-L4-NRT-OBS"
#  [13] "EO:MO:DAT:SEAICE_BAL_PHY_L4_MY_011_019:cmems_obs-si_bal_seaice-conc_my_1km_202112"
#  [14] "EO:MO:DAT:BALTICSEA_ANALYSISFORECAST_WAV_003_010:cmems_mod_bal_wav_anfc_PT1H-i_202311"
#  [15] "EO:MO:DAT:BALTICSEA_REANALYSIS_WAV_003_015:dataset-bal-reanalysis-wav-hourly_202003"
#  [16] "EO:MO:DAT:OCEANCOLOUR_BAL_BGC_L4_NRT_009_132:cmems_obs-oc_bal_bgc-plankton_nrt_l4-olci-300m_P1M_202207"
#  [17] "EO:MO:DAT:SST_BAL_SST_L3S_NRT_OBSERVATIONS_010_032:DMI-BALTIC-SST-L3S-NRT-OBS_FULL_TIME_SERIE_201904"
#  

## ----eval=FALSE---------------------------------------------------------------
#  client$datasets("EO:ECMWF:DAT:DERIVED_NEAR_SURFACE_METEOROLOGICAL_VARIABLES")
#  [[1]]
#  [[1]]$terms
#  [[1]]$terms[[1]]
#  [1] "Copernicus_ECMWF_License"
#  
#  [[1]]$dataset_id
#  [1] "EO:ECMWF:DAT:DERIVED_NEAR_SURFACE_METEOROLOGICAL_VARIABLES"
#  
#  [[1]]$title
#  [1] "Near surface meteorological variables from 1979 to 2019 derived from bias-corrected reanalysis"
#  
#  [[1]]$abstract
#  [1] "This dataset provides bias-corrected reconstruction of near-surface meteorological variables derived from the fifth generation of the European Centre for Medium-Range Weather Forecasts  (ECMWF) atmospheric reanalyses (ERA5). It is intended to be used as a meteorological forcing dataset for land surface and hydrological models. \nThe dataset has been obtained using the same methodology used to derive the widely used water, energy and climate change (WATCH) forcing data, and is thus also referred to as WATCH Forcing Data methodology applied to ERA5 (WFDE5). The data are derived from the ERA5 reanalysis product that have been re-gridded to a half-degree resolution. Data have been adjusted using an elevation correction and monthly-scale bias corrections based on Climatic Research Unit (CRU) data (for temperature, diurnal temperature range, cloud-cover, wet days number and precipitation fields) and Global Precipitation Climatology Centre (GPCC) data (for precipitation fields only). Additional corrections are included for varying atmospheric aerosol-loading and separate precipitation gauge observations. For full details please refer to the product user-guide.\nThis dataset was produced on behalf of Copernicus Climate Change Service (C3S) and was generated entirely within the Climate Data Store (CDS) Toolbox. The toolbox source code is provided in the documentation tab.\n\nVariables in the dataset/application are:\nGrid-point altitude, Near-surface air temperature, Near-surface specific humidity, Near-surface wind speed, Rainfall flux, Snowfall flux, Surface air pressure, Surface downwelling longwave radiation, Surface downwelling shortwave radiation"
#  
#  [[1]]$doi
#  NULL
#  
#  [[1]]$thumbnails
#  [1] "https://datastore.copernicus-climate.eu/c3s/published-forms-v2/c3sprod/derived-near-surface-meteorological-variables/overview.jpg"
#  

## ----fig.show='hold', echo=FALSE,out.width="45%"------------------------------
knitr::include_graphics(c("WEkEO_UI_JSON_1.png","WEkEO_UI_JSON_2.png"))


## ----echo=TRUE----------------------------------------------------------------
query <- '{
  "dataset_id": "EO:ECMWF:DAT:CEMS_GLOFAS_HISTORICAL",
  "system_version": [
    "version_4_0"
  ],
  "hydrological_model": [
    "lisflood"
  ],
  "product_type": [
    "consolidated"
  ],
  "variable": [
    "river_discharge_in_the_last_24_hours"
  ],
  "hyear": [
    "2024"
  ],
  "hmonth": [
    "june"
  ],
  "hday": [
    "01"
  ],
  "format": "grib",
  "bbox": [
    11.77115199576009,
    44.56907885098417,
    13.0263737724595,
    45.40384015467251
  ],
  "itemsPerPage": 200,
  "startIndex": 0
}'

## ----eval = FALSE-------------------------------------------------------------
#  # client <- Client$new()
#  query_template <- client$generate_query_template("EO:EEA:DAT:CLMS_HRVPP_ST")
#  query_template
#  {
#    "dataset_id": "EO:EEA:DAT:CLMS_HRVPP_ST",
#    "uid": "__### Value of string type with pattern: [\\w-]+",
#    "productType": "PPI",
#    "platformSerialIdentifier": "S2A, S2B",
#    "tileId": "__### Value of string type with pattern: [\\w-]+",
#    "productVersion": "__### Value of string type with pattern: [\\w-]+",
#    "resolution": "10",
#    "processingDate": "__### Value of string",
#    "start": "__### Value of string",
#    "end": "__### Value of string",
#    "bbox": [
#      -180,
#      -90,
#      180,
#      90
#    ]
#  }

## ----eval = FALSE-------------------------------------------------------------
#  # convert to list for easier manipulation in R
#  library(jsonlite)
#  query_template <- fromJSON(query_template, flatten = FALSE)
#  query_template
#  $dataset_id
#  [1] "EO:EEA:DAT:CLMS_HRVPP_ST"
#  
#  $uid
#  [1] "__### Value of string type with pattern: [\\w-]+"
#  
#  $productType
#  [1] "PPI"
#  
#  $platformSerialIdentifier
#  [1] "S2A, S2B"
#  
#  $tileId
#  [1] "__### Value of string type with pattern: [\\w-]+"
#  
#  $productVersion
#  [1] "__### Value of string type with pattern: [\\w-]+"
#  
#  $resolution
#  [1] "10"
#  
#  $processingDate
#  [1] "__### Value of string"
#  
#  $start
#  [1] "__### Value of string"
#  
#  $end
#  [1] "__### Value of string"
#  
#  $bbox
#  [1] -180  -90  180   90

## ----eval = FALSE-------------------------------------------------------------
#  # set a new bbox
#  query_template$bbox <- c(11.1090, 46.6210, 11.2090, 46.7210)
#  
#  # limit the time range
#  query_template$start <- "2018-03-01T00:00:00.000Z"
#  query_template$end   <- "2018-05-31T00:00:00.000Z"
#  query_template
#  $dataset_id
#  [1] "EO:EEA:DAT:CLMS_HRVPP_ST"
#  
#  $uid
#  [1] "__### Value of string type with pattern: [\\w-]+"
#  
#  $productType
#  [1] "PPI"
#  
#  $platformSerialIdentifier
#  [1] "S2A, S2B"
#  
#  $tileId
#  [1] "__### Value of string type with pattern: [\\w-]+"
#  
#  $productVersion
#  [1] "__### Value of string type with pattern: [\\w-]+"
#  
#  $resolution
#  [1] "10"
#  
#  $processingDate
#  [1] "__### Value of string"
#  
#  $start
#  [1] "2018-03-01T00:00:00.000Z"
#  
#  $end
#  [1] "2018-05-31T00:00:00.000Z"
#  
#  $bbox
#  [1] 11.109 46.621 11.209 46.721

## ----eval = FALSE-------------------------------------------------------------
#  # convert to JSON format
#  query_template <- toJSON(query_template, auto_unbox = TRUE) # don't forget to put auto_unbox = TRUE

## ----eval = FALSE-------------------------------------------------------------
#  # Assuming 'client' is already created and authenticated, 'query' is defined
#  matches <- client$search(query_template)
#  [1] "Found 9 files"
#  [1] "Total Size 1.8 GB"
#  
#  sapply(matches$results,FUN = function(x){x$id})
#  [1] "ST_20180301T000000_S2_T32TPS-010m_V101_PPI" "ST_20180311T000000_S2_T32TPS-010m_V101_PPI"
#  [3] "ST_20180321T000000_S2_T32TPS-010m_V101_PPI" "ST_20180401T000000_S2_T32TPS-010m_V101_PPI"
#  [5] "ST_20180411T000000_S2_T32TPS-010m_V101_PPI" "ST_20180421T000000_S2_T32TPS-010m_V101_PPI"
#  [7] "ST_20180501T000000_S2_T32TPS-010m_V101_PPI" "ST_20180511T000000_S2_T32TPS-010m_V101_PPI"
#  [9] "ST_20180521T000000_S2_T32TPS-010m_V101_PPI"

## ----eval = FALSE-------------------------------------------------------------
#  # Assuming 'matches' is an instance of SearchResults obtained from the search
#  odir <- tempdir()
#  matches$download(odir)
#  The total size is 1.8 GB . Do you want to proceed? (Y/N):
#  y
#  [1] "[Download] Start"
#  [1] "[Download] Downloading file 1/9"
#  [1] "[Download] Downloading file 2/9"
#  [1] "[Download] Downloading file 3/9"
#  [1] "[Download] Downloading file 4/9"
#  [1] "[Download] Downloading file 5/9"
#  [1] "[Download] Downloading file 6/9"
#  [1] "[Download] Downloading file 7/9"
#  [1] "[Download] Downloading file 8/9"
#  [1] "[Download] Downloading file 9/9"
#  [1] "[Download] DONE"
#  
#  # Assuming 'matches' is an instance of SearchResults obtained from the search
#  list.files(odir)
#  [1] "ST_20180301T000000_S2_T32TPS-010m_V101_PPI.tif" "ST_20180311T000000_S2_T32TPS-010m_V101_PPI.tif"
#  [3] "ST_20180321T000000_S2_T32TPS-010m_V101_PPI.tif" "ST_20180401T000000_S2_T32TPS-010m_V101_PPI.tif"
#  [5] "ST_20180411T000000_S2_T32TPS-010m_V101_PPI.tif" "ST_20180421T000000_S2_T32TPS-010m_V101_PPI.tif"
#  [7] "ST_20180501T000000_S2_T32TPS-010m_V101_PPI.tif" "ST_20180511T000000_S2_T32TPS-010m_V101_PPI.tif"
#  [9] "ST_20180521T000000_S2_T32TPS-010m_V101_PPI.tif"
#  
#  unlink(odir,recursive = TRUE)

