![Docker Build CI](https://github.com/ds3002/course/workflows/Docker%20Build%20CI/badge.svg)

# ds3002

Welcome to DS3002 Data Science Systems!

This repository manages your working environment during this course. Some course material
and tools will be distributed in this way so that we all have a common set of tools, scripts, and datasets.

## Setting Up Your Environment

You have FOUR choices for setting up an environment for this course:

1. **Old School** - clone the repository for code/samples/data files, but install packages yourself. Detailed lists of packages and software are below.
2. **DevOps Hardcore** - clone the repository, pull the Docker image, and run them together by mapping the repo to the container when you run it. Instructions [here](#running-as-a-docker-container).
3. **Cool Kids** - use VS Code, and run the course container in the terminal. Instructions [here](https://www.youtube.com/watch?v=cRmChRzq6VE).
4. **100% Webby** - use Gitpod for a complete web-based experience. Requires no software other than a browser. Instructions [here](#gitpod).

### Running as a Docker container

1. [Install Docker](https://docs.docker.com/get-docker/)
2. Run this Container. A basic Docker command to bring up the course container is below.
3. Follow [these instructions](EXERCISES.md) for suggested practice.

```
git clone https://github.com/ds3002/course.git
cd course
docker run -it -v ${pwd}:/workspace/course ghcr.io/ds3002/course:latest /bin/bash
```

A few details to note:
- Docker is being run in interactive/tty mode `-it`.
- The image is being pulled from the GitHub Container Registry
- Interactive mode requires that you designate an application or shell `/bin/bash`.
- More advanced settings, such as volume mapping, are detailed below.

### Keeping Up to date

1. Stop the current version of your running container. To exit or stop the container, type:

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

[![Gitpod open-in-gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://handlers.uvasomrc.io/gitpod/)

## Setup

To work with the course material in 100% web-based mode, try Gitpod! Follow these steps:

1. Go to the course repository in Github.
2. Click on the FORK icon in the upper-right corner. Fork the repository into your personal account.
3. Go to your new fork of the repository in Github (a web page).
4. In your browser address bar, paste the snippet below BEFORE the URL to your forked repository.
```
https://gitpod.io/#
```
5. This will open up YOUR repository within Gitpod. Sign into Gitpod using your Github account. After a few minutes of loading, your session will include a terminal with the course container and a folder tree of all course content.
7. You now have a fork of the course repository that is linked to the main repository.

## Updating your fork

To stay current with new releases into the course repository, follow these two simple steps:

1. Fetch from the upstream branch:
```
git fetch upstream
```
2. Merge your branch with the upstream branch.
```
git merge upstream/main main
```

## Saving your changes

If you generate code, scripts, data files, etc. that you would like to keep, simply add, commit, and push
the files back to your fork of the repository:
```
git add .
git commit -m "Some meaningful message"
git push origin main
```
You will be prompted to sign into Github in order to push.
