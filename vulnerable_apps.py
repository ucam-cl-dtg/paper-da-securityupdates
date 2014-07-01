#!/usr/bin/env python3

import os
import argparse
import csv
import json
from collections import defaultdict, OrderedDict


def count_vulnerable(num_vulnerable, af, version_code):
    for array in csv.reader(af):
        date = array[0]
        for i in range(2, len(array)):
            code, count = array[i].split(':')
            if version_code == code:
                num_vulnerable[date] += int(count)


def count_total(f):
    total = OrderedDict()
    for row in csv.reader(f):
        total[row[0]] = int(row[1])
    return total


def analyse(installed_dir, vulnerable_file):
    num_vulnerable = defaultdict(int)  # Date -> count
    unknown_app_ids = []
    num_known_app_ids = 0
    with open(vulnerable_file) as vf:
        vulnerable_apps = json.load(vf)
    for entry in vulnerable_apps:
        app_id = entry[0]
        version_code = entry[2]
        file_path = os.path.join(installed_dir, app_id + '.csv')
        if os.path.exists(file_path):
            num_known_app_ids += 1
            with open(file_path) as af:
                count_vulnerable(num_vulnerable, af, version_code)
        else:
            unknown_app_ids.append(app_id)
    print('Knew {known} app ids but did not know {unknown} app ids'.format(
        known=num_known_app_ids, unknown=len(unknown_app_ids)))
    num_vulnerable = OrderedDict(
        sorted(num_vulnerable.items(), key=lambda t: t[0]))
    return num_vulnerable


def write_out(num_vulnerable, output_file):
    with open(output_file, 'w') as csvfile:
        writer = csv.writer(csvfile)
        for day, count in num_vulnerable.items():
            writer.writerow([day, count])


def write_norm(num_vulnerable, total_file, norm_file):

    with open(total_file) as f:
        total = count_total(f)
    norm = OrderedDict()
    for day, count in num_vulnerable.items():
        norm[day] = count / total[day]
    write_out(norm, norm_file)

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('--installed_dir')
    parser.add_argument('--vulnerable_file')
    parser.add_argument('--output_file')
    parser.add_argument('--total_file')
    parser.add_argument('--norm_file')
    results = parser.parse_args()
    num_vulnerable = analyse(results.installed_dir, results.vulnerable_file)
    write_out(num_vulnerable, results.output_file)
    write_norm(num_vulnerable, results.total_file, results.norm_file)
