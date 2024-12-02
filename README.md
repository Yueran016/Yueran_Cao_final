# Yueran_Cao_final

# Association between Mental Health & Work Report

## Overview

This repository contains the analysis for the project "Association between Mental Health & Work." The project aims to explore the implications of remote work on employees' mental well-being using a dataset of 5,000 records from various industries and regions.

## Repository Contents

- **`code/`**: Directory containing R scripts used for the analysis.
  - **`01_tabular_analysis.R`**: Script for generating the summary table.
  - **`02_figure_generate.R`**: Script for creating the figures.
  - **`03_render_report.R`**: Script for rendering the final report.
- **`output/`**: Directory containing output files.
  - **`table_one.rds`**: Saved RDS file for the summary table.
  - **`figure_one.rds`**: Saved RDS file for the generated plot.
- **`report.Rmd`**: R Markdown file for the final report.
- **`Makefile`**: Makefile for automating the generation of the report and outputs.
- **`README.md`**: This file, describing the repository contents and instructions.

## Generating the Final Report

You can generate the final report by running the Makefile, which will execute the necessary scripts to create the required outputs and render the report.

### Step-by-Step Instructions
## Setting Up the Project

**To set up the project environment, follow these steps:
1. Clone the repository.
2. Open an R session in the project directory.
3. Run `renv::restore()` to install the required packages as specified in the `renv.lock` file.**

1. **Ensure Required Packages are Installed**:
   - Install the required R packages:
     ```r
     library(c("here", "readr", "ggplot2", "dplyr", "gtsummary", "rmarkdown"))
     ```

2. **Run the Makefile**:
   - Navigate to the project directory in your terminal and run the Makefile:
     ```sh
     make
     ```

   This will execute the following steps:
   - Run `code/01_tabular_analysis.R` to generate the summary table and save it as `output/table_one.rds`.
   - Run `code/02_figure_generate.R` to create the figure and save it as `output/figure_one.rds`.
   - Run `code/03_render_report.R` to render the R Markdown file and generate the final report `report.html`.

3. **View the Final Report**:
   - After running the Makefile, open `report.html` to view the final report.

