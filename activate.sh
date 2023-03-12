#!/usr/bin/env sh

set -xe

# shellcheck source=/dev/null
. "./virtualdenv.cfg"
export PYTHON_VERSION
project_dir_host=$(pwd)
project_dir_container="/home/${USER}/code"
venv_dir_host="$(pwd)/venv"
venv_dir_container="/opt/venv"
ssh_dir_host="$(pwd)/.ssh"
ssh_dir_container="/home/${USER}/.ssh"
image_repo="virtualdenv:${PYTHON_VERSION}"
host_name="host.docker.internal:host-gateway"
docker run \
--rm \
--mount type=bind,source="${venv_dir_host}",target=${venv_dir_container} \
--mount type=bind,source="${project_dir_host}",target="${project_dir_container}" \
--mount type=bind,source="${ssh_dir_host}",target="${ssh_dir_container}" \
--interactive \
--tty \
--env TERM="xterm-256color" \
--env PRE_COMMIT_HOME="${project_dir_container}/.cache" \
--add-host=${host_name} \
--network host \
"${image_repo}" \
/bin/sh -c "git config --global user.email $(git config user.email) && git config --global user.name $(git config user.name) && python -m venv $venv_dir_container && PATH=${venv_dir_container}/bin:${PATH} && python -m pip install --upgrade pip && bash"
