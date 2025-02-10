FROM osrf/ros:melodic-desktop-full

# Instalar herramientas esenciales y dependencias de ROS
RUN apt-get update && apt-get install -y \
    git \
    python3-wstool \
    python3-pip \
    python3-rosdep \
    python3-catkin-tools \
    build-essential \
    ros-melodic-catkin \
    ros-melodic-rviz \
    ros-melodic-gazebo-ros \
    ros-melodic-gazebo-plugins \
    ros-melodic-gazebo-ros-pkgs \
    ros-melodic-controller-manager \
    ros-melodic-move-base-msgs \
    ros-melodic-sbpl \
    ros-melodic-nav-core \
    ros-melodic-velocity-controllers \
    ros-melodic-robot-localization \
    ros-melodic-camera-info-manager-py \
    ros-melodic-hector-gazebo-plugins \
    ros-melodic-base-local-planner \
    x11-utils \
    && rm -rf /var/lib/apt/lists/*

# Inicializar rosdep
RUN rosdep init || true
RUN rosdep update

# Crear un workspace de ROS y clonar el repositorio
RUN mkdir -p /root/catkin_ws/src
WORKDIR /root/catkin_ws
RUN wstool init src
RUN wstool merge -t src https://raw.githubusercontent.com/RobotnikAutomation/rbcar_sim/refs/heads/noetic-devel-fix/rbcar_sim.rosinstall
RUN wstool update -t src
#RUN rosdep install --from-paths src --ignore-src -y

RUN /bin/bash -c "dpkg -i src/rbcar_common/rbcar_control/lib/ros-melodic-robotnik-msgs_1.1.0-0bionic_amd64.deb"
RUN /bin/bash -c "dpkg -i src/rbcar_common/rbcar_control/lib/ros-melodic-ackermann-drive-controller_0.0.0-0bionic_amd64.deb"

# Instalar dependencias del paquete
WORKDIR /root/catkin_ws
RUN /bin/bash -c "source /opt/ros/melodic/setup.bash && rosdep install --from-paths src --ignore-src -r -y"

# Compilar el workspace de ROS
RUN /bin/bash -c "source /opt/ros/melodic/setup.bash && catkin build"

# Configurar el entorno para ROS
RUN echo "source /root/catkin_ws/devel/setup.bash" >> /root/.bashrc

CMD ["bash"]
