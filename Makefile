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
    # Create an empty directory in the project directory called 'report'
	mkdir -p report
    
# Run the Docker container with the 'report' directory mounted to '/home/rstudio/project/report' inside the container 
	docker run --rm -v "$(PWD)/report:/home/rstudio/project/report" --workdir /home/rstudio/project yueran016/final_report:latest Rscript /home/rstudio/project/code/03_render_report.R

