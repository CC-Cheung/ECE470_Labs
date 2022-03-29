function qref = motionplan(q0,q2,t1,t2,myrobot,obs,tol)

    q=q0;
    alpha = 0.01;
    while norm(q(end,1:5)-q2(1:5))>=tol 
        newq = q(end,:)+alpha*(att(q(end,:),q2,myrobot).'+rep(q(end,:),myrobot,obs).');
        
        q = [q;newq];
        
        norm(q(end,1:5)-q2(1:5));
        
    end
    
    q(:,6) = linspace(q0(6),q2(6),size(q,1));
    t = linspace(t1,t2,size(q,1));
    qref = spline(t,q'); % defines a spline object with interpolation
    % times in t and interpolation values the columns of q

        



end