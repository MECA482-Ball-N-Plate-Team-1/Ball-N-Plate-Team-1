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
<br>
3.1.1a) System is Unstable
https://user-images.githubusercontent.com/76410573/102728719-4275f180-42e2-11eb-8d1d-565fe2e7d298.png

# 4- CONTROLLER IMPLEMENTATION

