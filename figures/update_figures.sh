#!/bin/sh

set -e

fromdir=~drt24/git/da/graphing/pdf/
cp "$fromdir"norm_api.pdf da_norm_api.pdf
cp "$fromdir"norm_api-notitle.pdf da_norm_api-notitle.pdf
cp "$fromdir"norm_os.pdf da_norm_os.pdf
cp "$fromdir"os.pdf da_os.pdf
cp "$fromdir"device_data/device_data-lg-security.pdf device_data-LG.pdf
cp "$fromdir"from_to_updates.pdf from_to_updates.pdf
cp "$fromdir"googleplayapi.pdf googleplayapi.pdf
cp "$fromdir"googleplayapi-notitle.pdf googleplayapi-notitle.pdf
cp "$fromdir"norm_api_heat.pdf norm_api_heat.pdf
cp "$fromdir"norm_os_heat.pdf norm_os_heat.pdf
cp "$fromdir"norm_versionsecurity.pdf proportioninsecure.pdf
cp "$fromdir"norm_versionsecurity-notitle.pdf proportioninsecure-notitle.pdf
cp "$fromdir"updates_between.pdf updates_between_versions.pdf
cp "$fromdir"vulnerabilities.pdf vulnerabilities.pdf
cp "$fromdir"updates_weekly.pdf w_security_updates.pdf
cp "$fromdir"wifi-accounts-ototals-hist.pdf wifi-accounts-ototals-hist.pdf
cp "$fromdir"wifi-accounts-stotals-hist.pdf wifi-accounts-stotals-hist.pdf
