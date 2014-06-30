#!/usr/bin/env python3

import os
import argparse
import csv
import json

def analyse(installed_dir, vulnerable_file):
    with open(vulnerable_file) as vf:
        vulnerable_apps = json.load(vf)

if __name__ = "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('--installed_dir')
    parser.add_argument('--vulnerable_file')
    results = parser.parse_args()
    analyse(results.installed_dir, results.vulnerable_file)
