% 4.1
function myrobot = mypuma560(DH)
    %Just use constructor with the DH table. (theta, d, a, alpha)
    myrobot=SerialLink(DH, 'name', 'Robot McRobotFace');
end    



