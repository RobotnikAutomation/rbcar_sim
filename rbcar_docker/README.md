# Docker Simulation

The following instructions create a single docker container to run the RBCAR simulation. 
All the source code of the workspace is hosted on a local directory and mounted on the docker container for the mental health of the developer.

# Installation

To build the image for the simulation, run the container and create the workspace, run the following commmand.
```bash
cd rbcar_docker
./build.sh
```
- A docker image called `rbcar-sim-complete` should be installed, check by running the following command.
```bash
docker image list
```
- A docker container called `simulation` should be running, check by running the following command.
```bash
docker ps
```
- A directory containing the source of the simulation should be installed too, check by running the following command.
```bash
cd rbcar_docker
ls -la | grep catkin_ws
```

## Enter the Running Container

To attach or access the container, run the following command.
```bash
cd rbcar_docker
./run.sh
```
A simple `docker exec -it simulation /bin/bash` would not be enough, has GUI applications require access to the X11 server of the host PC.

### Restart the Stopped Container
In case the container is stopped, run the following command.
```bash
cd rbcar_docker
./restart.sh
```

## Compile the Workspace
If it is the first time you enter the container or you have made changes to the workspace code, run the following command.
```bash
cd /root
install.sh
```

# Run the Simulation
Inside the container, run the following command.
```bash
cd /root/catkin_ws
source devel/setup.bash
roslaunch rbcar_sin_bringup rbcar_complete.launch
```