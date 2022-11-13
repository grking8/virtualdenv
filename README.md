- `export PYTHON_VERSION=<version>`
- `docker build --tag guydocker/virtualdenv:${PYTHON_VERSION} --build-arg PYTHON_VERSION .`
- `docker login -u guydocker`
- Enter personal access token
- `docker push guydocker/virtualdenv:${PYTHON_VERSION}`