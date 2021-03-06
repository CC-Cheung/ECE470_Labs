% 4.4
function q = inverse_kuka(H,myrobot)
%   coordinates of the wrist
    cordsc = H(1:3,4)-H(1:3,1:3)*[myrobot.a(6); 0; myrobot.d(6)] ;
    
    xc = cordsc(1);
    yc = cordsc(2);
    zc = cordsc(3);
    d1=myrobot.d(1);
    d4=myrobot.d(4);
    
    a1=myrobot.a(1);
    a2=myrobot.a(2);
    a3=myrobot.a(3);
    
    
    
%   inverse kinematics from robot base to wrist
    theta1= atan2(yc,xc);
    
    b=zc-d1;
    f=(xc^2+yc^2)^0.5-a1;
    c=(a3^2+d4^2)^0.5;
    
    D = (a2^2+b^2+f^2-c^2)/(2*a2*(b^2+f^2)^0.5);
    theta2= atan2((1-D^2)^0.5, D) + atan2(b,f);%y first;
    
    E = (a2^2+c^2-f^2-b^2)/(2*a2*c);
    

    theta3=atan2((1-E^2)^0.5, E)-atan2(a3, d4)-pi/2;
    
    joints = [theta1,theta2,theta3];
    
%   get the rotation matrix of the wrist
    H3 = transpose(forward_kuka(joints,myrobot));
    R = (H3*H);
    R = R(1:3,1:3);
    
%   inverse kinematics from the wrist onwards
    theta4=atan2(R(2,3),R(1,3));
    theta5=atan2(real(sqrt(1-R(3,3)^2)),R(3,3));
    theta6=atan2(R(3,2),-R(3,1));
    q= [theta1 theta2 theta3 theta4 theta5 theta6];

end    