clc
clear
%remote API functionality to connect to copelliasim%

coppelia=remApi('remoteApi');%build object and load the library%
coppelia.simxFinish(-1);%enable the remote API on the client side%
clientID=coppelia.simxStart(IP_ADDRESS,19999,true,true,5000,5);%remote API%
if (clientID>-1) %conditional% 
     disp('Connected to remote API server');
     set_param('ball_and_plate','SimulationCommand','start') 
    
     %joints
     h=[0,0];
        %servo motor rotate in y-axis
        [r,h(1)]=coppelia.simxGetObjectHandle(clientID, 'RotateY0',coppelia.simx_opmode_blocking);
        %servo motor rotate in x-axis
        [r,h(2)]=coppelia.simxGetObjectHandle(clientID, 'RotateX',coppelia.simx_opmode_blocking);
       
     while true
     [res,retInts,x_y_coords,retStrings,retBuffer]=coppelia.simxCallScriptFunction(clientID,'Cam',coppelia.sim_scripttype_childscript,'CoordCalc',[],[],[],'',coppelia.simx_opmode_blocking);
     
     %set parameter to specific block object%
     set_param(BALL_PLATE_OBJECT,'Value',ParameterName);
     set_param(BALL_PLATE_OBJECT,'Value',ParameterName);
     
     %obtain block's run-time object%
     x=get_param(Object,'RuntimeObject');
     X1= (x.InputPort(1).Data * 10000);
     
     y=get_param(Object,'RuntimeObject');
     Y1= (y.InputPort(1).Data * 10000);
     
     %set the positions for joints
     coppelia.simxSetJointTargetPosition(clientID,h(2),X1,coppelia.simx_opmode_streaming)
     coppelia.simxSetJointTargetPosition(clientID,h(1),Y1,coppelia.simx_opmode_streaming)
     
     end
else
      disp('Failed connecting to remote API server');
end
    coppelia.delete(); % call the destructor!
    
    disp('Program ended');