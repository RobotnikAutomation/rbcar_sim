#!/bin/bash

# Exit on error
set -e

# Build image and run container
docker compose --project-name rbcar-sim --progress=plain up -d