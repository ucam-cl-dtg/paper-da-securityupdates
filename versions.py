#!/usr/bin/env python3
import avo
import os
import re
import dateutil.parser
import datetime
import urllib.request
import argparse
import statistics

import latex_value
from latex_value import set_latex_value
latex_value.latex_value_filename('countversions.tex')

from dahelpers import da_start_date, da_end_date, warning, save_csv_list_file, load_csv_list_file
from collections import OrderedDict
from uncertainties import ufloat

def get_lines(address, matcher):
    response = urllib.request.urlopen(address)
    lines = []
    for line in response:
        line = str(line)
        if matcher.match(line):
            lines.append(line.strip('\n '))
    return lines


def get_version_dates(lines, version_matcher, date_matcher):
    version_dates = []
    for line in lines:
        m_version = version_matcher.match(line)
        m_date = date_matcher.match(line)
        if m_version and m_date:
            version_dates.append((m_version.group(1), dateutil.parser.parse(m_date.group(1)).date()))
        else:
            warning('Unmatched line: ', line, m_version, m_date)
    return version_dates

def num_in_range(version_dates):
    num = 0
    for _, date in version_dates:
        if date > da_start_date and date < da_end_date:
            num +=1
    return num

def save_to_csv(name, version_dates):
    save_csv_list_file(map(lambda x : [x[0], x[1].isoformat()], version_dates),'version_dates_' + name + '.csv')


def load_from_csv(name):
    return map(lambda x : [x[0], dateutil.parser.parse(x[1]).date()], load_csv_list_file('version_dates_' + name + '.csv'))


def update_versions():
    targz = re.compile(r'.*\.tar\.gz.*')
    openssl_version_dates = get_version_dates(get_lines('https://www.openssl.org/source/', targz),re.compile(r'.*"openssl-([^"]+)\.tar\.gz".*'),re.compile(r'.*?\d+ ([^<]+) <.*')) 
    set_latex_value('opensslNumVersions', num_in_range(openssl_version_dates))
    save_to_csv('openssl', openssl_version_dates)

    linux_lines = get_lines('https://www.kernel.org/pub/linux/kernel/v2.6/', targz)
    linux_lines.extend(get_lines('https://www.kernel.org/pub/linux/kernel/v3.0/', targz))
    linux_version_dates = get_version_dates(linux_lines, re.compile(r'.*"linux-([0-9.]+)\.tar\.gz".*'), re.compile('.*?\s+\s([0-9\-A-z: ]+)\s+\d+M.*'))
    set_latex_value('linuxNumVersions', num_in_range(linux_version_dates))
    save_to_csv('linux', linux_version_dates)
    return {'openssl': openssl_version_dates, 'linux' : linux_version_dates}


def load_versions():
    names = ['openssl', 'linux']
    version_dates = dict()
    for name in names:
        version_dates[name] = OrderedDict(load_from_csv(name))
    return version_dates

def latency(version_dates, version_map):
    latencies = dict() # upstream_version -> latency in days
    android_release_dates = OrderedDict(map(lambda x : [x[0], dateutil.parser.parse(x[1]).date()], avo.release_dates))
    for android_version, upstream_version in version_map.items():
        if upstream_version.endswith('.0') and upstream_version[:-2] in version_dates:
            upstream_release_date = version_dates[upstream_version[:-2]]
        else:
            upstream_release_date = version_dates[upstream_version]
        if not android_version in android_release_dates:
            continue
        android_release_date = android_release_dates[android_version]
        if android_release_date < upstream_release_date:
            warning('Data bug, android released before the upstream it contains', android_version, upstream_version, android_release_date, upstream_release_date)
            continue
        delay = (android_release_date - upstream_release_date)/datetime.timedelta(1)
        if upstream_version in latencies:
            if delay < latencies[upstream_version]:
                latencies[upstream_version] = delay
                # Found a relase of android including that upstream but released earlier
        else:
            latencies[upstream_version] = delay
    return latencies


def calculate_latencies(version_dates):
    linux_latencies = latency(version_dates['linux'], OrderedDict(avo.os_to_kernel))
    set_latex_value('linuxMeanUpdateLatency', ufloat(statistics.mean(linux_latencies.values()),statistics.stdev(linux_latencies.values())))
    openssl_latencies = latency(version_dates['openssl'], OrderedDict(avo.os_to_openssl_version))
    set_latex_value('opensslMeanUpdateLatency', ufloat(statistics.mean(openssl_latencies.values()),statistics.stdev(openssl_latencies.values())))


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('--update-versions', action='store_true')
    args = parser.parse_args()
    if args.update_versions:
        version_dates = update_versions()
    else:
        version_dates = load_versions()
    calculate_latencies(version_dates)

