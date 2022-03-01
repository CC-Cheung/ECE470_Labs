close all

%4.2
%Thetas
theta1 = linspace(0,pi,200);
theta2 = linspace(0,pi/2,200);
theta3 = linspace(0,pi,200);
theta4 = linspace(pi/4,3*pi/4,200);
theta5 = linspace(-pi/3,pi/3,200);
theta6 = linspace(0,2*pi,200);

q =transpose([theta1; theta2; theta3; theta4; theta5; theta6]);

%Make myrobot
dh =[0 400 25 pi/2 ;
     0 0 315 0 ;
     0 0 35 pi/2 ;
     0 365 0 -pi/2 ;
     0 0 0 pi/2 ;
     0 161.64 0 0 ]

%3.3 prelab
myrobot = mykuka(dh);
H=forward_kuka([pi/5 pi/3 -pi/4 pi/4 pi/3 pi/4]', myrobot)
inverse_kuka(H, myrobot);
