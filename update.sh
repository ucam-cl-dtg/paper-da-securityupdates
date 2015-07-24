#!/bin/bash

set -e

fromdir=/mnt/nas04-device-analyzer-graphing/pdf/
pushd figures
cp "$fromdir"norm_api.pdf da_norm_api.pdf
cp "$fromdir"norm_api-notitle.pdf da_norm_api-notitle.pdf
cp "$fromdir"norm_os.pdf da_norm_os.pdf
cp "$fromdir"os.pdf da_os.pdf
cp "$fromdir"device_data/device-data-manufacturer-LG-security.pdf device_data-LG.pdf
cp "$fromdir"device_data/device-data-all-security.pdf device-data-all-security.pdf
cp "$fromdir"device_data/device-data-all-os.pdf device-data-all-os.pdf
cp "$fromdir"from_to_updates.pdf from_to_updates.pdf
cp "$fromdir"googleplayapi.pdf googleplayapi.pdf
cp "$fromdir"googleplayapi-notitle.pdf googleplayapi-notitle.pdf
cp "$fromdir"norm_api_gpcomp.pdf norm_api_gpcomp.pdf
cp "$fromdir"norm_api_heat.pdf norm_api_heat.pdf
cp "$fromdir"norm_os_heat.pdf norm_os_heat.pdf
cp "$fromdir"norm_versionsecurity.pdf proportioninsecure.pdf
cp "$fromdir"norm_versionsecurity-notitle.pdf proportioninsecure-notitle.pdf
cp "$fromdir"updates_between.pdf updates_between_versions.pdf
cp "$fromdir"nvulnerabilities.pdf vulnerabilities.pdf
cp "$fromdir"nvulnerabilities_heat.pdf nvulnerabilities_heat.pdf
cp "$fromdir"nsecurity_updates_weekly.pdf nw_security_updates.pdf
cp "$fromdir"wifi-accounts-ototals-hist.pdf wifi-accounts-ototals-hist.pdf
cp "$fromdir"wifi-accounts-stotals-hist.pdf wifi-accounts-stotals-hist.pdf
cp "$fromdir"api_gpcomp_diff.pdf api_gpcomp_diff.pdf
cp "$fromdir"api_gpcomp_rdiff.pdf api_gpcomp_rdiff.pdf
# cp "$fromdir"ua-versions-android-month-norm.pdf ua-versions-android-month-norm.pdf
# cp "$fromdir"ua-versions-ios-month-norm.pdf ua-versions-ios-month-norm.pdf
cp "$fromdir""model/Galaxy Nexus/norm_full.pdf" "full_version_Galaxy Nexus.pdf"
cp "$fromdir""model/HTC Desire HD A9191/norm_full.pdf" "full_version_HTC Desire HD A9191.pdf"
cp "$fromdir""model/Symphony W68/norm_full.pdf" "full_version_Symphony W68.pdf"
cp "$fromdir"vulnerabilities_timeline.pdf vulnerabilities_timeline.pdf
cp "$fromdir"frvh_os_versions.pdf frvh_os_versions.pdf
cp "$fromdir"frvh_api_versions.pdf frvh_api_versions.pdf
cp "$fromdir"frms_os_versions.pdf frms_os_versions.pdf
cp "$fromdir"security_score_manufacturer.pdf security_score_manufacturer.pdf
cp "$fromdir"security_score_model.pdf security_score_model.pdf
cp "$fromdir"security_score_operator.pdf security_score_operator.pdf
cp "$fromdir"security_score_summary.pdf security_score_summary.pdf
cp ~drt24/git/da/graphing/pdf/dists.pdf dists.pdf
popd
update_bib 2> /dev/null
cp ~/Library/papers/library.filtered.bib securityupdates.bib
cp /mnt/nas04-device-analyzer-graphing/stats/latex.tex dastats.tex
cp ~/Documents/androidvulnerabilities/output/latex.tex avostats.tex
