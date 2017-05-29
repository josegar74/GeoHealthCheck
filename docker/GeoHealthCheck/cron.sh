#!/bin/bash

# Entrypoint to run cron in Docker container.
# Inspired by
# https://forums.docker.com/t/running-cronjob-in-debian-jessie-container/17527/5

# GHC needs Docker env variables. Cron doesn't provide these by default.
# https://ypereirareis.github.io/blog/2016/02/29/docker-crontab-environment-variables/
printenv > /cronfile
cat  /cronfile.txt >> /cronfile

# Schedule cron file
crontab /cronfile

# Run cron in foreground (Docker requirement)
cron -f
