#!/bin/sh
killall -9 rosmaster
killall -9 roscore
killall -9 gzclient
killall -9 gzserver

session="objd"
tmux start-server
tmux kill-session -t $session
tmux new-session -d -s $session -n base

tmux send-keys "source ../devel/setup.bash;roslaunch robodrive_simulation sim.launch" C-m

tmux selectp -t 0
tmux splitw -h 
tmux send-keys "sleep 3;source ../devel/setup.bash;roslaunch robodrive_navigation navigation.launch" C-m

tmux selectp -t 1
tmux splitw
tmux send-keys "sleep 3;source ../devel/setup.bash;roslaunch robodrive_navigation move_base.launch" C-m

tmux selectp -t 0
tmux splitw -h
tmux send-keys "sleep 3;source ../devel/setup.bash;roslaunch robodrive_controller twist_mux.launch" C-m


tmux selectp -t 1
tmux splitw
tmux send-keys "sleep 3;source ../devel/setup.bash;roslaunch robodrive_teleop robodrive_teleop_key.launch"  C-m


tmux a
