#! /usr/bin/env bash

echo "run prepare home space script"
/usr/bin/prepare_homespace.sh

echo "create R env"

# Create R conda env
eval "$('conda' 'shell.bash' 'hook' 2> /dev/null)"
conda create -n R --clone /template-r-env -y
conda activate R 


echo "Starting R Studio"
/usr/bin/start_rstudio_server.sh 8787 &



######################
# Run extra commands #
######################

$@