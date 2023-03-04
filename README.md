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
- `export PYTHON_VERSION=<version>`
- `git clone git@github.com:grking8/virtualdenv.git`
- `cd /path/to/virtualdenv`
- `docker build --tag virtualdenv:${PYTHON_VERSION} --build-arg PYTHON_VERSION --build-arg USER --build-arg USER_ID=$(id -u $USER) --file dockerfiles/virtualenv/Dockerfile .`
- `cd /path/to/project`
- `cp /path/to/virtualdenv/activate.sh .`
- `mkdir .ssh`
- `cp -r ~/.ssh/<mypublickey> .ssh/id_rsa.pub`
- `cp -r ~/.ssh/<myprivatekey> .ssh/id_rsa`
- Ensure Docker daemon is running
- Activate the virtual environment `./activate.sh`
- Install `pip` dependencies
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
