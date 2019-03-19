FROM rocker/r-ver:3.5.3

# install build dependencies
RUN set -ex; \
    \
    buildDeps=" \
        curl \
        libcurl4-openssl-dev \
        libssl-dev \
        wget \
        zlib1g-dev \
    " ; \
    \
    apt-get update; \
    apt-get install -y $buildDeps --no-install-recommends; \
    rm -rf /var/lib/apt/lists/*;

# install packrat
RUN R -e 'install.packages("packrat", repos="http://cran.rstudio.com", dependencies=TRUE, lib="/usr/local/lib/R/site-library");'

# copy lock file & install deps
COPY packrat/packrat.* /opt/app/packrat/
RUN R -e 'packrat::restore(project="/opt/app");'

# copy the rest of the directory
COPY . /opt/app

# open a port for the web application
EXPOSE 8000

# set the default directory to be in when the container starts
WORKDIR /opt/app

# set the default command to run when the container starts
CMD ["R", "-e", "library(shiny); runApp('spirograph_shiny.R', \
  port=8000, host='0.0.0.0')"]

