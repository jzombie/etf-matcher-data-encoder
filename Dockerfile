# Base image for building Rust projects
FROM rust:1.79.0 as rust-base

# Tell `validate_docker_env.sh` that we're in a Docker build
ARG DOCKER_BUILD=1

# Install necessary dependencies
RUN apt-get update && \
    apt-get install -y zip cmake libz-dev python3 curl openssl && \
    rm -rf /var/lib/apt/lists/*

# Create a new directory for the project
WORKDIR /app

COPY . .

# TODO: Combine these steps?
# 
# Make build script executable and run it
RUN chmod +x ./docker_build_helpers/generate_env.sh && ./docker_build_helpers/generate_env.sh
RUN chmod +x ./docker_build_helpers/encrypt_password.sh && ./docker_build_helpers/encrypt_password.sh

RUN mkdir -p /build_artifacts/out
RUN cp /app/.env /build_artifacts/out/.env
