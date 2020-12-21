# Ball-N-Plate-Team-1

# 1- INTRODUCTION

  For this project we used a controller to help balance a ball on a plate system that must be designed using Matlab, Simulink and Coppelia. The overall goal of this system is keep   a ball balanced at the center of the plate and must be able to react accordingly to the ball’s position to avoid the ball rolling off the plate. 

# 2- SYSTEM MODELING

In the Figure ( ) is the ball and plate system free body diagram that is being used. To find the nonlinear equation of motion Eq (1) was obtained by using the free body diagram. Also Eq (2) and Eq (3) were found using the geometry in the figure ( ). 

<img width="370" alt="model1" src="https://user-images.githubusercontent.com/76410573/102726544-76e2b100-42d4-11eb-9b7c-9d6543911034.png">
Figure 1. Ball and Plate System

<br>
<br>

<img width="470" alt="equations1" src="https://user-images.githubusercontent.com/76410573/102726924-36d0fd80-42d7-11eb-9852-108088fde928.png">
Table 1: Equations Used
<br>
<br>
Using the nonlinear equation of a motion shown in Eq (4) it was then linearized by doing sin(theta) = 0 , which can be written as shown in Eq (5). Next, the transfer function, Eq (7), for one motor was found by taking the Laplace transform of the linearized equation, Eq (6). This transfer function equation will also be used for the second motor as well.
<br>
<br>
<img width="473" alt="equations2" src="https://user-images.githubusercontent.com/76410573/102726966-844d6a80-42d7-11eb-80d1-2a52e31be046.png">
Table 2: Equations Used Continue
<br>
<br>
<header>
  Transfer Function 
<br>
   a. Transfer function for 1 servo where (s) is the rotation of the motor in rads, and the output is R(s) = ball position.
</header>
<img width="470" alt="equation8" src="https://user-images.githubusercontent.com/76410573/102728117-c6c67580-42de-11eb-85e0-9a8bb302fb3f.png">
    
</header>

# 3- CONTROLLER DESIGN & MODEL SIMULINK

3.1) PID Controller
  <br>
    The design that was chosen was to use a 5% overshoot and 3.5 seconds of settling time. We decided to use a PID controller instead of a lead compensation controller for the reason the PID controller will rectify the response time in the unstable system. In Figure the plate will get a step response that the ball will fall off the plate. Then the PID controller will take the step response and calculate the settling time in figure , which will serve for the motors to adjust the plate before the ball has reached the position.
<br> 
<br>
Specifications for the controller: 
<br>
a. %OS =< 5%
<br>
b. Ts < 3.5 sec
<br>
<br>
The following equation was used to calculate the overshoot percentage from the graph in figure:
<img width="470" alt="equation9" src="https://user-images.githubusercontent.com/76410573/102728542-5a00aa80-42e1-11eb-9936-5002d1185d9c.png">
<br>
<br>
3.1.1) Checking Step Response
<br><br>
3.1.1a) System is Unstable
<br>
<br>
<img width="470" alt="StepResponseofTransferFunction" src="https://user-images.githubusercontent.com/76410573/102728719-4275f180-42e2-11eb-8d1d-565fe2e7d298.png">
<br>
<br>
Figure 2. Step Response of Transfer Function
<br>
<br>
3.1.1b) PID Implementation
<br>
<br>
<img width="470" alt="StepResponseImplementingPIDController" src="https://user-images.githubusercontent.com/76410573/102728880-04c59880-42e3-11eb-80bb-a3b8fdc4d214.png">
<br>
<br>
Figure 3: Step Response Implementing PID Controller
<br>
<br>
After the amplitude was calculated from Matlab next did some hand calculations to find the % Overshoot. As shown in figure 3, the % Overshoot came out to be %OS = 2%. Also settling time was around 1.5 seconds, which is a lot less than the required 3.5 seconds.
<br><br>
3.1.2) MATLAB code for PID in system
<br>
<img width="470" alt="MatlabForPID" src="https://user-images.githubusercontent.com/76410573/102729128-3be87980-42e4-11eb-8114-865a35de4977.png">
<br> <br>
3.2) Simulink
<br>
<br>
3.2.1) Mathematical Model
<br>
In this project, a  Lagrangian  mathematical approach was used to apprehend the dynamic of this system. The kinetic energy principle was also used to expand the equation of motion. A derivation of the kinetic equation of the ball, beam, and the potential  energy of the system enabled the team to express the equation of motion from the Langrangian of this system. 
<br>
<img width="470" alt="Equation10" src="https://user-images.githubusercontent.com/76410573/102729387-6b4bb600-42e5-11eb-8c80-7025e343df97.png">
<br>
Whereas L represents the Lagrangian, K represents the kinetic energy and U represents the potential energy.  Considering the ball and the plate are incontact all  the time; the equation of motion derived from L  will become:
<br>
<img width="470" alt="Equation10" src="https://user-images.githubusercontent.com/76410573/102729596-2bd19980-42e6-11eb-95a3-be72c5f55cc7.png">
<br><br>
Considering a one dimensional ball and beam system, the variables used are defined below:
<br><br>
a. Ball and plate sub-system Parameters:
<br>
<br>
<img width="470" alt="Table3ModelParameters" src="https://user-images.githubusercontent.com/76410573/102730040-0d6c9d80-42e8-11eb-9bd6-bee86d1564f1.png">
<br>
Table 3: Model Parameters
<br>
<br>
In this modeling, friction will be neglected, and the team will assume that no slippage will occur between the ball and the plate. The motion of the ball will be represented using these following equations:
<br>
<br>
<img width="470" alt="Equations12-15" src="https://user-images.githubusercontent.com/76410573/102730139-6e947100-42e8-11eb-912a-b1382ca80a36.png">
<br>
<br>
b. Simulink Models
<br>
MatLab Simulink was used to simulate the control system. The block diagram was created on simulink  to illustrate the ball’s motion. the output will come out as a step response simulation of the system.
<br>
<br>
In figure 4, the simulink model represents the system with the addition of figure 5, which is used to calibrate the system. This provides feedback to the PID controller, and the output of the PID controller becomes the output for out.theta and out.theta1 . Later, once the system has been calibrated, the Ball and Plate Model can be removed, and the system will work as shown in figure 6.



# 4- CONTROLLER IMPLEMENTATION

