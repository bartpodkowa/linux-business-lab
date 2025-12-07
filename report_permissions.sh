#!/usr/bin/env bash
set -e

COMPANY_ROOT="${PWD}/company_data"

if [ ! -d "$COMPANY_ROOT" ]; then
    echo "company_data directory not found!"
    echo "Run: sudo ./setup_lab.sh"
    exit 1
fi

echo "== Permission report =="
echo
sudo ls -ld "${COMPANY_ROOT}"/*

echo
echo "Recursive listing:"
sudo ls -lR "${COMPANY_ROOT}"
