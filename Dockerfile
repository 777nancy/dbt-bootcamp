FROM python:3.9-slim-bullseye as builder

COPY requirements* /tmp

RUN apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get install -y git libopencv-dev openssl libpq-dev gcc\
	&& apt-get autoremove -y \
	&& apt-get clean \
	&& rm -rf /usr/local/src/* \
	&& pip install --upgrade pip \
	&& pip install --no-cache-dir -r /tmp/requirements.txt \
	&& pip install --no-cache-dir -r /tmp/requirements-dev.txt \
	&& rm -rf /tmp/requirements*