#!/bin/bash

./spsm-submission.sh

cp -Rp spsm-submission/* spsm-data/
zip --quiet spsm-data/figures spsm-data/figures/*
cp -p versions.py spsm-data/
cp -p version_dates* spsm-data/
cp -p /home/drt24/git/lib/latex_value/latex_value.py spsm-data/
cp -p /home/drt24/git/da/graphing/{dahelpers,iso8601,os-version,ddict,contribution_analysis,operator_analysis,manufacturer_model_analysis,version_tools,version_security,plot_tools,iohelpers,device_data_analysis}.py spsm-data/
cp -Rfp /home/drt24/Documents/androidvulnerabilities spsm-data/
zip --quiet -r spsm-data/androidvulnerabilities spsm-data/androidvulnerabilities
cp -p data-submission.txt spsm-data/
cp /mnt/nas04-device-analyzer-graphing/csv/{api_gpcomp_diff,api_gpcomp_rdiff,api-versions,first_api_versions,first_os_versions,googleplayapi,gp_per_api_diff,norm_api_gpcomp,security_updates,s_manufacturers,s_models,s_operators,updates}.csv spsm-data/
