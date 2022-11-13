ARG PYTHON_VERSION
FROM python:${PYTHON_VERSION}-slim-buster

RUN apt-get update
RUN apt-get install -y git=1:2.20.1-2+deb10u3
ARG PROJECT_DIR
ARG GIT_USERNAME
ARG GIT_EMAIL
RUN mkdir $PROJECT_DIR
WORKDIR $PROJECT_DIR
COPY .ssh /root/.ssh
COPY .git .
RUN git config --global user.email $GIT_EMAIL
RUN git config --global user.name $GIT_USERNAME
