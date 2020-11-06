Robotnik Rbcar
==============

Packages for the simulation of the Rbcar robot

<p align="center">
  <img src="https://github.com/RobotnikAutomation/rbcar_sim/blob/melodic-devel/rbcar.jpg" height="275" />
  <img src="https://github.com/RobotnikAutomation/rbcar_sim/blob/melodic-devel/rbcar_gazebo.png" height="275" />
</p>


<h1> Packages </h1>
<h2>rbcar_gazebo</h2>

This package contains the configuration files and worlds to launch the Gazebo environment along with the simulated robot.

<h2>rbcar_sim_bringup</h2>

Launch files that launch the complete simulation of the robot/s.

<h1>Simulating RBcar</h1>

1. Install the following dependencies:
```
sudo apt-get update
sudo apt-get install -y python-wstool python3-rosdep
```

2. Create a workspace and clone the repository:
```
mkdir ~/catkin_ws
cd ~/catkin_ws
wstool init src
wstool merge -t src https://raw.githubusercontent.com/rbcar_sim/tree/melodic-devel/rbcar_sim.rosinstall
wstool update -t src
rosdep install --from-paths src --ignore-src -y
```
3. Install ackermann controller:
```
 sudo dpkg -i src/rbcar_common/rbcar_control/lib/ros-melodic-ackermann-drive-controller_0.0.0-0bionic_amd64.deb 
```

4. Compile:
```
cd ~/catkin_ws
catkin build
source ~/catkin_ws/devel/setup.bash
```
5. Run:
```
roslaunch rbcar_sim_bringup rbcar_complete.launch
```