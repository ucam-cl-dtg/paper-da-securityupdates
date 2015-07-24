#!/bin/bash
cp spsm04-thomas.{pdf,tex,bbl} spsm-submission/
cp security_scoring.tex spsm-submission/
cp countversions.tex spsm-submission/
cp avostats.tex spsm-submission/
cp dastats.tex spsm-submission/
cp -R figures spsm-submission/
~/git/papers/linuxconfig/bin/bibtex-filter.py --input-bibtex securityupdates.bib --input-aux spsm04-thomas.aux --output-bibtex spsm-submission/securityupdates.bib
