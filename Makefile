report.html: report.Rmd code/03_render_report.R
	Rscript code/03_render_report.R
  
output/table_one.rds:
	Rscript code/01_tabular_analysis.R
	
output/figure_one.rds:
	Rscript code/02_figure_generate.R

.PHONY: clean
clean:
	rm -f output/*.rds && rm -f report.html
	
.PHONY: install
install:
    R -e "renv::restore()"
