#!/usr/bin/env python3
import avo
import os
import re
import dateutil.parser
import datetime
import urllib.request

from dahelpers import da_start_date, da_end_date, warning, save_csv_list_file
from collections import OrderedDict

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

def update_versions():
    targz = re.compile(r'.*\.tar\.gz.*')
    openssl_version_dates = get_version_dates(get_lines('https://www.openssl.org/source/', targz),re.compile(r'.*"openssl-([^"]+)\.tar\.gz".*'),re.compile(r'.*?\d+ ([^<]+) <.*')) 
    print('openssl', num_in_range(openssl_version_dates))
    save_to_csv('openssl', openssl_version_dates)

    linux_lines = get_lines('https://www.kernel.org/pub/linux/kernel/v2.6/', targz)
    linux_lines.extend(get_lines('https://www.kernel.org/pub/linux/kernel/v3.0/', targz))
    linux_version_dates = get_version_dates(linux_lines, re.compile(r'.*"linux-([0-9.]+)\.tar\.gz".*'), re.compile('.*?\s+\s([0-9\-A-z: ]+)\s+\d+M.*'))
    print('linux', num_in_range(linux_version_dates))
    save_to_csv('linux', linux_version_dates)

if __name__ == "__main__":
    update_versions()

