clear;clf;clc;
l=[1 1 1 1];
alpha=[pi/2 0 0 0];
a=[0 l(2) l(3) l(4)];
d=[l(1) 0 0 0];
offset=[0 pi/2 0 0];
Home=[0 0 0 0];
ws=[-(l(2)+l(3)+l(4))-1 (l(2)+l(3)+l(4))+1 -(l(2)+l(3)+l(4))-1 (l(2)+l(3)+l(4))+1 -1 (l(1)+l(2)+l(3)+l(4))+2];
%% Definicion Robot
L(1) = Link('revolute','alpha',alpha(1),'a',a(1),'d',d(1),'offset',offset(1),'qlim',[-3*pi/4 3*pi/4]);
L(2) = Link('revolute','alpha',alpha(2),'a',a(2),'d',d(2),'offset',offset(2),'qlim',[-3*pi/4 3*pi/4]);
L(3) = Link('revolute','alpha',alpha(3),'a',a(3),'d',d(3),'offset',offset(3),'qlim',[-3*pi/4 3*pi/4]);
L(4) = Link('revolute','alpha',alpha(4),'a',a(4),'d',d(4),'offset',offset(4),'qlim',[-3*pi/4 3*pi/4]);
PX=SerialLink(L);
PX.tool = [0 0 1 l(4); -1 0 0 0; 0 -1 0 0; 0 0 0 1];
%% Conexion con ROS y creacion de suscriptor
rosinit;

jointSub=rossubscriber('/joint_states','sensor_msgs/JointState'); %Creacion del suscriptor
jointSub.LatestMessage

%% Creacion de comunicacion con servicio
PxCommSrv= rossvcclient('/dynamixel_workbench/dynamixel_command'); %creacion cliente de servicio
CommandMsg= rosmessage(PxCommSrv);  %Creacion del mensaje 

CommandMsg.id=3 %def def ID motor a mover
CommandMsg.add_name='Goal_Position' %def nombre del registro a usar
CommandMsg.value = 715 %def angulo, 715b=53.5254°

call(PxCommSrv,CommandMsg)%llamado al servicio con msj definido


%% definicion de posicion de articulaciones
q=[0 0 0 0];

% envio de posicion a robot fisico
for i=1:4
    CommandMsg.id=i;
    CommandMsg.add_name='Goal_Position';
    CommandMsg.value=(q(i)+135/(270/1024));
    call(PxCommSrv,CommandMsg);
end

%Lectura posicion del robot
Q=jointSub.LatestMessage.Position;

%Grafica de las posiciones actuales del robot
PX.plot(Q','workspace',ws,'noname')

%% Apagado del nodo
rosshutdown;