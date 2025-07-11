################################################################################
# Generate a list of most relevant ports used by large scale fishers
################################################################################
#
# Juan Carlos Villaseñor-Derbez
# jc_villasenor@miami.edu
# date
#
# Uses the vessel-level landings data (2018-present) to identify the ports where
# the industrial fleets lands its catch.
#
################################################################################

## SET UP ######################################################################

# Load packages ----------------------------------------------------------------
pacman::p_load(
  here,
  tidyverse
)

# Load data --------------------------------------------------------------------
landings_data <- readRDS("../mex_fisheries/data/mex_landings/clean/mex_conapesca_apertura_2018_present.rds")

## PROCESSING ##################################################################

# X ----------------------------------------------------------------------------
large_scale_ports <- landings_data |> 
  filter(fleet == "large_scale") |> 
  group_by(landing_site, landing_site_key) |> 
  summarize(n_vessels = n_distinct(vessel_rnpa)) |> 
  ungroup() |> 
  arrange(desc(n_vessels))

## EXPORT ######################################################################

# X ----------------------------------------------------------------------------
write_csv(large_scale_ports, here("data", "raw", "mex_large_scale_landing_ports.csv"))
