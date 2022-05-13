# Lab 2: PX manipulation with ROS on python and matlab

By: Jhon Brandol Muñoz Romero and Nicolas Gil Rojas
## Abstract
In this lab we try to manipulate the Phantom X robot using the keyboard of our laptop. Also we give a position to the robot using Matlab and get a representation of the current pose using the RVC toolbox.
 - - - 
 ##  Cinematic analysis of the robot
The first one, reference systems are assigned according to the DHstd convention. In this case, you can si the Root Phantom that is plotted with the tool in Matlab. 

<a href="https://imgbb.com/"><img src="https://i.ibb.co/tXtr8yM/pp.jpg" alt="pp" border="0"></a>

Then, there are the convention parameters of DHstd, and it is represented in the following table, where the letter q is variable.Therefore, the measurement is given in centimeters.


 <a href="https://imgbb.com/"><img src="https://i.ibb.co/482tP1q/para.png" alt="para" border="0"></a>
 
## How to use this repo
Clone this repo onto your Catkin workspace. Also is needed Matlab with dynamixel messages.

With the Phantom X robot connected into your system you have to identify de IDs of the motors and modify them on the _config/joints.yaml_ file. In our case our robot had the ID from 6 to 10.

Compile the package using the following command in a terminal on catkin workspace

`caktin build lab2rob22_1`

Then, source bash 

`source devel/setup.bash`

After this is done and with no errors showed you will be ready to run de scripts.

On the scripts folder there will be a python script named _KeyMove.py_ and 4 matlab scripts: *PX_Robot.m*, _matlabPub.m_, _matlabSub.m_ and _matlabConnectionROSnPX.m_.

# Python Script

The python script can be run using the following commands, on one terminal run:

`roslaunch lab2rob22_1 px_controllers.launch`

on other sourced terminal run:

`rosrun lab2rob22_1 KeyMove.py`

The first command wil enable the communication with the robot, the second one will launch the python script.

After this you should be able to control the robot using you laptop's keyboard:

- Using _W_ and _S_ you will move between articulations, it will work cyclical.

- Using _A_ and _D_ the choosen articulation will move 90 degrees to left or right.

- Using _R_ the choosen articulation will go home.

- Using _H_ the robot will go home.

Also, if you run the next command in other terminal you will visualize the robot in rviz:

`roslaunch lab2rob22_1 px_rviz_dyna.launch`

This is how it'll see on your pc's screen

<a href="https://ibb.co/nDsby4Z"><img src="https://i.ibb.co/jLvTYqB/rvix-Python.png" alt="rvix-Python" border="0"></a>

You will see the video of the robot moving with the keyboard [here](__ENLACE VIDEO TECLADO__).

Again, after running this script the terminal will be bugged and won't show any text.

The script is simple: first we import some libraries to python.










After having installed the software mentioned there go to your catkin workspace and on the src folder clone this repo, you can follow the next commands in terminal: 

`cd catkin_ws/src` 

`git clone https://github.com/nicolasgil95/Lab1Rob_22.1`

Once cloned has finished, go back to Catkin workspace directory and build the package. This can be done with the following commands: 

`cd ..` 

`caktin build Lab1Rob_22.1` 

In case you haven't installed Catkin tools you can run `catkin_make` to build the package.

__Be sure you don't have any other package with the name hello_turtle in the Catkin source folder because it will show an error when compiling__


Anyway, after that's done you're ready to check and run the new scripts. 



Then, you can analyse the visualization of the manipulator in RViz, in such a way that all the movements are evidenced. This can be done with the following commands: 

`rosrun rviz` 

__This is the link to watch the video:
https://youtube.com/shorts/hQJ9POvi2n4
- - -
### Using the MATLAB script
__This is the link to watch the video:
https://youtu.be/wtryydCzOSE

First of all, for using both of the scripts you will need to start a ROS master node To do that we need two terminal sessions. 



Robot at home

<a href="https://ibb.co/KjLkTC2"><img src="https://i.ibb.co/nsnvxh7/H.jpg" alt="H" border="0"></a>

You can see some of the robot configurations in the next image

<a href="https://ibb.co/4pyNcKp"><img src="https://i.ibb.co/qpG1z7p/f1.jpg" alt="f1" border="0"></a>

Additionally, we can watch another position about the tool of work 

<a href="https://ibb.co/VYHPFTV"><img src="https://i.ibb.co/Mk83z7n/f2.jpg" alt="f2" border="0"></a>
- - - 
### Python script
__This is the link to watch the video:
https://youtu.be/rZpshr-DT9Q

To run the python script you must keep the previous executed terminals open and running. On a new terminal run the following command once you're on the catkin workspace directory:  

`source devel/setup.bash` 

This will make this terminal session load the scripts of the packages inside the catkin workspace folder. 

Also, we can call the reset the turtlesim window just to make it look nicer. If you want to, run this commands: 

`rosservice call /reset` 

or, if you like the current turtle model, 

`

Check the turtlesim window as you press the previously mentioned keys to see the movement. Once you saw the turtle moving can close using _Esc_. 

__There's a bug using this file that, after closing the interaction, the terminal session where the file was executed will no show the text write onto it but it'll be recorded anyway.__ 

--- 
## Conclusions
- After doing the scripts we have understood how to connect MATLAB to ROS master node and the to use the topics and services. Also we can start creating scripts for ROS packages in Python and use the services and topics.

- It was possible to know the main ROS commands, and the importance of its nodes to be connected in both Matlab and Python.

- Be careful when starting the robot's motors, as this can be dangerous.

