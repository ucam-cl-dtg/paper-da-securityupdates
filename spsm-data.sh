#!/bin/bash

./spsm-submission.sh

cp -R spsm-submission/* spsm-data/
cp versions.py spsm-data/
cp version_dates* spsm-data/
cp /home/drt24/git/lib/latex_value/latex_value.py spsm-data/
cp /home/drt24/git/da/graphing/{dahelpers,iso8601,os-version,ddict,contribution_analysis,operator_analysis,manufacturer_model_analysis,version_tools,version_security,plot_tools,iohelpers,device_data_analysis}.py spsm-data/
cp -R /home/drt24/Documents/androidvulnerabilities spsm-data/
