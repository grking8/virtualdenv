ARG PYTHON_VERSION
FROM python:${PYTHON_VERSION}-slim-buster

RUN apt-get update
RUN apt-get install -y git=1:2.20.1-2+deb10u3
ENV PROJECT_DIR="/home/code"
RUN mkdir $PROJECT_DIR
WORKDIR $PROJECT_DIR
