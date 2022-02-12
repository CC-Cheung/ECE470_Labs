close all
theta1 = linspace(0,pi,200);
theta2 = linspace(0,pi/2,200);
theta3 = linspace(0,pi,200);
theta4 = linspace(pi/4,3*pi/4,200);
theta5 = linspace(-pi/3,pi/3,200);
theta6 = linspace(0,2*pi,200);

% q =transpose([theta1; theta2; theta3; theta4; theta5; theta6]);
% 
 dh =[0 76 0 pi/2 ;
     0 -23.65 43.23 0 ;
     0 0 0 pi/2 ;
     0 43.18 0 -pi/2 ;
     0 0 0 pi/2 ;
     0 20 0 0 ]
% 
 myrobot = mypuma560(dh);
% 
% forward(q(i,:).',myrobot)
% row1 = q(200,:).';
% o= []
% for i = 1:200
%     cords = forward(q(i,:).',myrobot);
%     o =[o; cords(1:3,4).'];
%     
% end
% figure
% 
% cos(pi)
% 
% plot3(o(:,1),o(:,2),o(:,3))
% hold on
% plot(myrobot,q);

x = linspace(10,30,100).'
y = linspace(23,30,100).'
z = linspace(15,100,100).'
d = [x,y,z]
t = pi/4

Rotate = [cos(t) -sin(t) 0; sin(t) cos(t) 0; 0 0 1]

H= [cos(pi/4) -sin(pi/4) 0 20; sin(pi/4) cos(pi/4) 0 23; 0 0 1 15; 0 0 0 1]

q = inverse(H,myrobot)

o= []
for i = 1:100
    newH = [Rotate d(i,:).'; 0 0 0 1]
    joints = inverse(newH,myrobot);
    o =[o; joints];
    
end

plot(myrobot,o);