function q = inverse(H,myrobot)

    cords = H(1:3,4)-H(1:3,1:3)*[0; 0; myrobot.d(6)]
    
    xc = cords(1)
    yc = cords(2)
    zc = cords(3)
    d2=myrobot.d(2)
    d1=myrobot.d(1)
    theta1= atan2(yc,xc)-atan2(-d2,real(sqrt(xc^2+yc^2-d2^2)))
    D = (xc^2+yc^2-d2^2+(zc-d1)^2-myrobot.a(2)^2-myrobot.d(4)^2) / (2*myrobot.a(2)*myrobot.d(4))
    theta3=atan2(D,real(sqrt(1-D^2)))
    theta2= atan2(zc-d1,real(sqrt(xc^2+yc^2-d2^2))) - atan2(-myrobot.d(4)*cos(theta3),myrobot.a(2)+myrobot.d(4)*sin(theta3))

    joints = [theta1,theta2,theta3]
    H3 = transpose(forward(joints,myrobot))
    R = (H3*H)
    R = R(1:3,1:3)
    theta4=atan2(R(2,3),R(1,3))
    theta5=atan2(real(sqrt(1-R(3,3)^2)),R(3,3))
    theta6=atan2(R(3,2),-R(3,1))
    q= [theta1 theta2 theta3 theta4 theta5 theta6]

end    