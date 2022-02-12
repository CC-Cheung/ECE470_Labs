
function H = forward(joint,myrobot)
    BigH = eye(4)
    for i = 1:length(joint)
        d = myrobot.d(i);
        a = myrobot.alpha(i);
        b = myrobot.a(i)
        t = joint(i);
        H = [cos(t) -sin(t)*cos(a) sin(t)*sin(a) b*cos(t);
            sin(t) cos(t)*cos(a) -cos(t)*sin(a) b*sin(t);
            0 sin(a) cos(a) d;
            0 0 0 1];
        
        BigH = BigH * H;
        BigH;
    end
    H = BigH;
end    


