
<!-- README.md is generated from README.Rmd. Please edit that file -->

# A geospatial dataset of Mexican ports

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.15778575.svg)](https://doi.org/10.5281/zenodo.15778575)

By: Emma Zgonena, Renato Molina & Juan Carlos Villaseñor-Derbez

**Cite as:** Zgonena et al., 2025. A geospatial dataset of Mexican
ports. DOI:
[10.5281/zenodo.15778574](https://zenodo.org/records/15778575#:~:text=10.5281/zenodo.15778574)

![](README_files/figure-gfm/map-1.png)<!-- -->

## Overview

This repository contains data and code to build a geospatial dataset of
the major ports of Mexico, some of which are included in CONAPESCA’s
landing data. It is intended to interface with other data in
[mex_fisheries](https://github.com/jcvdav/mex_fisheries), such as
vessel- and port-level landings information.

### How the data are built

#### 1) Extract port information and location

The final data, `mex_ports`, is a culmination of information from the
files `mexian_ports.csv` and `mex_large_scale_landing_ports.csv` that
are correlated through `mex_ports_dictionary.csv`.

The information originates from the pdf titled
[`catastro.pdf`](/data/raw/catastro.pdf), which contains information on
Mexican ports from the Mexican Secretaria de Comunicaciones y
Transportes and the Departamento de Catastro, Instalaciones y Recintos.
K+The following key variables were manually extracted from the PDF to
create [`mexian_ports.csv`](/data/raw/mexian_ports.csv):

- The inputs for `port_id` are labeled as ‘Clv. del puerto’ in
  `catastro.pdf`
- The inputs for `municipality_code` (renamed `municipality_id` in final
  `mex_ports` cleaned data) and `municipality_name` are found labeled
  together under ‘Municipio’ in `catastro.pdf`
- The inputs for `port_name` are labeled as `Nombre del Puerto` in
  `catastro.pdf`
- The inputs for `longitude` and `latitude` are labeled as `Longitud`
  and `Latutid` respectively in `catastro.pdf`

> **Note:** 155 individual ports were identified in `mexican_ports.csv`,
> 4 of which are on lakes and therefore are not coastline ports.

#### 2) Identify ports with recorded fisheries landings

The information in `mex_large_scale_landing_ports.csv` is from Mexico’s
fisheries production data. Code showing the extraction is included in
[`01_get_large_scale_ports.R`](/scripts/01_get_large_scale_ports.R). The
data do not include `port_id`, and instead use CONAPESCA’s system of
unique identifiers (`mex_ports_id`). We manually built a dictionary
([`mex_ports_dictionary.csv`](/data/raw/mex_ports_dictionary.csv)) that
allowed us to link `port_id`s to `landinge_site_keys`.

> **Note:** 51 of the total ports in `mexican_ports.csv` can be matched
> to ports in `mex_large_scale_landing_ports.csv`

#### 3) Combine data

The final data, [`mex_ports`](/data/clean/), was created using the
script titled [`03_combine_sources.R`](/scripts/03_combine_sources.R).

This script cleans and retains relevant columns from the dictionary,
omitting lake ports (4) that are not relevant to the set. It then
combines the objects through their corresponding `port_id`. Finally, the
data is standardized in name and made further accessible through the
addition of tabular and geospatial file versions.

> **Note:** The final data set has 151 ports, of which 55 can be matched
> to CONAPESCA’s `mex_ports_id`

## Metadata

### Data files

The data are available in three formats:

- **[mex_ports.gpkg](https://github.com/mex-fisheries/mex_ports/raw/refs/heads/main/data/clean/mex_ports.gpkg)**:
  A geopackage in `EPSG:4326`. This is the recommended source because it
  is already a spatial object.
- [mex_ports.rds](https://github.com/mex-fisheries/mex_ports/raw/refs/heads/main/data/clean/mex_ports.rds):
  Tabular format as an R object.
- [mex_ports.csv](https://github.com/mex-fisheries/mex_ports/raw/refs/heads/main/data/clean/mex_ports.csv):
  Tabular format as a comma-separated values file.

### Column specifications across all are the same

- `municipality_id` or `municipality_code`: character. 5-digit code that
  acts as a unique identifier for each municipality.
- `municipality_name`: character. Official name of municipality.
- `port_id`: character. 5-digit code that acts as a unique identifier
  for each port.
- `port_name`: character. Official name of port. Originally labeled
  under ‘Nombre del Puerto’.
- `landing_site_id`: character. 3-digit alphanumeric string that acts as
  a unique identifier for a what CONAPESCA considers a landing site.
  Note that ports not matched to a landing site id will show `NA` in
  this column.
- `latitude`: numeric. Latitude in decimal degrees for the location of
  the port.
- `longitude`: numeric. Longitude in decimal degrees for the location of
  the port.

## Using the data
