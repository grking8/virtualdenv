## Local development

### Build and push image to Docker Hub

- `export PYTHON_VERSION=<version>`
- `docker build --tag guydocker/virtualdenv:${PYTHON_VERSION} --build-arg PYTHON_VERSION dockerfiles/virtualenv`
- `docker login -u guydocker`
- Enter personal access token
- `docker push guydocker/virtualdenv:${PYTHON_VERSION}`

## Usage

### Activate virtual environment with pre-commit hooks

- `cd /path/to/project`
- Ensure you have the correct Git user information for the repository:
  - `git config user.name`
  - `git config user.email`
  - If name needs updating, `git config user.name <new-name>`
  - If email needs updating, `git config user.email <new-email>`
- `touch virtualdenv.cfg` and specify Python version (see example in this repo)
- Specify hooks in `.pre-commit-config.yaml`
- `mkdir venv`
- `cp /path/to/virtualdenv/activate.sh .`
- `cp -r ~/.ssh .`
- Ensure Docker daemon is running
- Activate the virtual environment `./activate.sh`
- `pre-commit install`
- `pre-commit install --hook-type commit-msg`
- `pre-commit autoupdate`
- `exit` to deactivate virtual environment

### PyCharm Python interpreter

Ensuring the Python interpreter is set correctly has various benefits, e.g.
auto suggestions for missing imports, syntax highlighting

- `cd /path/to/project`
- `cp /path/to/virtualdenv/dockerfiles/pycharm/Dockerfile dockerfiles/pycharm/Dockerfile` and adapt the example file in this repo accordingly.
- Create the PyCharm interpreter:
  - File -> Settings -> Project -> Project Interpreter -> settings cog icon -> Add Docker
  - Use Docker file `dockerfiles/pycharm/Dockerfile`
  - Set image tag to `${PROJECT-NAME}-env`
  - Set build options, e.g. `--build-arg PYTHON_VERSION=3.8` (same as version in `virtualdenv.cfg`
  - After a few moments, in PyCharm, check no more warnings about missing packages