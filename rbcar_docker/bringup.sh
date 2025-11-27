killall screen

echo "Starting roscore ..."
screen -S core -d -m roscore;
sleep 2;

echo "Launching simulation ..."
screen -S simulation -d -m rosrun rosmon rosmon --name=simulation rbcar_sim_examples rbcar_simple_world.launch
screen -r simulation