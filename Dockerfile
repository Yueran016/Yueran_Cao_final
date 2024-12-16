# Start from the RStudio image
FROM rocker/rstudio

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libfontconfig1-dev

# Install rmarkdown 
RUN R -e "install.packages('rmarkdown')"

# Create a project directory
WORKDIR /home/rstudio/project

# Copy necessary files
COPY renv.lock renv.lock
COPY renv/ renv/
COPY report.Rmd report.Rmd
COPY code/ code/
COPY data/ data/
COPY output/ output/
COPY .Rprofile .Rprofile
COPY Makefile Makefile
COPY README.md README.md


# Set up renv cache
RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE=/home/rstudio/project/renv/.cache

# Restore the R environment using renv 
RUN R -e "install.packages('renv'); renv::restore()"


# Set an environment variable
ENV WHICH_CONFIG=default


# Entry point to create the report and copy it to the report directory
ENTRYPOINT ["R", "-e", "rmarkdown::render('report.Rmd', output_file = '/home/rstudio/project/report.html')"]


