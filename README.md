![Docker Build CI](https://github.com/ds3002/course/workflows/Docker%20Build%20CI/badge.svg)

# ds3002

Welcome to DS3002 Data Science Systems!

This repository manages your working environment during this course. Some course material
and tools will be distributed in this way so that we all have a common set of tools, scripts, and datasets.

## Setting Up Your Environment

1. [Install Docker](https://docs.docker.com/get-docker/)
2. Run this Container. A basic Docker command to bring up the course container is:

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
