close all
% 
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
dh =[0 76 0 pi/2 ;
     0 -23.65 43.23 0 ;
     0 0 0 pi/2 ;
     0 43.18 0 -pi/2 ;
     0 0 0 pi/2 ;
     0 20 0 0 ]
myrobot = mypuma560(dh);
% 
% plot(myrobot,q);
% 
% 
% % 4.3
% % Accumulate all the coordinates of the wrist
% o= []
% for i = 1:200
%     cords = forward(q(i,:).',myrobot);
%     o =[o; cords(1:3,4).'];    
% end
% 
% plot3(o(:,1),o(:,2),o(:,3))
% hold on
% plot(myrobot,q);
% 
% 
% % 4.4
% % Test if inverse works
% H= [cos(pi/4) -sin(pi/4) 0 20; sin(pi/4) cos(pi/4) 0 23; 0 0 1 15; 0 0 0 1]
% q = inverse(H,myrobot)

% Desired path
x = linspace(10,30,100).'
y = linspace(23,30,100).'
z = linspace(15,100,100).'
d = [x,y,z]

% Desired Orientation
theta = pi/4
Rotate = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1]

% Accumulate the joint angles
q= []
for i = 1:100
    newH = [Rotate d(i,:).'; 0 0 0 1]
    joints = inverse(newH,myrobot);
    q =[q; joints];
    
end
plot(myrobot,q);