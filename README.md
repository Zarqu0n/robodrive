# robodrive
A simple ROS Navigation tutorial project

## robodrive_bringup
This package in working stage. Doesn't work for now

## robodrive_controller
Contain diff_drive_controller and twist_mux package.
Launch twist_mux for specify namespace
```
roslaunch robodrive_controller twist_mux.launch namespace:=<namespace>
```

## robodrive_description
Contain rviz and robodrive urdf file.

## robodrive_navigation
Using amcl for localization and move_base package.
Launching navigation for specify namespaces
```
roslaunch robodrive_navigation navigation.launch namespace:=<namespace> open_rviz:=<bool>
```

## robodrive_simulation
Contain gazebo and robot_spawner 

Launch the simulaton
```
roslaunch robodrive_simulation sim.launch
```
Spawning robot for specify namespaces
```
roslaunch robodrive_simulation robot_spawner.launch namespace:=<namespace> x_pos:=<x> y_pos:=<y> z_pos:=<z>
```

## robodrive_slam
Contain localization and mapping algorithm
For launching mapping
Using gmapping for mapping algorthm.
```
roslaunch robodrive_slam mapping.launch
```
and save map by
```
rosrun map_server map_saver -f <map_name>
```

## robodrive_teleop
Contain joystick and keyboard controller launch file.
For manuel keyboard controller
```
roslaunch robodrive_teleop robodrive_teleop_key.launch 
```
For manuel joystick controller
```
roslaunch robodrive_teleop robodrive_teleop_joy.launch
```
You must to be launch **twist_mux.launch** file showing at the up side

### tmux.sh
Running 2 automate robot simulation and navigation in multiple pane

```
bash tmux.sh
```

