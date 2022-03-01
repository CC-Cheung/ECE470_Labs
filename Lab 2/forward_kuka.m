% 4.3
function H = forward_kuka(q,myrobot)
%   Accumulator BigH accumulates all the Hs
    BigH = eye(4)
    for i = 1:length(q)
        d = myrobot.d(i);
        a = myrobot.alpha(i);
        b = myrobot.a(i)
        t = q(i);
        
%       From DH table to roto-translation
        H = [cos(t) -sin(t)*cos(a) sin(t)*sin(a) b*cos(t);
            sin(t) cos(t)*cos(a) -cos(t)*sin(a) b*sin(t);
            0 sin(a) cos(a) d;
            0 0 0 1];        
        BigH = BigH * H;
    end
    H = BigH;
end    


