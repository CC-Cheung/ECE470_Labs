%Setup
dh =[0 76 0 pi/2 ;
     0 -23.65 43.23 0 ;
     0 0 0 pi/2 ;
     0 43.18 0 -pi/2 ;
     0 0 0 pi/2 ;
     0 20 0 0 ];
myrobot = mypuma560(dh);
H1 = eul2tr([0 pi pi/2]); % eul2tr converts ZYZ Euler angles to a hom. tsf. mtx
H1(1:3,4)=100*[-1; 3; 3;]/4; % This assigns the desired displacement to the hom.tsf.mtx.
q1 = inverse(H1,myrobot);

% 3.1
% This is the starting joint variable vector.
H2 = eul2tr([0 pi -pi/2]);
H2(1:3,4)=100*[3; -1; 2;]/4;
q2 = inverse(H2,myrobot);

% This is the final joint variable vector
tau = att(q1,q2,myrobot)
% %tau = 
%    -0.9050
%    -0.0229
%    -0.4003
%    -0.0977
%     0.1034
%    -0.0000 

%3.2
qref = motionplan(q1,q2,0,10,myrobot,[],0.01);
t=linspace(0,10,300);
q = ppval(qref,t)';
plot(myrobot,q)

%3.3
setupobstacle
q3 = 0.9*q1+0.1*q2;
%We take a cell instead of the object so it's obs(1), not obs {1}
tau = rep(q3,myrobot,obs(1)) % This tests the torque for the cylinder obstacle
%tau=0.9950
%     0.0291
%    -0.0504
%     0.0790
%     0.0197
%     0.0000

%sphere
q = [pi/2 pi 1.2*pi 0 0 0];
tau = rep(q,myrobot,obs(6))
% %tau=-0.1138
%    -0.2140
%    -0.9702
%     0.0000
%    -0.0037
%     0.0000

%Final
setupobstacle
hold on
axis([-100 100 -100 100 0 200])
view(-32,50)
plotobstacle(obs);
qref = motionplan(q1,q2,0,10,myrobot,obs,0.01);
t=linspace(0,10,300);
q=ppval(qref,t)';
plot(myrobot,q);
hold off
