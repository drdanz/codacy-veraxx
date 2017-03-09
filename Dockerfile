FROM debian:stretch-slim

MAINTAINER Daniele E. Domenichelli <daniele.domenichelli@iit.it>

RUN apt-get update
RUN apt-get install -y jq vera++

RUN addgroup --system --gid 2004 docker
RUN adduser --system --no-create-home --disabled-login --disabled-password --uid 2004 --ingroup docker docker

COPY . /usr/src/app
RUN ["chown", "-R", "docker:docker", "/usr/src/app"]

ADD docs /docs
ADD tests /docs/tests
RUN ["chown", "-R", "docker:docker", "/docs"]

USER docker
WORKDIR /usr/src/app
CMD ["target/run-vera++.sh"]
