FROM gitpod/workspace-full

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/New_York

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y python3 python3-dev python3-pip nano \
  git curl net-tools jq zip unzip dnsutils httpie tzdata wget \
  htop iputils-ping mysql-client redis gsutil apt-transport-https \
  ca-certificates gnupg gcc python-dev python-setuptools libffi-dev

RUN python3 -m pip install --upgrade pip

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" \
  -o "awscliv2.zip" \
  && unzip awscliv2.zip \
  && ./aws/install \
  && rm -rf /var/lib/apt/lists/*
RUN mkdir "/home/host"

WORKDIR /root
COPY ./ ./