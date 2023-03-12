ARG PYTHON_VERSION
FROM virtualdenv:${PYTHON_VERSION}

COPY requirements-dev.txt .
COPY requirements.txt .
ENV VIRTUAL_ENV="venv"
RUN python -m venv $VIRTUAL_ENV
ENV PATH="${VIRTUAL_ENV}/bin:${PATH}"
RUN python -m pip install --upgrade pip
RUN python -m pip install --requirement requirements-dev.txt
RUN python -m pip install --requirement requirements.txt
