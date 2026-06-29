FROM jupyter/r-notebook:latest

WORKDIR /home/jovyan/work

COPY --chown=jovyan:users . /home/jovyan/work

RUN mamba install --yes \
    'r-dplyr' \
    'r-ggplot2' \
    'r-remotes' \
    'r-readr' \
    'r-stringr' \
    'r-forecast' && \
    mamba clean --all -f -y

RUN R -e "remotes::install_github('rfsaldanha/microdatasus', upgrade = 'never')"

EXPOSE 8888
