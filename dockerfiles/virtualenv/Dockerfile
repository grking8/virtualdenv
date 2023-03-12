ARG PYTHON_VERSION
FROM python:${PYTHON_VERSION}-slim-buster

ARG USER
ARG USER_ID
ENV HOME_DIR="/home/${USER}"
RUN useradd --uid $USER_ID --home-dir $HOME_DIR --create-home $USER
COPY .bashrc "${HOME_DIR}/.bashrc"
RUN apt-get update
RUN apt-get install -y git=1:2.20.1-2+deb10u3
RUN apt-get install git-core bash-completion
ENV PROJECT_DIR="${HOME_DIR}/code"
RUN mkdir $PROJECT_DIR
WORKDIR $PROJECT_DIR
RUN chown -R $USER:$USER .
USER $USER
