all: README.md data/clean/mex_ports.gpkg data/clean/mex_ports.csv data/clean/mex_ports.rds

README.md: README.Rmd data/clean/mex_ports.gpkg data/clean/mex_ports.csv data/clean/mex_ports.rds
		Rscript -e "rmarkdown::render('README.Rmd', quiet = T)"

data/clean/mex_ports.gpkg: scripts/03_combine_sources.R data/raw/mexican_ports.csv data/raw/mex_ports_dictionary.csv
		cd $(<D);Rscript $(<F)

data/clean/mex_ports.csv: scripts/03_combine_sources.R data/raw/mexican_ports.csv data/raw/mex_ports_dictionary.csv
		cd $(<D);Rscript $(<F)

data/clean/mex_ports.rds: scripts/03_combine_sources.R data/raw/mexican_ports.csv data/raw/mex_ports_dictionary.csv
		cd $(<D);Rscript $(<F)

