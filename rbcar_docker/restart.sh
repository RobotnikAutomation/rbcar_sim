#!/bin/bash

# Exit on error
set -e

# Give  permission to connect to X Server to the container
xhost +local:`docker inspect --format="{{.Config.Hostname}}" simulation`

# Re-start and re-attach to container
docker restart simulation