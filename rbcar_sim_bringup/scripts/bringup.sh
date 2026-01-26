#!/bin/bash

# function to echo with color red [echo_error]
function echo_error() {
  echo -e "\e[31m$1\e[0m"
}
# function to echo with color green [echo_success]
function echo_success() {
  echo -e "\e[32m$1\e[0m"
}
# function to echo with color yellow [echo_warning]
function echo_warning() {
  echo -e "\e[33m$1\e[0m"
}
# function to echo with color blue and bold [echo_info]
function echo_info() {
  echo -e "\e[1;34m$1\e[0m"
}

screen -S core -d -m roscore;
screen -S complete -d -m rosrun rosmon rosmon --name=rbcar_complete $(rospack find rbcar_sim_bringup)/launch/rbcar_complete.launch;
screen -r complete