#!/bin/bash
if [ "${TRAVIS_PULL_REQUEST}" = "false" ]; then
    cd output
    echo "cli.xuanwo.org" >> CNAME
    DATE=`date +%Y-%m-%d`
    TIME=`date +%H:%M:%S`
    git add --all
    git commit -m "CLI wiki updated at $DATE $TIME"
    git push --force
fi