#!/bin/sh
killall -9 rosmaster
killall -9 roscore
killall -9 gzclient
killall -9 gzserver



session="objd"
tmux start-server
tmux kill-session -t $session
tmux new-session -d -s $session -n base

tmux send-keys "export GAZEBO_MODEL_PATH=robodrive_simulation/models;source ../../devel/setup.bash;roslaunch robodrive_simulation sim.launch" C-m

tmux selectp -t 0
tmux splitw -h 
tmux send-keys "sleep 3;source ../../devel/setup.bash;roslaunch robodrive_navigation navigation.launch namespace:=robodrive0 open_rviz:=true" C-m

tmux selectp -t 1
tmux splitw
tmux send-keys "sleep 3;source ../../devel/setup.bash;roslaunch robodrive_simulation robot_spawner.launch namespace:=robodrive0 x_pos:=2" C-m

tmux selectp -t 0
tmux splitw -h
tmux send-keys "sleep 3;source ../../devel/setup.bash;roslaunch robodrive_navigation navigation.launch namespace:=robodrive1 open_rviz:=false" C-m


tmux selectp -t 1
tmux splitw
tmux send-keys "sleep 3;source ../../devel/setup.bash;roslaunch robodrive_simulation robot_spawner.launch namespace:=robodrive1"  C-m


tmux a
