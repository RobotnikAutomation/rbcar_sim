FROM osrf/ros:melodic-desktop-full

# Install essential tools and ROS
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
    && rm -rf /var/lib/apt/lists/* \
    rosdep init || true \
    rosdep update --include-eol-distros
    
# Development tools
RUN apt-get update && apt-get install -y \
    # check docker X11-GUI setup
    x11-apps \
    #ack
    ack \
    # rosmon
    ros-melodic-rosmon \
    # screen
    bash-completion \
    screen \
    # killall
    psmisc \
    # Cleaning
    && rm -rf /var/lib/apt/lists/*
COPY \
    ./bringup.sh \
    ./.screenrc \ 
    ./install.sh \
    /root/

# Keep docker executing indefinetively
CMD ["/bin/bash", "-c", "sleep infinity"]