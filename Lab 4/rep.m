function tau = rep(q,myrobot,obs)
    %obs is a cell array, not an object
    %Get all the Hs of the joints
    H = [];     
    for i = 1:length(q)         
         H = cat(3,H,forward(q(1:i),myrobot));         
    end
     
%    Intialize tau
    tau =[0;0;0;0;0;0];
     
    for i = 1:length(q)
        
        J=[];

%       Z00=001
        Z = [0;0;1];
        temp = cross(Z,H(1:3,4,i));
        J = [J temp];
        
%       Rest of the Js
        for j = 2:i            
            Z = H(1:3,3,j-1);
            temp = cross(Z,H(1:3,4,i)-H(1:3,4,j-1));
            J = [J temp];            
        end
        
%       Fill the Rest with 0s
        for j = 1:6-i
            J =[J [0 ;0 ;0]];        
        end

        %calculating the force
        F=[0;0;0];
        for  j = 1:length(obs)
            obj=obs{j};
            F_temp=[0;0;0];
            C =[];
            if obj.type =='cyl'
%               Same coordinates except z is the z of the object
                C = [obj.c;H(3,4,i)];
                B =C+obj.R*(H(1:3,4,i)-C)/norm(H(1:3,4,i)-C);

                if H(3,4,i)>obj.h                    
                    B(3)=obj.h;
                end

            elseif obj.type =='sph'
                C = obj.c;
                B =C+obj.R*(H(1:3,4,i)-C)/norm(H(1:3,4,i)-C);
            elseif obj.type =='pla'
                B = [H(1:2,4,i), obj.h];%h is how high it is
            end
            
            dist = norm(H(1:3,4,i)-B);
            %If within range
            if dist < obj.rho0                
                F_temp = (1/dist - 1/obj.rho0)*(1/(dist^2)) * (H(1:3,4,i)-B)/dist;  
            end
            
%           Accumulate Force
            F = F +F_temp;
        end

%       Accumulate Tau
        tau = tau +  J.' * F;
        
    end
    if norm(tau)~=0
        tau = tau/norm(tau);
    end

end    
