#!/bin/bash

# Exit on error
set -e

# Inicializar rosdep
cd /root/catkin_ws

# Instalar dependencias de los paquetes
dpkg -i "src/rbcar_common/rbcar_control/lib/ros-melodic-robotnik-msgs_1.1.0-0bionic_amd64.deb"
dpkg -i "src/rbcar_common/rbcar_control/lib/ros-melodic-ackermann-drive-controller_0.0.0-0bionic_amd64.deb"
apt update
source /opt/ros/melodic/setup.bash
rosdep update --include-eol-distros
rosdep install --from-paths src --ignore-src -r -y --include-eol-distros

# Compilar el workspace de ROS
catkin build
source /root/catkin_ws/devel/setup.bash

# Configurar el entorno para ROS
echo "source /root/catkin_ws/devel/setup.bash" >> /root/.bashrc

# Development Tools
source /etc/profile.d/bash_completion.sh
