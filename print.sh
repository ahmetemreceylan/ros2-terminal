#!/bin/bash
echo "Başlatılıyor."

gnome-terminal --tab -- bash -c "
source /opt/ros/humble/setup.bash
ros2 run turtlesim turtlesim_node --ros-args --remap __ns:=/bir
"
gnome-terminal --tab -- bash -c "
source /opt/ros/humble/setup.bash
ros2 run turtlesim turtlesim_node --ros-args --remap __ns:=/iki
"
gnome-terminal --tab -- bash -c "
source /opt/ros/humble/setup.bash
ros2 run turtlesim turtlesim_node --ros-args --remap __ns:=/uc
"
gnome-terminal --tab -- bash -c "
source /opt/ros/humble/setup.bash
ros2 run turtlesim turtlesim_node --ros-args --remap __ns:=/dort
"
sleep 2

gnome-terminal --tab -- bash -c "
source /opt/ros/humble/setup.bash
ros2 param set /bir/turtlesim background_r 255
ros2 param set /bir/turtlesim background_g 255
ros2 param set /bir/turtlesim background_b 255
ros2 service call /bir/kill turtlesim/srv/Kill \"{name: 'turtle1'}\"
ros2 service call /bir/spawn turtlesim/srv/Spawn \"{x: 5, y: 2, theta: 1.5707963268, name: 'turtle_t'}\"
ros2 service call /bir/turtle_t/set_pen turtlesim/srv/SetPen \"{'r': 0, 'g': 0, 'b': 0, 'width': 30, 'off': 0}\"
ros2 topic pub --once /bir/turtle_t/cmd_vel geometry_msgs/msg/Twist \"{linear: {x: 7.0, y: 0.0, z: 0.0}, angular: {x: 0.0, y: 0.0, z: 0.0}}\"
ros2 topic pub --once /bir/turtle_t/cmd_vel geometry_msgs/msg/Twist \"{linear: {x: 0.0, y: 3.0, z: 0.0}, angular: {x: 0.0, y: 0.0, z: 0.0}}\"
ros2 topic pub --once /bir/turtle_t/cmd_vel geometry_msgs/msg/Twist \"{linear: {x: 0.0, y: -6.0, z: 0.0}, angular: {x: 0.0, y: 0.0, z: 0.0}}\"
"

gnome-terminal --tab -- bash -c "
source /opt/ros/humble/setup.bash
ros2 param set /iki/turtlesim background_r 255
ros2 param set /iki/turtlesim background_g 255
ros2 param set /iki/turtlesim background_b 255
ros2 service call /iki/kill turtlesim/srv/Kill \"{name: 'turtle1'}\"
ros2 service call /iki/spawn turtlesim/srv/Spawn \"{x: 3, y: 2, theta: 1.5707963268, name: 'turtle_b'}\"
ros2 service call /iki/turtle_b/set_pen turtlesim/srv/SetPen \"{'r': 0, 'g': 0, 'b': 0, 'width': 30, 'off': 0}\"
ros2 topic pub --once /iki/turtle_b/cmd_vel geometry_msgs/msg/Twist \"{linear: {x: 7.0, y: 0.0, z: 0.0}, angular: {x: 0.0, y: 0.0, z: 0.0}}\"
ros2 action send_goal /iki/turtle_b/rotate_absolute turtlesim/action/RotateAbsolute \"{theta: 0.0}\"
ros2 topic pub --once /iki/turtle_b/cmd_vel geometry_msgs/msg/Twist \"{linear: {x: 5.0, y: 0.0, z: 0.0}, angular: {x: 0.0, y: 0.0, z: -3.1415926536}}\"
ros2 action send_goal /iki/turtle_b/rotate_absolute turtlesim/action/RotateAbsolute \"{theta: 0.0}\"
ros2 topic pub --once /iki/turtle_b/cmd_vel geometry_msgs/msg/Twist \"{linear: {x: 6.0, y: 0.0, z: 0.0}, angular: {x: 0.0, y: 0.0, z: -3.1415926536}}\"

ros2 topic pub --once /dort/turtle_4/cmd_vel geometry_msgs/msg/Twist \"{linear: {x: 8.0, y: 0.0, z: 0.0}, angular: {x: 0.0, y: 0.0, z: 0.0}}\"
ros2 action send_goal /dort/turtle_4/rotate_absolute turtlesim/action/RotateAbsolute \"{theta: 4.25}\"
ros2 topic pub --once /dort/turtle_4/cmd_vel geometry_msgs/msg/Twist \"{linear: {x: 7.2, y: 0.0, z: 0.0}, angular: {x: 0.0, y: 0.0, z: 0.0}}\"
ros2 action send_goal /dort/turtle_4/rotate_absolute turtlesim/action/RotateAbsolute \"{theta: 0.0}\"
ros2 topic pub --once /dort/turtle_4/cmd_vel geometry_msgs/msg/Twist \"{linear: {x: 3.7, y: 0.0, z: 0.0}, angular: {x: 0.0, y: 0.0, z: 0.0}}\"
"

gnome-terminal --tab -- bash -c "
source /opt/ros/humble/setup.bash
ros2 param set /uc/turtlesim background_r 255
ros2 param set /uc/turtlesim background_g 255
ros2 param set /uc/turtlesim background_b 255
ros2 service call /uc/kill turtlesim/srv/Kill \"{name: 'turtle1'}\"
ros2 service call /uc/spawn turtlesim/srv/Spawn \"{x: 5, y: 10, theta: 3.5, name: 'turtle_6'}\"
ros2 service call /uc/turtle_6/set_pen turtlesim/srv/SetPen \"{'r': 0, 'g': 0, 'b': 0, 'width': 30, 'off': 0}\"
ros2 topic pub --once /uc/turtle_6/cmd_vel geometry_msgs/msg/Twist \"{linear: {x: 10.0, y: 0.0, z: 0.0}, angular: {x: 0.0, y: 0.0, z: 1.8}}\"
ros2 topic pub --once /uc/turtle_6/cmd_vel geometry_msgs/msg/Twist \"{linear: {x: 15.3, y: 0.0, z: 0.0}, angular: {x: 0.0, y: 0.0, z: 6.0}}\"
"

gnome-terminal --tab -- bash -c "
source /opt/ros/humble/setup.bash
ros2 param set /dort/turtlesim background_r 255
ros2 param set /dort/turtlesim background_g 255
ros2 param set /dort/turtlesim background_b 255
ros2 service call /dort/kill turtlesim/srv/Kill \"{name: 'turtle1'}\"
ros2 service call /dort/spawn turtlesim/srv/Spawn \"{x: 8, y: 2, theta: 1.5707963268, name: 'turtle_4'}\"
ros2 service call /dort/turtle_4/set_pen turtlesim/srv/SetPen \"{'r': 0, 'g': 0, 'b': 0, 'width': 30, 'off': 0}\"
"
