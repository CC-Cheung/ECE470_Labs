function tau = rep(q,myrobot,obs)


     H1 = [];
     
     for i = 1:length(q)
         
         H1 = cat(3,H1,forward(q(1:i),myrobot));
         
     end
     
     
    tau =[0;0;0;0;0;0];
     
    for i = 1:length(q)
        
        J=[];
        
        Z = [0;0;1];
        temp = cross(Z,H1(1:3,4,i));
        J = [J temp];
        
        for j = 2:i
            
            Z = H1(1:3,3,j-1);
            temp = cross(Z,H1(1:3,4,i)-H1(1:3,4,j-1));
            J = [J temp];
            
        end
        
        for j = 1:6-i
            J =[J [0 ;0 ;0]];
        
        end
        %calculating the force
        F=[0;0;0];
        for obj = obs
            
            F_temp=[0;0;0];
            C =[];
            if obj.type =='cyl'
                C = [obj.c;H1(3,4,i)];
            else
                C = obj.c;
            end
            
            B =C+obj.R*(H1(1:3,4,i)-C)/norm(H1(1:3,4,i)-C);
            dist = norm(H1(1:3,4,i)-B);
            if dist < obj.rho0
                
                F_temp = (1/dist - 1/obj.rho0)*(1/(dist^2)) * (H1(1:3,4,i)-B)/dist;
                

            end
            
            
           F = F +F_temp;
        end
        
       
        
        tau = tau +  J.' * F;
        
        
        
        
        
        
    end
 
    tau = tau/norm(tau);

end    
