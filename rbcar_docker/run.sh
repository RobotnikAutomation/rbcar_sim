#!/bin/bash

# Exit on error
set -e

# Give  permission to connect to X Server to the container
xhost +local:`docker inspect --format="{{.Config.Hostname}}" simulation`

# Re-attach to container
docker exec -it simulation /bin/bash
