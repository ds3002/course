![Docker Build CI](https://github.com/ds3002/course/workflows/Docker%20Build%20CI/badge.svg)

# ds3002

Welcome to DS3002 Data Science Systems!

This repository manages your working environment during this course. Some course material
and tools will be distributed in this way so that we all have a common set of tools, scripts, and datasets.

## Setting Up Your Environment

1. [Install Docker](https://docs.docker.com/get-docker/)
2. Run this Container. A basic Docker command to bring up the course container is:
3. Follow [these instructions](EXERCISES.md) for suggested practice.

```
docker run -it ghcr.io/ds3002/course:latest /bin/bash
```

A few details to note:
- Docker is being run in interactive/tty mode `-it`.
- The image is being pulled from the GitHub Container Registry
- Interactive mode requires that you designate an application or shell `/bin/bash`.
- More advanced settings, such as volume mapping, are detailed below.

## Updating Your Environment

1. Stop the current version of the running container. From within the container, exit/stop it:

```
exit
```

2. Pull the latest version.

```
docker pull ghcr.io/ds3002/course:latest
```

3. Run the new version using the same `docker run -it` command as before.

## Run the Container with Persistent Storage

In order to save your own work from week to week, you can run this container
in such a way that it does not delete your code every time you exit the container.

### Set Up

1. Clone this repository.
```bash
git clone https://github.com/ds3002/course.git
```
2. Change into the `course/practice` directory and issue a `pwd` (or determine the full path somehow).
3. Pull the latest version of the `course` container:
```bash
docker pull ghcr.io/ds3002/course:latest
```
4. Now, run the container with an attached volume, mapped to the git repository above. Be sure
to customize line 3 below with the path to the practice folder of *your* local copy of the source code.
```bash
docker run -it \
  -v /Users/nem2p/sandbox/course/practice:/root/practice \
  ghcr.io/ds3002/course:latest \
  /bin/bash
```
5. You will be dropped into the container, where you can cd into `practice` and see course material. This gives
you the ability to execute your code from within the container.
6. At the same time, you can also open up the scripts and data files from *outside* the container using
Windows Explorer, the Finder, or any IDE you like to use for coding.

### Updates

To update your code repository, change to the base directory for `course` and issue this command:
```
git pull origin main
```

To update your course container, stop the current running one by exiting it. Then issue this command:
```
docker pull ghcr.io/ds3002/course:latest
```
Start your container again using the `docker run` command from above and you're all set!


## Advanced Mappings

It may be useful to map additional directories to your container, 
such as your `~/.aws`, `~/.ssh` or other project directories. 
Here is an example that maps two local folders from a workstation 
to the running container:

```bash
docker run -it \
  -v ~/.aws:/root/.aws \
  -v ~/Development:/home/development \
  ghcr.io/ds3002/course:latest \
  /bin/bash
```

## Replicate this Environment

If you would like to install the same tools on your local workstation, 
here is a list of the software and packages included in this image:

- python3
- python3-pip
- git 
- curl 
- jq 
- zip 
- unzip 
- nano
- dig
- httpie
- htop 
- ping
- mysql-client
- AWS CLI v2 (found [here](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html))


Using `pip install`:

- requests
- redis
- boto3
- gsutil

# Gitpod

[![Gitpod ready-to-code](https://img.shields.io/badge/Gitpod-ready--to--code-blue?logo=gitpod)](https://gitpod.io/#)

## Setup

To work with the course material in 100% web-based mode, try Gitpod! Follow these steps:

1. Go to the course repository in Github.
2. Click on the FORK icon in the upper-right corner. Fork the repository into your personal account.
3. Go to your new fork of the repository in Github (a web page). Copy that URL.
4. Open up a new tab to Gitpod.io but paste your fork URL directly after the `#` character:
```
https://gitpod.io/# <-- paste your URL after the # before you press return.
```
5. This will open up YOUR repository within Gitpod. This includes a terminal with the course container, and a folder tree of all course content.
6. In the terminal, enter this line:
```
git remote add upstream https://github.com/ds3002/course.git
```
7. You have now attached your repository to the main repositor for the course.

## Update your fork

1. Fetch from the upstream branch:
```
git fetch upstream
```
2. Merge your branch with the upstream branch.
```
git merge upstream/main main
```
