#! /usr/bin/env bash


eval "$('conda' 'shell.bash' 'hook' 2> /dev/null)"
conda create -p /template-r-env -y
conda activate /template-r-env
conda install -c conda-forge -c r r-tidyverse r-ggplot2 r-ncdf4 r-rgdal r-irkernel  ipykernel -y
echo "install of r env complete"