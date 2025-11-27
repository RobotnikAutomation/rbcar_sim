#!/bin/bash

# Exit on error
set -e

# ENV varibales to make script path agnostic
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SCRIPT_NAME="$(basename "$0")"

# Download repository (will be mounted on the docker container).
if [[ -d $SCRIPT_DIR/catkin_ws/src  ]]; then
    echo "ERROR: $SCRIPT_DIR/catkin_ws/src alreay exist. Delete it to be able to build again. All unsaved changes will be lost."
    exit 1
fi
mkdir $SCRIPT_DIR/catkin_ws/src -p
vcs import $SCRIPT_DIR/catkin_ws/src --input $SCRIPT_DIR/../rbcar_sim.rosinstall
vcs pull $SCRIPT_DIR/catkin_ws/src

# Build image and run container
docker compose --project-name rbcar-sim --progress=plain up -d