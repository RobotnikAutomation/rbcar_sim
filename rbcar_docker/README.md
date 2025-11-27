# Docker Simulation

The following instructions create a single docker container to run the RBCAR simulation. 
All the source code of the workspace is hosted on a local directory and mounted on the docker container for the mental health of the developer.

# Setup

To build the image for the simulation, run the container and create the workspace, run the following commmand.
```bash
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
ls -la | grep catkin_ws
```

## Enter the Running Container

To attach or access the container, run the following command.
```bash
./run.sh
```
A simple `docker exec -it simulation /bin/bash` could not work GUI applications like Gazebo require access to the X11 server of the host PC.

## Restart the Stopped Container
In case the container is stopped, run the following command.
```bash
./restart.sh
```

## Compile the Workspace
If it is the first time you enter the container, run the following command.
```bash
cd /root
install.sh
```

# Execution
To run the simulation, inside the container, run the following command.
```bash
source /root/catkin_ws/devel/setup.bash
roslaunch rbcar_sim_bringup rbcar_complete.launch
```

To test the control system of the robot, inside the container, while the simulation is running, publish over the `/cmd_vel` topic.
```bash
rostopic pub -r 20 /cmd_vel geometry_msgs/Twist "linear:
  x: 1.0
  y: 0.0
  z: 0.0
angular:
  x: 0.0
  y: 0.0
  z: 0.2" 
```