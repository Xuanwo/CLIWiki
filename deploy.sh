#!/bin/bash
set -ev
if [ "${TRAVIS_PULL_REQUEST}" = "false" ]; then
    rm -rf .git
    cd output
    echo "cli.xuanwo.org" >> CNAME
    DATE=`date +%Y-%m-%d`
    TIME=`date +%H:%M:%S`
    git add --all
    git commit -m "CLI wiki updated at $DATE $TIME"
    git push --force
fi