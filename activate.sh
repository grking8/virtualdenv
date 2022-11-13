#!/usr/bin/env bash

set -xe

. ./virtualdenv.cfg
export PYTHON_VERSION
export GIT_EMAIL
export GIT_USERNAME
project_dir="/home/code"
venv_dir="/opt/venv"
docker run \
--mount type=bind,source="$(pwd)/venv",target=${venv_dir} \
--mount type=bind,source="$(pwd)",target=${project_dir} \
--mount type=bind,source="$(pwd)/.ssh",target=/root/.ssh \
--interactive \
--tty \
--env PRE_COMMIT_HOME=${project_dir}/.cache \
--add-host=host.docker.internal:host-gateway \
--network host \
"guydocker/virtualdenv:${PYTHON_VERSION}" \
/bin/bash -c "git config --global user.email $GIT_EMAIL && git config --global user.name $GIT_USERNAME && python -m venv $venv_dir && PATH=${venv_dir}/bin:${PATH} && python -m pip install --upgrade pip && bash"
