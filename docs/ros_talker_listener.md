## Simple Listener and Talker Structure

Ready to run ROS + Python example 

<<<<<<< HEAD
<img src="../../asset/talker_listener.gif">
=======
<img src="../asset/talker_listener.gif">
>>>>>>> 4d9ae7f71f3bab9d87fae1728654ee0b724b4b4b



```
# Make sure the ros is set. 
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc

# ~/playground/ros/talker_listner
catkin_make
echo  "source ~/playground/ros/talker_listener/devel/setup.sh" >> ~/.bashrc 

```

## Terminals
* Terminal 1 : `roscore`
* Termianl 2 : `rosrun pkg1 talker.py`
* Terminal 3 : `rosrun pkg1 numpy_listener.py` 
