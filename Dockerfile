ARG PYTHON_TAG=3.8-slim-buster
FROM python:$PYTHON_TAG AS builder

# Install Requirements
ENV DEBIAN_FRONTEND=noninteractive

RUN mkdir -p /usr/share/man/man1 \
    && apt-get update \
    && apt-get install -yq --no-install-recommends \
    build-essential \
    gcc

ARG PREFECT_VERSION
ENV PREFECT_PKG=prefect==$PREFECT_VERSION
RUN pip3 install --no-cache-dir --user --no-warn-script-location \
    $PREFECT_PKG

ARG PYTHON_TAG=3.8-slim-buster
FROM python:$PYTHON_TAG

# Install Requirements
ENV DEBIAN_FRONTEND=noninteractive

RUN mkdir -p /usr/share/man/man1 \
    && apt-get update \
    && apt-get install -yq --no-install-recommends \
    uuid

COPY --from=builder /root/.local /root/.local
ENV PATH=/root/.local/bin:$PATH

ADD config.toml /root/.prefect/

ENTRYPOINT [ "prefect", "agent", "local" ]
CMD ["start"]

LABEL maintainer="m@thias.se"
ARG BUILD_DATE
LABEL build_date=${BUILD_DATE}
