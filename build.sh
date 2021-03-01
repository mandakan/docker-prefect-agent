#!/bin/bash

docker buildx use multibuilder

PYTHON_TAG=3.8-slim-buster
PREFECT_VERSION=0.14.10

docker buildx build \
--platform linux/arm/v7,linux/amd64,linux/arm64,linux/arm/v6 \
--build-arg PYTHON_TAG=$PYTHON_TAG \
--build-arg PREFECT_VERSION=$PREFECT_VERSION \
--tag fraktsedel/prefect-agent:latest \
--tag fraktsedel/prefect-agent:$PREFECT_VERSION \
--build-arg BUILD_DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ") \
--push \
.