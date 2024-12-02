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
	

