% 3.3
function myrobot = mykuka_search(delta)
    %Just use constructor with the DH table. (theta, d, a, alpha)
    %delta for a and d6
    DH =[0 400 25 pi/2 ;
     0 0 315 0 ;
     0 0 35 pi/2 ;
     0 365 0 -pi/2 ;
     0 0 0 pi/2 ;
     0 161.44 -296.23 0 ];
    DH(6,2)=DH(6,2)+delta(2);
    DH(6,3)=DH(6,3)+delta(1);
    myrobot=SerialLink(DH, 'name', 'Robot McRobotFace');
end    



