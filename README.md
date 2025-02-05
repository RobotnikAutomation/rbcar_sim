Robotnik Rbcar
==============

Packages for the simulation of the Rbcar robot

<p align="center">
  <img src="https://github.com/TheConstructAi/rbcar_sim/blob/noetic-devel/rbcar.jpg" height="275" />
  <img src="https://github.com/TheConstructAi/rbcar_sim/blob/noetic-devel/rbcar_gazebo_new.png" height="275" />
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
sudo apt-get install -y python-wstool
```

2. Create a workspace and clone the repository:
```
mkdir ~/catkin_ws
cd ~/catkin_ws
wstool init src
wstool merge -t src https://raw.githubusercontent.com/TheConstructAi/rbcar_sim/noetic-devel/rbcar_sim.rosinstall
wstool update -t src
rosdep install --from-paths src --ignore-src -y
```
3. Install ackermann controller and robotnik_msgs:
```
sudo dpkg -i src/rbcar_common/rbcar_control/lib/ros-melodic-robotnik-msgs_1.1.0-0bionic_amd64.deb
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
# For simple empty world
roslaunch rbcar_sim_examples rbcar_simple_world.launch
# For Lane Detection tests
roslaunch rbcar_sim_examples rbcar_loop_world.launch
# For pedestrian and vehicles testing detection
roslaunch rbcar_sim_examples rbcar_pedestrian_world.launch
# For traffic lights and signal detection testing
roslaunch rbcar_sim_examples rbcar_trafficsignals_world.launch
# For a complex small city environment
roslaunch rbcar_sim_examples rbcar_highresolution_world.launch
```

6. High Quality simulation:
If you want the textured version of the city, becuase of its size, it has to be downloaded manually and replace
the default **town1** model
```
cd rbcar_gazebo/models
git clone git clone https://bitbucket.org/theconstructcore/town_hq.git
rm -rf town1
mv town_hq/town1 ./
rm -rf  town_hq
```
