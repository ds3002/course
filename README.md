![Docker Build CI](https://github.com/ds3002/course/workflows/Docker%20Build%20CI/badge.svg)

# ds3002

Welcome to DS3002 Data Science Systems!

This repository manages your working environment during this course. All students
will run this environment and do the bulk of your work here so that we all have a
common set of tools, scripts, and datasets.

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

1. Stop the current version of the running container.

    a. View the currently running container:

        docker ps

    b. Get the first few characters of the ID and then stop it:

        docker stop 01234

2. Pull the latest version.

```
docker pull ghcr.io/ds3002/course:latest
```

3. Run the new version using the same `docker run -it` command.

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

## Set up AWS CLI credentials

If you have created your AWS account (or have one already), retrieve your
access and secret access keys and configure them on your computer.

1. Sign into AWS and visit https://console.aws.amazon.com/iam/home?region=us-east-1#/security_credentials. If you are using an IAM account, see the "Security Credentials" settings for your user.
2. Unfold the "Access Keys" portion of page.
3. Select "Create New Access Key". A div will appear with your Access Key and your Secret Access Key. Record these someplace safe, such as Evernote or your password manager.
4. Configure your `aws` command-line. (If you need to install the `awscli` see [this page](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html).)

```
aws configure
```

5. Paste in the keys as prompted. For region, enter `us-east-1` and for output enter `json`.

## Run & Connect to a Database

**MySQL**

1. In another terminal prompt, run a MySQL database container:
```
docker run -d -e MYSQL_ROOT_HOST=% \
  -e "MYSQL_ROOT_PASSWORD=<SET_SOME_PASSWORD_HERE>" \
  --rm --name dbhost mysql/mysql-server:latest
```
2. From your `course` container environment, connect to and interact with the database
