![Docker Build CI](https://github.com/ds3002/course/workflows/Docker%20Build%20CI/badge.svg)

# ds3002

Welcome to DS3002 Data Science Systems!

This repository manages your working environment during this course. All students
will run this environment and do the bulk of your work here so that we all have a
common set of tools, scripts, and datasets.

## Setting Up Your Environment

1. [Install Docker](https://docs.docker.com/get-docker/]
2. Run this Container. A basic Docker command to bring up the course container is:

    docker run -it ghcr.io/ds3002/course:latest /bin/bash

A few details to note:
- Docker is being run in interactive/tty mode `-it`.
- The image is being pulled from the GitHub Container Registry
- Interactive mode requires that you designate an application or shell `/bin/bash`.
- More advanced settings, such as volume mapping, are detailed below.

## Updating Your Environment

1. Stop the current version of the running container.
2. Pull the latest version.
3. Run the new version with the same settings.

## Advanced Mapping


