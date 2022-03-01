% 3.3
function myrobot = mykuka(DH)
    %Just use constructor with the DH table. (theta, d, a, alpha)
    myrobot=SerialLink(DH, 'name', 'Robot McRobotFace');
end    



