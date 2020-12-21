clc
clear
m = 0.111;
R = 0.015;
g = -9.8;
L = 1.0;
d = 0.03;
J = 9.99e-6;

s = tf('s');
P_bb = (-m*g*d/L/(J/R^2+m)/s^2)

Kp = 15;%gain%
Kd = 50;%derivative%
Ki=0;%integral
C = pid(Kp,Ki,Kd);
sys_cl=feedback(C*P_bb,1)
step(0.001*sys_cl)%
