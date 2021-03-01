# docker-prefect-agent
This is a multiarch build to run a local Prefect agent in a container.

To override configuration use a volume mount to `/root/.prefect/` or `/root/.prefect/config.toml` specifically.

To pass arguments to agent on startup override the `ENTRYPOINT`.

## Tags

The prefect version is the tag for this image. Current prefect version for `latest` is `0.14.10`.

## Base image
All images are built on `python/3.8-slim-buster`.

## Source

https://github.com/mandakan/docker-prefect-agent
