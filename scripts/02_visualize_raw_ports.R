################################################################################
# Visualize ports
################################################################################
#
# Juan Carlos Villaseñor-Derbez
# jc_villasenor@miami.edu
# date
#
# Loads the raw ports data and visualizes them
#
################################################################################

## SET UP ######################################################################

# Load packages ----------------------------------------------------------------
pacman::p_load(
  here,
  tidyverse,
  mapview,
  sf,
  rnaturalearth
)

# Load data --------------------------------------------------------------------
# Port data
ports <- read_csv(here("data", "raw", "mexican_ports.csv")) %>%
  drop_na(port_id)

# Mexico basemap
mexico <- ne_countries(scale = "medium", country = "Mexico", returnclass = "sf")

## PROCESSING ##################################################################

# Convert to sf object
ports_sf <- st_as_sf(ports, coords = c("longitude", "latitude"), crs = 4326, remove = FALSE)

## VISUALIZE ###################################################################

# X ----------------------------------------------------------------------------
# Plot
ggplot(data = mexico) +
  geom_sf() +
  geom_sf(data = ports_sf, color = "red", size = 2, alpha = 0.7) +
  theme_minimal() +
  labs(title = "Mexican Ports", x = "Longitude", y = "Latitude")

# Interactive
mapview(ports_sf)








