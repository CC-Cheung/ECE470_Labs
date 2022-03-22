function tau = att(q,q2,myrobot)
     %1=robot, 2=desired
     H1 = [];
     H2 = [];
     for i = 1:length(q)         
         H1 = cat(3,H1,forward(q(1:i),myrobot));
         H2 = cat(3,H2,forward(q2(1:i),myrobot));         
         
     end
     
%   Intialize tau     
    tau =[0;0;0;0;0;0];
     
    for i = 1:length(q)
        
        J=[];

%       Z00=001
        Z = [0;0;1];
        temp = cross(Z,H1(1:3,4,i));
        J = [J temp];

%       Rest of the Js
        for j = 2:i
            Z = H1(1:3,3,j-1);
            temp = cross(Z,H1(1:3,4,i)-H1(1:3,4,j-1));
            J = [J temp];
        end
        
%       Fill the Rest with 0s
        for j = 1:6-i
            J =[J [0 ;0 ;0]];
        end

        %calculating the force
        F = -(H1(1:3,4,i)-H2(1:3,4,i));

%       Accumulate Tau
        tau = tau +  J.' * F;
        
    end
 
    tau = tau/norm(tau);
end    
