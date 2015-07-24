#!/bin/bash

./spsm-submission.sh

cp -Rp spsm-submission/* spsm-data/
cp -p versions.py spsm-data/
cp -p version_dates* spsm-data/
cp -p /home/drt24/git/lib/latex_value/latex_value.py spsm-data/
cp -p /home/drt24/git/da/graphing/{dahelpers,iso8601,os-version,ddict,contribution_analysis,operator_analysis,manufacturer_model_analysis,version_tools,version_security,plot_tools,iohelpers,device_data_analysis}.py spsm-data/
cp -Rfp /home/drt24/Documents/androidvulnerabilities spsm-data/
cp -p data-submission.txt spsm-data/
