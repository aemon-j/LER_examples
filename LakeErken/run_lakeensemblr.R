#initial clean up
rm(list = ls())
graphics.off()
cat("\f")

# set working directory
setwd(dirname(rstudioapi::getSourceEditorContext()$path))


library(LakeEnsemblR)

# Set config file
config_file <- "LER_Erken_hourly.yaml"
model <- c("FLake", "GLM", "GOTM", "Simstrat", "MyLake")
# 1. Example - creates directories with all model setup
export_config(config_file = config_file, model = c("FLake", "GLM", "GOTM", "Simstrat", "MyLake"),
              folder = ".")
# 2. Run ensemble lake models
run_ensemble(config_file = config_file,
             model = c("FLake", "GLM", "GOTM", "Simstrat", "MyLake"),
             return_list = FALSE, parallel = FALSE)


## Plot model output using gotmtools/ggplot2
# Extract names of all the variables in netCDF
ncdf <- 'output/ensemble_output.nc'

plot_heatmap(ncdf)