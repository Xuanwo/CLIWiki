#!/bin/bash
if [ "${TRAVIS_PULL_REQUEST}" = "false" ]; then
    git add --all .
    git commit -m "CLI wiki updated at $DATE $TIME"
    git push --force
fi