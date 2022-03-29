%Setup
%New DH Table
dh =[0 400 25 pi/2 ;
     0 0 315 0 ;
     0 0 35 pi/2 ;
     0 365 0 -pi/2 ;
     0 0 0 pi/2 ;
     0 161.44 -296.23 0 ];
DHForces=dh;
DHForces(6,3)=0;
myrobot = mykuka(dh);
myrobotForces=mykuka(DHForces);
setupobstacle_lab4prep
% This is the final joint variable vector

tau = rep([pi/10,pi/12,pi/6,pi/2,pi/2,-pi/6],myrobotForces,prepobs)

% %tau = 
%    -0.9050
%    -0.0229
%    -0.4003
%    -0.0977
%     0.1034
%    -0.0000 
% 
% %3.2
% qref = motionplan(q1,q2,0,10,myrobot,[],0.01);
% t=linspace(0,10,300);
% q = ppval(qref,t)';
% plot(myrobot,q)
% 
% %3.3
% setupobstacle
% q3 = 0.9*q1+0.1*q2;
% %We take a cell instead of the object so it's obs(1), not obs {1}
% tau = rep(q3,myrobot,obs(1)) % This tests the torque for the cylinder obstacle
% %tau=0.9950
% %     0.0291
% %    -0.0504
% %     0.0790
% %     0.0197
% %     0.0000
% 
% %sphere
% q = [pi/2 pi 1.2*pi 0 0 0];
% tau = rep(q,myrobot,obs(6))
% % %tau=-0.1138
% %    -0.2140
% %    -0.9702
% %     0.0000
% %    -0.0037
% %     0.0000
% 
% %Final
% setupobstacle
% hold on
% axis([-100 100 -100 100 0 200])
% view(-32,50)
% plotobstacle(obs);
% qref = motionplan(q1,q2,0,10,myrobot,obs,0.01);
% t=linspace(0,10,300);
% q=ppval(qref,t)';
% plot(myrobot,q);
% hold off
