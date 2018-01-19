FROM rocker/r-ver:3.4.3
LABEL maintainer="sanmeet"
RUN export DEBIAN_FRONTEND=noninteractive; apt-get -y update \
 && apt-get install -y git-core \
	libcurl4-openssl-dev \
	libmariadb-client-lgpl-dev \
	libpng-dev \
	libpq-dev \
	libssl-dev \
	libxml2-dev \
	make \
	pandoc \
	pandoc-citeproc
RUN ["install2.r", "-r 'https://cloud.r-project.org'", "googlesheets", "RSiteCatalyst", "Rcpp", "bindr", "xml2", "magrittr", "hms", "R6", "rlang", "rematch", "stringr", "httr", "plyr", "dplyr", "openssl", "assertthat", "digest", "tibble", "bindrcpp", "purrr", "readr", "base64enc", "curl", "mime", "glue", "stringi", "pillar", "cellranger", "jsonlite", "pkgconfig"]
WORKDIR /payload/
COPY [".", "./"]
CMD ["R", "--vanilla", "-f", "RSiteCatalyst.R"]
