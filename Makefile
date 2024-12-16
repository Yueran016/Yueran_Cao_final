.PHONY: install
install:
	R -e "renv::restore()"

output/table_one.rds:
	Rscript code/01_tabular_analysis.R
	
output/figure_one.rds:
	Rscript code/02_figure_generate.R

report.html: report.Rmd code/03_render_report.R
	Rscript code/03_render_report.R
	
.PHONY: clean
clean:
		rm -f output/*.rds && rm -f report.html
	
# Target for running the Docker container with mounted volume
.PHONY: docker-run
docker-run:
# Create an empty directory in the project directory called 'mounted'
	mkdir -p mounted
    
# Build and run the Docker container with the empty 'mounted' directory mounted to '/project' inside the container
		docker run --rm \
        -v "$(PWD)/mounted:/project" \
        --workdir /project \
        final_report \
        Rscript /project/code/03_render_report.R

