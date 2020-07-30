#! /usr/bin/env bash



set -x
echo "runner script... starting R Studio"
/init &
cd
mkdir /home/jovyan/rlib/


######################
# Run extra commands #
######################

$@