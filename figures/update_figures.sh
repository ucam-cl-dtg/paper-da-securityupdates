#!/bin/sh

set -e

fromdir=~drt24/git/da/graphing/pdf/
cp "$fromdir"norm_api.pdf da_norm_api.pdf
cp "$fromdir"norm_api-notitle.pdf da_norm_api-notitle.pdf
cp "$fromdir"norm_os.pdf da_norm_os.pdf
cp "$fromdir"os.pdf da_os.pdf
cp "$fromdir"device_data/device-data-manufacturer-lg-security.pdf device_data-LG.pdf
cp "$fromdir"device_data/device-data-all-security.pdf device-data-all-security.pdf
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
cp "$fromdir"updates_weekly.pdf w_security_updates.pdf
cp "$fromdir"wifi-accounts-ototals-hist.pdf wifi-accounts-ototals-hist.pdf
cp "$fromdir"wifi-accounts-stotals-hist.pdf wifi-accounts-stotals-hist.pdf
cp "$fromdir"api_gpcomp_diff.pdf api_gpcomp_diff.pdf
cp "$fromdir"api_gpcomp_rdiff.pdf api_gpcomp_rdiff.pdf
cp "$fromdir"ua-versions-android-month-norm.pdf ua-versions-android-month-norm.pdf
cp "$fromdir"ua-versions-ios-month-norm.pdf ua-versions-ios-month-norm.pdf
cp "$fromdir""model/Galaxy Nexus/norm_full.pdf" "full_version_Galaxy Nexus.pdf"
cp "$fromdir""model/HTC Desire HD A9191/norm_full.pdf" "full_version_HTC Desire HD A9191.pdf"
