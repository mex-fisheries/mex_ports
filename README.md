# A geospatial dataset of Mexican ports
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.15778575.svg)](https://doi.org/10.5281/zenodo.15778575)

By: Emma Zgonena, Renato Molina & Juan Carlos Villaseñor-Derbez

Cite as: Zgonena et al., 2025. A geospatial dataset of Mexican ports. DOI: [10.5281/zenodo.15778574](https://zenodo.org/records/15778575#:~:text=10.5281/zenodo.15778574)

## About
This repository is still in development. It will contain data and code to a geospatial dataset of the major ports of Mexico. It is intended to interface with other data in [mex_fisheries](https://github.com/jcvdav/mex_fisheries), such as vessel- and port-level landings information.

155 have been identified in mexican_ports.csv, two of which are on lakes and therefore are NOT costline ports. This brings the total to 153 coastline ports and 51 of these ports can be matched to ports to the mex_large_scale_landing_ports.csv dataset. This is reflected in the mex_ports_dictionary.csv file. 17 ports found in mex_large_scale_landing_ports.csv cannot be accurately matched to mexican_ports.csv obtained from ‘catastro.pdf’.

### How the data are built
The mexican_ports.csv data set is obtained from a file in the ‘data’ folder titled ‘catastro.pdf’ which contains information on Mexico ports from the Mexican Secretaria De Comunicaciones y Transportes. 

### Column specifications
- `port_id`: numeric. 5-digit numeric code that acts as a unique identifier for each port.

